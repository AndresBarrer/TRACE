# Used to look up students through search box
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Used to web scrape
from linkedin_api import Linkedin

import shutil

# Uses to login to linkedin
from linkedinAccount import account
from linkedinAccount import password


# Set a random delay in between scrapes
import random
import time

import re

# Create Chrome web driver
executable_path = shutil.which('chromedriver')
driver = webdriver.Chrome(executable_path)
driver.get("https://www.linkedin.com/uas/login")
time.sleep(3)

# Log in to LinkedIn with Chrome web driver
email_input = driver.find_element(By.ID, "username")
email_input.send_keys(account)
password_input = driver.find_element(By.ID, "password")
password_input.send_keys(password)
password_input.send_keys(Keys.RETURN)

# Navigate to specified URL
driver.get("https://www.linkedin.com/school/universidad-aut%C3%B3noma-de-baja-california/people/")

# Give time for the webpage to load, and to not be suspicious lol
time.sleep(3);

# Find the search text box
search_box = driver.find_element(By.ID, "people-search-keywords")

# Pass name of student into text box
search_box.send_keys("Julio Gambino")

# Hit Enter to search
search_box.send_keys(Keys.RETURN)

time.sleep(3)
try:
    # Try to locate and click the first search result
    result = driver.find_element(By.CLASS_NAME, "org-people-profile-card__profile-info")
    result.click()

    time.sleep(3)
    # Get the URL of the student
    current_url = driver.current_url
    profile = re.search(r'/in/([^/]+)/', current_url)
    profile = profile.group(1)
    print(profile)
except NoSuchElementException:
    pass



time.sleep(3)
# Used to login to linkedin
api = Linkedin(account, password)

# Used to get account profile from URL username
user = api.get_profile(profile)

# Variables needed to store returned dictionary values from scrape
firstName = user['firstName']
lastName = user['lastName']
geoLocationName = user['geoLocationName']
geoCountryName = user['geoCountryName']
title = "N/A"
companyName = "N/A"

# Check if "experience" exists in the user's profile
if 'experience' in user:
    # Get the first entry from the "experience" list
    first_experience = user['experience'][0]  # Assumes at least one entry exists

    # Extract "companyName" and "title" from the first entry
    companyName = first_experience.get('companyName')
    title = first_experience.get('title')

# Print obtained student info
print("Student: " + firstName + " " + lastName)
print("Located in: " + geoLocationName)
print("Occupation: " + title + " at " + companyName)



# Needed to get coordinates of user location
from geopy.geocoders import Nominatim

# Needed to generate heatmap of user location
import folium
from folium.plugins import HeatMap

map = folium.Map(location = [38.27312, -98.5821872], zoom_start = 5)

geolocator = Nominatim(user_agent="TRACE")
location = geolocator.geocode(query = geoLocationName)

location_lat_lon = [location.latitude, location.longitude]
HeatMap([location_lat_lon]).add_to(map)

# Display the map
map.save("heatmap.html")
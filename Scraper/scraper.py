# Used to look up students through search box
from selenium import webdriver

# Used to web scrape
from linkedin_api import Linkedin

# Uses to login to linkedin
from linkedinAccount import password
from linkedinAccount import account

# Set a random delay in between scrapes
import random
import time

# Create Chrome web driver
driver = webdriver.Chrome()

# Navigate to specified URL
driver.get("https://www.linkedin.com/school/universidad-aut%C3%B3noma-de-baja-california/people/")

# Give time for the webpage to load, and to not be suspicious lol
time.sleep(3);

# Find the search text box
search_box = driver.find_element_by_id("people-search-keywords")

# Pass name of student into text box
search_box.send_keys("Name goes here")

# Hit Enter to search
search_box.submit();

time.sleep(3)
try:
    # Try to locate and click the first search result
    result = driver.find_element_by_id("ember829")
    result.click()

    time.sleep(3)
    # Get the URL of the student
    current_url = driver.current_url
    print(current_url)
except NoSuchElementException:
    pass




# Used to login to linkedin
api = Linkedin(account, password)

# Used to get account profile from URL username
profile = input("input user:")
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
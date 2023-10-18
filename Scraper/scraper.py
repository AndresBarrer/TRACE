from linkedin_api import Linkedin

# Uses to login to linkedin
from linkedinAccount import password
from linkedinAccount import account

# Set a random delay in between scrapes
import random
import time

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
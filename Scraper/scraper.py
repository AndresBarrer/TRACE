from linkedin_api import Linkedin
import time 
import json
api = Linkedin("", "")





profile = input("input user:")

user = api.get_profile(profile)
firstName = user['firstName']
lastName = user['lastName']
geoLocationName = user['geoLocationName']
GeoCountryName = user['geoCountryName']
title = "N/A"
companyName = "N/A"


# Check if "experience" exists in the user's profile
if 'experience' in user:
    # Get the first entry from the "experience" list
    first_experience = user['experience'][0]  # Assumes at least one entry exists

    # Extract "companyName" and "title" from the first entry
    companyName = first_experience.get('companyName')
    title = first_experience.get('title')


print("Student: " + firstName + " " + lastName)
print("Located in: " + geoLocationName)
print("Occupation: " + title + " at " + companyName)


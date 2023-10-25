<<<<<<< Updated upstream
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
=======
import csv
import sqlite3
import time
from selenium import webdriver
from linkedin_api import Linkedin
>>>>>>> Stashed changes
from geopy.geocoders import Nominatim
import folium
from folium.plugins import HeatMap
from linkedinAccount import account, password

def insert_student_to_database(cursor, matricula, nombre, apellido_p, apellido_m):
    """
    Inserts a student and their details into the database.

    Parameters:
        cursor (sqlite3.Cursor): Cursor used to navigate the SQL database.
        matricula (str): Matricula of the student to be inserted.
        nombre (str): Nombre of the student to be inserted.
        apellido_p (str): Apellido paterno of the student to be inserted.
        apellido_m (str): Apellido materno of the student to be inserted.
    """
    
    cursor.execute("INSERT INTO alumni (Matricula, Nombre, ApellidoP, ApellidoM) VALUES (?, ?, ?, ?)",
                   (matricula, nombre, apellido_p, apellido_m))


<<<<<<< Updated upstream
# Display the map
map.save("heatmap.html")
=======
# Used for when the student has not yet been added to the database
def get_student_info_from_database(cursor, matricula):
    """
    Get the student's name and last name from the database using their matricula.

    Parameters:
        cursor (sqlite3.Cursor): Cursor used to navigate the SQL database.
        matricula (str): ID of the student.

    Returns:
        tuple: A tuple containing the student's name (Nombre), last name (ApellidoP), and last name (ApellidoM),
        or (None, None, None) if not found in the database.
    """

    cursor.execute("SELECT Nombre, ApellidoP, ApellidoM FROM students WHERE Matricula=?", (matricula,))
    student_data = cursor.fetchone()
    if student_data:
        return student_data[0], student_data[1], student_data[2]
    return None, None, None



def getStudentURL(driver, student_name):
    """
    Get the URL of a student's LinkedIn profile based on their name.

    Parameters:
        driver (selenium.webdriver.Chrome): The Chrome Web Driver for Selenium.
        student_name (str): The name of the student to search for.

    Returns:
        str: The URL of the student's LinkedIn profile or None if not found.
    """

    driver.get("https://www.linkedin.com/school/universidad-aut%C3%B3noma-de-baja-california/people/")
    time.sleep(3)

    search_box = driver.find_element_by_id("people-search-keywords")
    search_box.send_keys(student_name)
    search_box.submit()
    time.sleep(3)

    try:
        result = driver.find_element_by_id("ember829")
        result.click()
        time.sleep(3)
        return driver.current_url
    except NoSuchElementException:
        return None


# MIGHT NOT NEED COUNTRY NAME, MODIFY DATABASE?
def update_student_info_in_database(cursor, matricula, geo_location_name, title, company_name):
    """
    Updates student information in the database with provided parameters.

    Parameters:
        cursor (sqlite3.Cursor): The cursor used to interact with the database.
        matricula (str): The unique ID of the student.
        geo_location_name (str): The location of the student.
        title (str): The job title of the student.
        company_name (str): The company name where the student works.

    Returns:
        None
    """
    
    cursor.execute("UPDATE alumni SET GeoLocationName=?, Puesto=?, Compania=? WHERE Matricula=?",
                   (geo_location_name, title, company_name, matricula))


def fetch_student_locations_from_database(cursor):
    """
    Fetches student locations from the database, geocodes them, and returns a list of coordinates.

    Parameters:
        cursor (sqlite3.Cursor): The cursor used to interact with the database.

    Returns:
        list: A list of latitude and longitude coordinates for valid student locations.
    """

    # Fetch only the GeoLocationName from the database
    cursor.execute("SELECT GeoLocationName FROM students")
    student_locations = cursor.fetchall()

    # Filter out locations with "N/A" and geocode them
    locations_lat_lon = []

    geolocator = Nominatim(user_agent="TRACE")

    for geo_location_name, in student_locations:
        if geo_location_name != "N/A":
            location = geolocator.geocode(query=geo_location_name)
            if location:
                location_lat_lon = [location.latitude, location.longitude]
                locations_lat_lon.append(location_lat_lon)

    return locations_lat_lon

def generate_heatmap(locations_lat_lon, output_file):
    """
    Generates a heatmap and saves it as an HTML file.

    Parameters:
        locations_lat_lon (list): List of latitude and longitude coordinates for locations.
        output_file (str): Name of the HTML file to save the heatmap.

    This function creates a Folium map, adds a heatmap layer using the provided coordinates, and saves the map as an HTML file with the given name.
    """

    # Create a Folium map
    map = folium.Map(location=[38.27312, -98.5821872], zoom_start=5)

    # Add a heatmap to the map
    HeatMap(locations_lat_lon).add_to(map)

    # Save the map as an HTML file
    map.save(output_file)


def main():

    # Create a connection to the database
    connection = sqlite3.connect('trace.sql')
    
    # Create a cursor to the database to make changes
    cursor = connection.cursor()

    # Open the csv file with read permissions
    with open("tablas-egresados.csv", "r") as file:
        csvreader = csv.reader(file)
        
        # Get basic info of each student in csv file
        for row in csvreader:
            matricula = row[0]
            nombre = row[5]
            apellido_paterno = row[3]
            apellido_materno = row[4]

            # Attempts to get Nombre, ApellidoP, ApellidoM
            existing_student = get_student_info_from_database(cursor, matricula)

            # If the student does not exist, insert into database
            if existing_student[0] is None:
                insert_student_to_database(cursor, matricula, nombre, apellido_paterno, apellido_materno)
                print(f"New student added: Matricula {matricula}, Name: {nombre}, Last Name: {apellido_paterno} {apellido_materno}")
            else:
                print(f"Student with ID {matricula} already exists in the database.")

    connection.commit()

    cursor.execute("SELECT Matricula, Nombre, ApellidoP FROM alumni")
    students = cursor.fetchall()

    driver = webdriver.Chrome()

    # Used to update the students info in the database
    for student in students:
        matricula, student_name, apellido_paterno = student
        current_url = getStudentURL(driver, student_name)

        api = Linkedin(account, password)
        user = api.get_profile(current_url)

        if 'firstName' in user:
            first_name = user['firstName']
        else:
            first_name = "N/A"
        if 'lastName' in user:
            last_name = user['lastName']
        else:
            last_name = "N/A"
        if 'geoLocationName' in user:
            geo_location_name = user['geoLocationName']
        else:
            geo_location_name = "N/A"

        title = "N/A"
        company_name = "N/A"

        if 'experience' in user:
            first_experience = user['experience'][0]  # Assumes at least one entry exists
            company_name = first_experience.get('companyName')
            title = first_experience.get('title')

        print(f"Student: {first_name} {last_name}")
        print(f"Located in: {geo_location_name}")
        print(f"Occupation: {title} at {company_name}")
        print(f"Matricula: {matricula}, Apellido Paterno: {apellido_paterno}")

        # Insert the additional information into the database
        update_student_info_in_database(cursor, matricula, geo_location_name, title, company_name)
        

    # Fetch and process student locations from the database
    locations_lat_lon = fetch_student_locations_from_database(cursor)

    # Generate and save the heatmap with the processed locations
    generate_heatmap(locations_lat_lon, "heatmap.html")

    connection.close()



if __name__ == "__main__":
    main()
>>>>>>> Stashed changes

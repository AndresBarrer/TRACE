import csv
import sqlite3
import time
from selenium import webdriver
from linkedin_api import Linkedin
from geopy.geocoders import Nominatim
import folium
from folium.plugins import HeatMap
from linkedinAccount import account, password
import mysql.connector
import os

# Used to look up students through search box
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import shutil
import re

# Used for when the student has not yet been added to the database
# Not in use but leaving if needed for the future
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

    cursor.execute("SELECT Nombre, ApellidoP, ApellidoM FROM alumni WHERE Matricula=?", (matricula,))
    student_data = cursor.fetchone()
    if student_data:
        return student_data[0], student_data[1], student_data[2]
    return None, None, None



def getStudentURL(driver, student_name, apellido_paterno):
    """
    Get the URL of a student's LinkedIn profile based on their name.

    Parameters:
        driver          (selenium.webdriver.Chrome): The Chrome Web Driver for Selenium.
        student_name    (str): The name of the student to search for.

    Returns:
        str: The URL of the student's LinkedIn profile or None if not found.
    """

    driver.get("https://www.linkedin.com/school/universidad-aut%C3%B3noma-de-baja-california/people/")
    time.sleep(2)

    search_box = driver.find_element(By.ID, "people-search-keywords")
    student = student_name + " " + apellido_paterno
    search_box.send_keys(student)
    search_box.send_keys(Keys.RETURN)

    time.sleep(2)

    result = driver.find_element(By.CSS_SELECTOR, '.org-people-profile-card__profile-info')
    result.click()

    time.sleep(2)
    return driver.current_url
 

def update_student_info_in_database(cursor, matricula, geo_location_name, geo_country_name, title, company_name):
    """
    Updates student information in the database with provided parameters.

    Parameters:
        cursor              (sqlite3.Cursor): The cursor used to interact with the database.
        matricula           (str): The unique ID of the student.
        geo_location_name   (str): The location of the student.
        title               (str): The job title of the student.
        company_name        (str): The company name where the student works.

    Returns:
        None
    """
    
    cursor.execute("UPDATE alumni SET GeoLocationName=?, GeoCountryName=?, Puesto=?, Compania=? WHERE Matricula=?",
                   (geo_location_name, geo_country_name,title, company_name, matricula))

'''
def main():

    # Connect to the database 
    db = mysql.connector.connect(
        host = "localhost",
        user = "root",
        password = "",
        database = "trace"
    )
    
    # Create a cursor to the database
    cursor = db.cursor()
    db.commit()

    cursor.execute("SELECT Matricula, Nombre, ApellidoP FROM alumni")   # SQL Query
    students = cursor.fetchall()                                        # Get all students that match query

    # Create Chrome web driver
    executable_path = shutil.which('chromedriver')  # Find the chrome driver
    driver = webdriver.Chrome(executable_path)      # Assign driver to variable 

    # Navigate to login to linkedin
    driver.get("https://www.linkedin.com/uas/login")
    time.sleep(3)

    # Log in to LinkedIn with Chrome web driver
    email_input = driver.find_element(By.ID, "username")        # Enter username
    email_input.send_keys(account)                              # Send username
    password_input = driver.find_element(By.ID, "password")     # Enter password
    password_input.send_keys(password)                          # Send password
    password_input.send_keys(Keys.RETURN)

    # Used to update the students info in the database
    for student in students:
        matricula, student_name, apellido_paterno = student
        current_url = getStudentURL(driver, student_name, apellido_paterno)
        print("Current URL: "+ current_url)

        # REGEX used to extract relevant information
        profile = re.search(r'/in/([^/]+)/', current_url)   
        profile = profile.group(1)                          
        print("Profile: " + profile)

        api = Linkedin(account, password)   # Log in to other api scraper
        user = api.get_profile(profile)     # Find user with profile

        # Find firstName, lastName, geoLocationName, geoCountryName, in found user data
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
        if 'geoCountryName' in user:
            geo_country_name = user['geoCountryName']
        else:
            geo_country_name = "N/A"

        # Set to empty for now, in case it isnt found in 'experience'
        title = "N/A"
        company_name = "N/A"

        if 'experience' in user:
            first_experience = user['experience'][0]  # Assumes at least one entry exists
            company_name = first_experience.get('companyName')
            title = first_experience.get('title')

        print(f"Student: {first_name} {last_name}")
        print(f"Located in: {geo_location_name}")
        print(f"Occupation: {title} at {company_name}")
        print(f"Matricula: {matricula}")

        # Insert the additional information into the database
        update_student_info_in_database(cursor, matricula, geo_location_name, geo_country_name, title, company_name)
        
    cursor.close()
    db.close()
    
    os.system("python heatmap.py")
'''

# Test 

def main():
    # Create Chrome web driver
    executable_path = shutil.which('chromedriver')

    # Find the chrome driver and assign it to a variable
    driver = webdriver.Chrome(executable_path)

    # Navigate to login to linkedin
    driver.get("https://www.linkedin.com/uas/login")
    time.sleep(3)

    # Log in to LinkedIn with Chrome web driver
    email_input = driver.find_element(By.ID, "username")        # Enter username
    email_input.send_keys(account)                              # Send username
    password_input = driver.find_element(By.ID, "password")     # Enter password
    password_input.send_keys(password)                          # Send password
    password_input.send_keys(Keys.RETURN)                       # Press ENTER


    student_name = "Andres"
    apellido_paterno = "Barrera"

    current_url = getStudentURL(driver, student_name, apellido_paterno)
    print("Current URL: "+ current_url)
    
    profile = re.search(r'/in/([^/]+)/', current_url)
    profile = profile.group(1)

    api = Linkedin(account, password)
    user = api.get_profile(profile)

    # Find firstName, lastName, geoLocationName, geoCountryName, in found user data
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
    if 'geoCountryName' in user:
        geo_country_name = user['geoCountryName']
    else:
        geo_country_name = "N/A"

    # Set to empty for now, in case it isnt found in 'experience'
    title = "N/A"
    company_name = "N/A"

    if 'experience' in user:
        first_experience = user['experience'][0]  # Assumes at least one entry exists
        company_name = first_experience.get('companyName')
        title = first_experience.get('title')

    print(f"Student: {first_name} {last_name}")
    print(f"Located in: {geo_location_name}")
    print(f"Occupation: {title} at {company_name}")


if __name__ == "__main__":
    main()
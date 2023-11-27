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
    time.sleep(3)

    search_box = driver.find_element_by_id("people-search-keywords")
    student = student_name + " " + apellido_paterno
    search_box.send_keys(student)
    search_box.submit()
    time.sleep(3)

    try:
        result = driver.find_element_by_id("ember829")
        result.click()
        time.sleep(3)
        return driver.current_url
    except NoSuchElementException:
        return None
 
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
    map = folium.Map(location=[38.27312, -98.5821872], zoom_start=4)

    # Define the maximum bounds for the map (worldwide bounds)
    max_bounds = [[-90, -180], [90, 180]]
    map.add_child(folium.LatLngPopup())
    map.fit_bounds(max_bounds)
    
    # Add a heatmap to the map
    HeatMap(locations_lat_lon).add_to(map)

    # Save the map as an HTML file
    map.save(output_file)


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

    cursor.execute("SELECT Matricula, Nombre, ApellidoP FROM alumni")
    students = cursor.fetchall()

    driver = webdriver.Chrome()

    # Used to update the students info in the database
    for student in students:
        matricula, student_name, apellido_paterno = student
        current_url = getStudentURL(driver, student_name, apellido_paterno)

        api = Linkedin(account, password)
        user = api.get_profile(current_url)

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




if __name__ == "__main__":
    main()

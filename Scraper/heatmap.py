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

    # Fetch and process student locations from the database
    locations_lat_lon = fetch_student_locations_from_database(cursor)

    # Generate and save the heatmap with the processed locations
    generate_heatmap(locations_lat_lon, "heatmap.html")
    cursor.close()
    db.close()
    
    # Run pieChart.py after heatmap has been created
    os.system("python pieChart.py")



if __name__ == "__main__":
    main()

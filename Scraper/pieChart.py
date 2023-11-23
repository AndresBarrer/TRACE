import matplotlib.pyplot as plt
import sqlite3

# Importing module 
import mysql.connector

def main():
    alumnos_total = 0
    alumnos_encontrados = 0
    alumnos_no_encontrados = 0

    # Create a connection to the database
    #connection = sqlite3.connect('trace.sql')
    
    # Create a cursor to the database to make changes
    #cursor = connection.cursor()
    
    # Connect to the database 
    db = mysql.connector.connect(
        host = "localhost",
        user = "root",
        password = "",
        database = "trace"
    )
    
    # Create a cursor to the database
    cursor = db.cursor()

    # Consulta SQL para contar la cantidad total de alumnos
    cursor.execute("SELECT COUNT(*) FROM alumni")
    resultado_total = cursor.fetchone()
    alumnos_total = resultado_total[0]
    
    # Consulta SQL para contar la cantidad de alumnos encontrados (sin contenido NULL en la localización)
    cursor.execute("SELECT COUNT(*) FROM alumni WHERE GeoLocationName <> ''")
    resultado_encontrados = cursor.fetchone()
    alumnos_encontrados = resultado_encontrados[0]
    
    alumnos_no_encontrados = alumnos_total - alumnos_encontrados
    
    db.close()
    
    # Etiquetas para las porciones de la gráfica
    etiquetas = ['Encontrados', 'No Encontrados']
    
    # Valores correspondientes a cada etiqueta
    valores = [alumnos_encontrados, alumnos_no_encontrados]
    
    # Colores para las porciones de la gráfica
    colores = ['#50B848', '#FEBE10']
    
    fig, ax = plt.subplots()
    ax.pie(valores, labels=etiquetas, colors=colores, autopct='%.0f%%', startangle=90)
    ax.set_title('Egresados')
    plt.axis('equal')  # Para asegurarse de que la gráfica sea un círculo

    # Guardar la imagen como un archivo JPG
    plt.savefig('egresados_grafico.jpg', format='jpg')
    
    # Mostrar la gráfica
    plt.show()

# Llamar a la función principal
main()

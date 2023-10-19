document.addEventListener("DOMContentLoaded", function() {
    // URL del archivo CSV
    var csvURL = "Resources/tablas-egresados.csv"; // Reemplaza "tu_archivo.csv" con la URL de tu archivo CSV

    // Obtén las partes de la tabla
    var tableBody = document.getElementById("table-body");
    var tableHead = document.querySelector("table thead");

    // Variables de paginación
    var page = 1; // Página actual
    var rowsPerPage = 10; // Filas por página

    // Obtén los botones de navegación
    var prevButton = document.getElementById("previous-page");
    var nextButton = document.getElementById("next-page");

    // Función para mostrar las filas en la página actual
    function showRowsInPage(data) {
        tableBody.innerHTML = ""; // Limpia el cuerpo de la tabla

        var startIndex = (page - 1) * rowsPerPage;
        var endIndex = startIndex + rowsPerPage;

        for (var i = startIndex; i < endIndex; i++) {
            if (i < data.length) {
                var row = data[i];
                var newRow = document.createElement("tr");
                newRow.innerHTML = `
                <td>${row.Nombre || 'N/A'}</td>
                <td>${row["Apellido paterno"] || 'N/A'}</td>
                <td>${row["Apellido materno"] || 'N/A'}</td>
                <td>${row["Correo Institucional"] || 'N/A'}</td>
                <td>${row["Correo"] || 'N/A'}</td>
                <td>${row["Fecha de ingreso"] || 'N/A'}</td>
                <td>${row["Fecha de egreso"] || 'N/A'}</td>
                <td>${row.Empresa || 'N/A'}</td>
                <td>${row.Puesto || 'N/A'}</td>
                `;
                tableBody.appendChild(newRow);
            }
        }
    }

    // Función para manejar el evento de página anterior
    prevButton.addEventListener("click", function() {
        if (page > 1) {
            page--;
            showRowsInPage(data);
        }
    });

    // Función para manejar el evento de página siguiente
    nextButton.addEventListener("click", function() {
        if (page < Math.ceil(data.length / rowsPerPage)) {
            page++;
            showRowsInPage(data);
        }
    });

    // Realiza la solicitud para cargar y analizar el archivo CSV
    Papa.parse(csvURL, {
        header: true, // Suponemos que la primera fila es un encabezado
        download: true,
        dynamicTyping: true,
        skipEmptyLines: true,
        error: function(error){
            console.error("Error al cargar el archivo CSV: ", error);
        },
        complete: function(results) {
            data = results.data;
            showRowsInPage(data);
        }
    });
});
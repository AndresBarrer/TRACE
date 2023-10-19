document.addEventListener("DOMContentLoaded", function() {
    // URL del archivo CSV
    var csvURL = "Resources/tablas-egresados.csv"; 
  
    // Obtén la tabla y su cuerpo
    var userTable = document.getElementById("user-table");
    var tableBody = userTable;
  
    // Realiza la solicitud para cargar y analizar el archivo CSV
    Papa.parse(csvURL, {
        header: true, // Suponemos que la primera fila es un encabezado
        download: true,
        dynamicTyping: true,
        skipEmptyLines: true,
        complete: function(results) {
            var data = results.data;
  
            // Itera a través de los datos y agrega filas a la tabla
            data.forEach(function(row) {
                var newRow = document.createElement("tr");
                newRow.innerHTML = `
                    <td>${row.Nombre || 'N/A'}</td>
                    <td>${row["Apellido paterno"] || 'N/A'}</td>
                    <td>${row["Apellido materno"] || 'N/A'}</td>
                    <td>${row["Correo Institucional"] || 'N/A'}</td>
                    <td>${row["Correo Personal"] || 'N/A'}</td>
                    <td>${row["Fecha de ingreso"] || 'N/A'}</td>
                    <td>${row["Fecha de egreso"] || 'N/A'}</td>
                    <td>${row.Empresa || 'N/A'}</td>
                    <td>${row.Puesto || 'N/A'}</td>
                `;
                tableBody.appendChild(newRow);
            });
        }
    });
  });
  
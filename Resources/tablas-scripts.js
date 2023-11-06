document.addEventListener("DOMContentLoaded", function () {
    var tableBody = document.getElementById("table-body");
    var page = 1;
    var rowsPerPage = 10;
    var prevButton = document.getElementById("previous-page");
    var nextButton = document.getElementById("next-page");
    var searchInput = document.getElementById("search-input"); // Campo de búsqueda
    var data; // Declarar la variable data aquí



    function showRowsInPage(data) {
        tableBody.innerHTML = "";
        var startIndex = (page - 1) * rowsPerPage;
        var endIndex = startIndex + rowsPerPage;

        for (var i = startIndex; i < endIndex; i++) {
            if (i < data.length) {
                var row = data[i];
                var newRow = document.createElement("tr");
                newRow.innerHTML = `
                    <td>${row.Nombre || 'N/A'}</td>
                    <td>${row.ApellidoP || 'N/A'}</td>
                    <td>${row.ApellidoM || 'N/A'}</td>
                    <td>${row.CorreoI || 'N/A'}</td>
                    <td>${row.CorreoP || 'N/A'}</td>
                    <td>${row.FechaIng || 'N/A'}</td>
                    <td>${row.FechaEgreso || 'N/A'}</td>
                    <td>${row.Empresa || 'N/A'}</td>
                    <td>${row.Puesto || 'N/A'}</td>
                `;
                tableBody.appendChild(newRow);
            }
        }
    }

    prevButton.addEventListener("click", function () {
        if (page > 1) {
            page--;
            showRowsInPage(data);
        }
    });

    nextButton.addEventListener("click", function () {
        if (page < Math.ceil(data.length / rowsPerPage)) {
            page++;
            showRowsInPage(data);
        }
    });

    searchInput.addEventListener("input", function () {
        var searchTerm = searchInput.value.toLowerCase();
        var filteredData = data.filter(function (row) {
            // Filtra las filas en función del término de búsqueda
            return Object.values(row).some(function (value) {
                return value.toLowerCase().includes(searchTerm);
            });
        });

        // Actualiza la página y muestra las filas filtradas
        page = 1;
        showRowsInPage(filteredData);
    });

    // Realiza una solicitud AJAX para obtener los datos de la base de datos
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "Resources/tablas.php", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            data = JSON.parse(xhr.responseText);
            showRowsInPage(data);
        }
    };
    xhr.send();
});

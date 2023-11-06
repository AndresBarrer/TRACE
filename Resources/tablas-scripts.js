document.addEventListener("DOMContentLoaded", function () {
    var tableBody = document.getElementById("table-body");
    var page = 1;
    var rowsPerPage = 10;
    var prevButton = document.getElementById("previous-page");
    var nextButton = document.getElementById("next-page");
    var searchInput = document.getElementById("search-input");
    var searchButton = document.getElementById("search-button");
    var filteredData;

    // Objeto para rastrear el estado de orden de cada columna
    var columnSortStates = {
        "sort-nombre": "asc",
        "sort-apellido-paterno": "asc",
        "sort-apellido-materno": "asc",
        "sort-correo-institucional": "asc",
        "sort-correo-personal": "asc",
        "sort-fecha-ingreso": "asc",
        "sort-fecha-egreso": "asc",
        "sort-empresa": "asc",
        "sort-puesto": "asc",
    };

    // Función para cambiar el estado de orden
    function toggleSortState(columnId) {
        if (columnSortStates[columnId] === "asc") {
            columnSortStates[columnId] = "desc";
        } else {
            columnSortStates[columnId] = "asc";
        }
    }

    // Función para actualizar el indicador visual del orden
    function updateSortIndicator(columnId) {
        var column = document.getElementById(columnId);
        if (columnSortStates[columnId] === "asc") {
            column.textContent = column.textContent.replace(" ▼", " ▲");
        } else {
            column.textContent = column.textContent.replace(" ▲", " ▼");
        }
    }

    // Función para ordenar los datos
    function sortData(columnId, sortOrder) {
        if (filteredData) {
            filteredData.sort((a, b) => {
                var comparison = a[columnId].localeCompare(b[columnId]);
                return sortOrder === "asc" ? comparison : -comparison;
            });
            showRowsInPage(filteredData);
        } else {
            data.sort((a, b) => {
                var comparison = a[columnId].localeCompare(b[columnId]);
                return sortOrder === "asc" ? comparison : -comparison;
            });
            showRowsInPage(data);
        }
    }

    // Función para mostrar las filas en la página
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

    // Agrega un evento de clic para cada enlace de encabezado
    document.getElementById("sort-nombre").addEventListener("click", function () {
        toggleSortState("sort-nombre");
        updateSortIndicator("sort-nombre");
        sortData("Nombre", columnSortStates["sort-nombre"]);
    });

    document.getElementById("sort-apellido-paterno").addEventListener("click", function () {
        toggleSortState("sort-apellido-paterno");
        updateSortIndicator("sort-apellido-paterno");
        sortData("ApellidoP", columnSortStates["sort-apellido-paterno"]);
    });

    document.getElementById("sort-apellido-materno").addEventListener("click", function () {
        toggleSortState("sort-apellido-materno");
        updateSortIndicator("sort-apellido-materno");
        sortData("ApellidoM", columnSortStates["sort-apellido-materno"]);
    });

    document.getElementById("sort-correo-institucional").addEventListener("click", function () {
        toggleSortState("sort-correo-institucional");
        updateSortIndicator("sort-correo-institucional");
        sortData("CorreoI", columnSortStates["sort-correo-institucional"]);
    });

    document.getElementById("sort-correo-personal").addEventListener("click", function () {
        toggleSortState("sort-correo-personal");
        updateSortIndicator("sort-correo-personal");
        sortData("CorreoP", columnSortStates["sort-correo-personal"]);
    });

    document.getElementById("sort-fecha-ingreso").addEventListener("click", function () {
        toggleSortState("sort-fecha-ingreso");
        updateSortIndicator("sort-fecha-ingreso");
        sortData("FechaIng", columnSortStates["sort-fecha-ingreso"]);
    });

    document.getElementById("sort-fecha-egreso").addEventListener("click", function () {
        toggleSortState("sort-fecha-egreso");
        updateSortIndicator("sort-fecha-egreso");
        sortData("FechaEgreso", columnSortStates["sort-fecha-egreso"]);
    });

    document.getElementById("sort-empresa").addEventListener("click", function () {
        toggleSortState("sort-empresa");
        updateSortIndicator("sort-empresa");
        sortData("Compania", columnSortStates["sort-empresa"]);
    });

    document.getElementById("sort-puesto").addEventListener("click", function () {
        toggleSortState("sort-puesto");
        updateSortIndicator("sort-puesto");
        sortData("Puesto", columnSortStates["sort-puesto"]);
    });


    prevButton.addEventListener("click", function () {
        if (page > 1) {
            page--;
            if(filteredData){
                showRowsInPage(filteredData);
            }else{
                showRowsInPage(data);
            }
        }
    });

    nextButton.addEventListener("click", function () {
        if(filteredData){
            if (page < Math.ceil(filteredData.length / rowsPerPage)) {
                page++;
                showRowsInPage(filteredData);
            }
        }else{
            if (page < Math.ceil(data.length / rowsPerPage)) {
                page++;
                showRowsInPage(data);
            }
        }
        
    });

    searchButton.addEventListener("click", function () {
        var searchTerm = searchInput.value.toLowerCase();
        filteredData = data.filter(function (row) {
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
    xhr.setRequestHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    xhr.setRequestHeader("Pragma", "no-cache");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            data = JSON.parse(xhr.responseText);
            showRowsInPage(data);
        }
    };
    xhr.send();
});



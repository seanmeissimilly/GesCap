let dataTable;
let dataTableIsInitialized = false;

const dataTableOptions = {
    lengthMenu: [3, 5, 10, 15],
    pageLength: 3,
    destroy: true,
    dom: 'lBfrtip',
    buttons: [
        {
            extend: 'collection',
            text: 'Exportar',
            buttons: [
                'copy',
                'excel',
                'csv',                
                'print'
            ]
        }
    ],
    language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar:",
        loadingRecords: "Cargando...",
        paginate: {
            first: "Primero",
            last: "Último",
            next: "Siguiente",
            previous: "Anterior"
        },
        buttons: {
            copy: "copiar",
            csv: "csv",
            excel: "excel",
            pdf: "pdf",
            print: "imprimir"
        }
    }
    
};


const initDataTable = async () => {
    if (dataTableIsInitialized) {
        dataTable.destroy();
    }

    dataTable = $("#datatable_users").DataTable(dataTableOptions);
    dataTableIsInitialized = true;
};

window.addEventListener("load", async () => {
    await initDataTable();
});

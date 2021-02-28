<%-- 
    Document   : lista
    Created on : 27-02-2021, 10:30:47 AM
    Author     : henry.taby
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/Components/header.jsp"/>


<div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__head">
        <div class="m-portlet__head-tools">
            List of registered classes
        </div>

        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item">
                    
                    <a href="#" class="btn btn-primary m-btn m-btn--custom m-btn--bolder m-btn--icon" id="btn_update" rel="new">
                        <span><i class="fa fa-plus"></i><span>New Class</span></span>
                    </a>
                    
                </li>

            </ul>
        </div>
    </div>
    <div class="m-portlet__body m--padding-top-5">
        <table class="table table-striped table-bordered table-hover table-checkable table-sm m-table m-table--head-bg-brand
                 " id="index_lista">
            <thead>
                <tr>
                    <th>Action</th>
                    <th>Name</th>
                    <th>Description</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
      
<jsp:include page="/Components/footer.jsp"/>

<script>
    var table_list;
    
    var snippet_list = function () {
        var urlsys = "classes?action=";
        
        /**
         * Delete
         */
        var  item_delete = function(id){
            swal({
                title: 'Are you sure to delete the record?',
                text: "Remember that the record will be permanently deleted. ID="+id+", ",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, Delete!',
                cancelButtonText: "No, Cancel"
            }).then(function(result) {
                if (result.value) {
                    item_delete_action(id);
                }
            });
        };
        
        var item_delete_action = function(id){
            $.get( urlsys+"delete",
                { id:id},
                function(res){
                    if(res.res == 1){
                        swal({position: 'top-center',type: 'success',title: 'The record was deleted',showConfirmButton: false,timer: 1000});
                        table_list.ajax.reload();
                    }else {
                        swal({position: 'top-center'
                            ,html:'<strong>An error occurred.</strong><br><div class="m-alert m-alert--outline alert alert-danger alert-dismissible fade show" role="alert"> <strong>Technical Data: </strong>'+res.msg+'</div>'
                            ,type: 'error'
                            ,title: "Can't be deleted"});
                    }
                },"json");
        }
    
        /**
         * New and Update
         */
        var btn_update = $('#btn_update');
        var handle_button_update = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_update("","new");
            });
        }
        
        var item_update = function(id,type){
            var url = urlsys+"itemUpdate&id="+id+'&type='+type;
            location = url;
            //alert(url);
        };
        
        $.fn.dataTable.Api.register('column().title()', function() {
            return $(this.header()).text().trim();
        });

        var exporta_titulo = "List of registered Classes";
        var exporta_columnas = [':visible :not(.noExport)' ];

        var initTable1 = function() {
            // begin first table
            table_list = $('#index_lista').DataTable({
                initComplete: function(settings, json) {
                    $('#index_lista').removeClass('m--hide');
                },
                responsive: true,
                keys: {
                    columns: exporta_columnas,
                    clipboard: false
                },
                colReorder: true,
                //== Pagination settings
                dom:
                "<'row'<'col-sm-12 col-md-12 dataTables_pager'lp>>" +
                `<'row'<'col-sm-5 text-left'f><'col-sm-7 text-right'B>>
			         <'row'<'col-sm-12'tr>>
                     <'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7 dataTables_pager'lp>>`,
                buttons: [
                    {extend:'colvis',text:'Ver'
                        ,columnText: function ( dt, idx, title ) {
                            return (idx+1)+': '+title;
                        }
                    },
                    {extend:'excelHtml5'
                        ,exportOptions: {columns: exporta_columnas}
                        , title: exporta_titulo
                    },
                    {extend:'pdfHtml5'
                        ,exportOptions: {columns: exporta_columnas}
                        , title: exporta_titulo
                        , download: 'open'
                        //, orientation: 'landscape'
                        , pageSize: 'LETTER'
                        ,customize: function(doc) {
                            doc.styles.tableHeader.fontSize = 7;
                            doc.defaultStyle.fontSize = 7;
                            doc.pageMargins= [ 20, 20];
                        }
                    },

                ],
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, "Todos"]],
                pageLength: 25,
                order: [[ 1, "des" ]],
                ajax: {
                    url: urlsys+'listJson',
                    method: 'POST',
                    dataSrc: "data"
                },
                columns: [
                    {data: 'id'} ,
                    {data: 'name'} ,
                    {data: 'description'} 
                ],
                columnDefs: [
                    {
                        targets: 0,
                        width: "130px",
                        className: 'noExport',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, full, meta) {
                            var boton = '';
                            boton += '<div class="btn-group btn-group-sm " role="group" aria-label="Default button group">';
                            boton += '<a href="javascript:snippet_list.update(\''+data+'\',\'update\');" class="btn btn-outline-info" title="Edit">Edit</a>';
                                    boton += '<a href="javascript:snippet_list.delete(\''+data+'\');" class="btn btn-outline-danger" title="Delete">Delete</a>';
                            boton += '<div>';
                            return boton;
                        },
                    },

                ],
            });

        };

        return {
            //main function to initiate the module
            init: function() {
                initTable1();
                handle_button_update();
            },
            update: function(id,type){
                item_update(id,type);
            },
            delete: function(id){
                item_delete(id);
            },
        };

    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });

</script>
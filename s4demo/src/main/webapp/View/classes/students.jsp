<%-- 
    Document   : classes
    Created on : 28-02-2021, 12:01:05 PM
    Author     : henry.taby
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    table.dataTable td.focus {
        box-shadow: #4acb98 0px 0px 2px 2px inset !important;
    }
</style>

<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <h3 class="m-portlet__head-text">List of registered Students</h3>
        </div>
    </div>
    
    <div class="m-portlet__head-tools">
        <ul class="m-portlet__nav">
            <li class="m-portlet__nav-item">
                <a href="#" class="btn btn-focus m-btn m-btn--custom m-btn--bolder m-btn--icon" id="btn_form" rel="new">
                    <span><i class="fa fa-plus"></i><span>New Students</span></span>
                </a>
            </li>
            <li class="m-portlet__nav-item"></li>
        </ul>
    </div>
</div>

<div class="m-portlet__body">
    <table class="table table-striped- table-bordered table-hover table-checkable table-sm m-table m-table--head-bg-success"  
           id="tabla">
        <thead>
            <tr>
                <th >Action</th>
                <th >Students</th>
            </tr>
        </thead>
        <tfoot>

        </tfoot>
    </table>
</div>

<!--begin::Modal-->
<div class="modal fade" id="form_modal" tabindex="-1" role="dialog"
     data-backdrop="static"
     data-keyboard="false"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" id="modal-content">

        </div>
    </div>
</div>
<!--end::Modal-->


<script>
    var table_list


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
            $.get( urlsys+"deletestudent",
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
         * Boton para nuevo
         */
        var btn_update = $('#btn_form');
        var handle_button_form = function(){
            btn_update.click(function(e){
                e.preventDefault();
                item_form("","new");
            });
        }
        
        /**
         * Actualizar o nuevo
         */
        var item_form = function(id,type){
            var load_url = urlsys+"itemUpdateStudent&id="+id+'&type='+type+"&item_id=${id}";
            
            swal({
                title: 'Loading form',
                html: 'Please wait a few seconds until the form loads'+cargando_vista,
                showConfirmButton: false,
                allowEnterKey: false,
                allowOutsideClick: false,
                allowEscapeKey: false,
            });
            
            $.get(load_url, function(data) {
                $("#modal-content").html(data);
                swal.close();
                $("#form_modal").modal("show");
            });
        };
        
        var item_update = function(id){
            item_form(id,"update");
        };
        
        
        $.fn.dataTable.Api.register('column().title()', function() {
            return $(this.header()).text().trim();
        });

        var exporta_titulo = "CITES - Catalogo - Tipos de Proposito";
        var exporta_columnas = [':visible :not(.noExport)' ];

        var initTable1 = function() {
            // begin first table
            table_list = $('#tabla').DataTable({
                initComplete: function(settings, json) {
                    $('#tabla').removeClass('m--hide');
                },
                responsive: true,
                keys: {
                    blurable: false,
                    columns: exporta_columnas,
                    clipboard: false
                },
                //stateSave: true,
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
                    }

                ],
                lengthMenu: [[10, 25, 50,-1], [10, 25, 50, "Todos"]],
                pageLength: 10,
                order: [[ 1, "asc" ]],
                ajax: {
                    url: urlsys+'listStudentsJson',
                    method: 'POST',
                    dataSrc: "data",
                    data: { id:'${id}'}
                },
                columns: [
                        {data: 'id'} ,
                        {data: 'student_name'} 
                ],
                columnDefs: [
                    {
                        targets: 0,
                        width: "120px",
                        className: 'noExport',
                        orderable: false,
                        render: function(data, type, full, meta) {
                            var boton = '';
                            boton += '<div class="btn-group btn-group-sm " role="group" aria-label="Default button group">';
                            //boton += '<a href="javascript:snippet_list.update(\''+data+'\');" class="btn btn-outline-info" title="Edit">Edit</a>';
                            boton += '<a href="javascript:snippet_list.delete(\''+data+'\');" class="btn btn-outline-danger" title="Delete">Delete</a>';
                            boton += '<div>';
                            return boton;

                        }
                    }

                ]
            });

        };

        return {
            init: function() {
                initTable1();
                handle_button_form();
            },
            update: function(id,type){
                item_update(id,type);
            },
            delete: function(id){
                item_delete(id);
            }

        };

    }();

    jQuery(document).ready(function() {
        snippet_list.init();
    });
</script>
<%-- 
    Document   : classesform
    Created on : 28-02-2021, 01:41:33 PM
    Author     : henry.taby
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form class="m-form m-form--fit m-form--label-align-right m-form--group-seperator-dashed" 
      method="POST" action="students?action=itemclassupdatesql"  id="form_modal_interface">
    <input type="hidden" name="item_id" value="${item_id}">

    <div class="modal-body">

        <div class="alert alert-focus" role="alert">
            <c:if test="${type == 'new'}">New</c:if><c:if test="${type == 'update'}">Edit</c:if> Class 
            
        </div>

        <div class="form-group">
            <label for="recipient-name" class="form-control-label">
                    
            <c:if test="${type == 'update'}">
                    <strong>Class:</strong> ${item.classes.name}
            <strong>Student:</strong> ${item.students.name} ${item.students.last_name}
            <br>
            </c:if>
                    Class:  ${item.id} ${item.class_id}  </label>
                <div class="input-group">
                    <select class="form-control m-select2 select2_general " style="width: 100%"
                        name="class_id" id="class_id" required >
                        <option value=""></option>
                    <c:forEach items="${classesopt}" var='dato'>
                        <c:choose>
                            <c:when test="${dato.id == item.classes.id}">
                                <option value="${dato.id}" selected="">${dato.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${dato.id}">${dato.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>                    
                    </select>
                
                </div>
        
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="form_modal_close"  data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-focus" id="form_modal_submit">Save</button>
    </div>
</form>
                            
<script>
    var snippet_form_modal = function() {
        var idficha = '${id}';
        var type = '${type}';
        var form_modal = $('#form_modal_interface');
        var form_btn_submit = $('#form_modal_submit');
        var form_btn_close = $('#form_modal_close');
        //== Private Functions
        var showRequest= function(formData, jqForm, op) {
            form_btn_submit.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            form_btn_close.attr('disabled', true);
            return true;
        };
        var showResponse = function (responseText, statusText) {
            form_btn_submit.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
            if(responseText.res ==1){
                $("#form_modal").modal("hide");
                table_list.ajax.reload();
                if(responseText.accion =='update') {
                    swal({type: 'success',title: 'Good work! everythin was saved successfully!',showConfirmButton: false,timer: 1000});
                }else{
                    swal({type: 'success',title: 'Good work! the record has been created successfully!',showConfirmButton: false,timer: 1000});
                }
            }else{
                swal({position: 'top-center'
                    ,html:'<strong>Error occurred while saving</strong><br>'+responseText.msg+'<br><br><div class="m-alert m-alert--outline alert alert-danger alert-dismissible fade show" role="alert"> <strong>Technical data: </strong>'+responseText.msgdb+'</div>'
                    ,type: 'error'
                    ,title: 'Error'});

            }
        };

        var options = {
            beforeSubmit:showRequest
            , dataType: 'json'
            , success:  showResponse
            , data: {
                accion:'students?action=itemclassupdatesql'
                ,id:idficha
                ,type:type
            }
        };
        var handle_form_modal_submit=function(){
            form_modal.ajaxForm(options);
        };

        var handle_form_modal_btn_submit = function() {

            form_btn_submit.click(function(e) {
                e.preventDefault();
                var form = $(this).closest('form');

                if (!form.valid()) {
                    return;
                }

                form_modal.submit();
            });
        };

        var handle_form_modal_components = function(){
            $('.fecha_general').datepicker({
                todayHighlight: true,
                orientation: "bottom left",
                format: 'dd/mm/yyyy',
                templates: {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                }
            });

            $('.select2_general').select2({
                placeholder: "Seleccione una opción"
                //dropdownParent: $("#form_modal"),
                //width: '80%',
            });

            $('.valores_numericos').number( true, 0 ,'','');
        };



        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_form_modal_btn_submit();
                handle_form_modal_submit();
                handle_form_modal_components();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_form_modal.init();
    });

</script>
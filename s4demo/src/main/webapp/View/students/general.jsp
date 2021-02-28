<%-- 
    Document   : general
    Created on : 27-02-2021, 06:08:47 PM
    Author     : henry.taby
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
.form-control-feedback{
    color: red !important;
}
.cuadro{
    border:1px solid #cbcbcb;
    height: 100%;
    border-radius: 5px 5px 5px 5px;
    -moz-border-radius: 5px 5px 5px 5px;
    -webkit-border-radius: 5px 5px 5px 5px;
}
.cuadro-verde{
    border:1px solid #34bfa3;
    height: 100%;
    border-radius: 5px 5px 5px 5px;
    -moz-border-radius: 5px 5px 5px 5px;
    -webkit-border-radius: 5px 5px 5px 5px;
}
.titulo{
    border-bottom: 1px solid #34bfa3;
    padding-bottom: 5px;
}
.monto{
    border-color: #0375df;
    color: #0375df !important;
}
</style>



<!--begin::Portlet-->
<div class="m-portlet">
    <!--begin::Form-->
    <form class="m-form m-form--fit m-form--label-align-right" method="POST" action="students?action=itemupdatesql"  id="general_form">

        <div class="m-portlet__body">
            <div class="form-group m-form__group row  m-form m--padding-bottom-5 m--padding-top-5" >
                <div class="col-lg-12 m-form__group-sub " >
                    <div class="row cuadro m--padding-bottom-5 ">
                        <div class="col-lg-12 titulo m--margin-bottom-5 m--padding-left-5 m--padding-top-5">
                            Personal Information
                        </div>
                        <div class="col-lg-6 m-form__group-sub">
                            <label class="form-control-label">Name</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Enter the student's name" name="txtname" required 
                                        {$privFace.input} value="${item.name}">
                            </div>
                        </div>
                            
                        <div class="col-lg-6 m-form__group-sub">
                            <label class="form-control-label">Last Name:</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Enter the student's last name" name="txtlast_name" required 
                                        {$privFace.input} value="${item.last_name}">
                            </div>
                        </div>
                        <div class="col-lg-12 m-form__group-sub">
                            <label class="form-control-label">Address:</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Enter the student's address" name="txtaddress" required 
                                        {$privFace.input} value="${item.address}">
                            </div>
                        </div>  
                            
                            
                        <div class="col-lg-6 m-form__group-sub">
                            <label class="form-control-label">Email:</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Enter the student's email" name="txtemail" required 
                                        {$privFace.input} value="${item.email}">
                            </div>
                        </div>
                        
                        <div class="col-lg-6 m-form__group-sub">
                            <label class="form-control-label">Phone Number:</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Enter the student's phone number" name="txtphone_number" required 
                                        {$privFace.input} value="${item.phone_number}">
                            </div>
                        </div> 
                            
                            
                        <div class="col-lg-12 m-form__group-sub">
                            <label class="form-control-label">Description:</label>
                            <div class="input-group">
                                <input type="text" class="form-control m-input"
                                       placeholder="Short description" name="txtdescription" required
                                        {$privFace.input} value="${item.description}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="m-portlet__foot m-portlet__no-border m-portlet__foot--fit">
            <div class="m-form__actions m-form__actions--solid">
                <div class="row">
                    <div class="col-lg-6">
                        <button type="reset" class="btn btn-primary" id="general_submit">Save</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <!--end::Form-->
</div>
<!--end::Portlet-->


<script>
    var snippet_general_form = function() {
        var idficha = '${id}';
        var type = '${type}';
        var general_form = $('#general_form');
        var general_btn_submit = $('#general_submit');
        //== Private Functions
        var showRequest= function(formData, jqForm, op) {
            general_btn_submit.addClass('m-loader m-loader--right m-loader--light').attr('disabled', true);
            return true;
        };
        var showResponse = function (responseText, statusText) {
            general_btn_submit.removeClass('m-loader m-loader--right m-loader--light').attr('disabled', false);
            if(responseText.res ==1){
                
                if(responseText.accion =='update') {
                    swal({type: 'success',title: ' Everything was saved successfull!',showConfirmButton: false,timer: 1000});
                }else{
                    location = "students?action=itemUpdate&id="+responseText.id+"&type=update";
                }
            }else{
                swal("An error occurred", responseText.msg, "danger")
            }
        };

        var options = {
            beforeSubmit:showRequest
            , dataType: 'json'
            , success:  showResponse
            , data: {
                accion:'students?action=itemupdatesql'
                ,itemId:idficha
                ,type:type
            }
        };
        var handle_form_submit=function(){
            general_form.ajaxForm(options);
        };

        var handle_general_form_submit = function() {

            general_btn_submit.click(function(e) {
                e.preventDefault();
                var btn = $(this);
                var form = $(this).closest('form');

                if (!form.valid()) {
                    return;
                }
                general_form.submit();
            });
        };

        var handle_general_components = function(){

            $('.fecha_general').datepicker({
                todayHighlight: true,
                orientation: "bottom left",
                format: 'dd/mm/yyyy',
                templates: {
                    leftArrow: '<i class="la la-angle-left"></i>',
                    rightArrow: '<i class="la la-angle-right"></i>'
                }
            }).inputmask("dd/mm/yyyy");

            $('.select2_general').select2({
                placeholder: "Seleccione una opción"
            });

            $('.summernote').summernote({
                height: 150
            });

            $('.numero_entero').number( true, 0 ,'','');
            $('.numero_decimal').number( true, 2 ,'.',',');

            $(".mayus").on("keypress", function () {
               $input=$(this);
               setTimeout(function () {
                $input.val($input.val().toUpperCase());
               },50);
            });

        };


        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_general_form_submit();
                handle_form_submit();
                handle_general_components();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });

</script>
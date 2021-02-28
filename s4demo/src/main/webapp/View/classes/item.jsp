<%-- 
    Document   : item
    Created on : 27-02-2021, 05:34:37 PM
    Author     : henry.taby
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/Components/header.jsp"/>


<!--begin::Portlet-->
<div class="m-portlet  m-portlet--bordered-semi " style="margin-bottom: 0px !important;">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <span class="m-portlet__head-icon">
                    <i class="la la-thumb-tack m--font-success"></i>
                </span>
                <h3 class="m-portlet__head-text">
                    Class / <c:if test = "${type=='new'}" >New</c:if> 
                    <c:if test = "${type=='update'}" >Update</c:if> 
                    &nbsp; <!--<strong><span class="m--font-success">{$item.nombre}</span></strong>-->
                </h3>
            </div>
        </div>
        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item">
                    <a href="students" class="btn btn-success m-btn m-btn--icon m-btn--icon-only m-btn--custom m-btn--pill" title="Back">
                        <i class="la la-mail-reply"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--end::Portlet-->


<div class="m-portlet m-portlet--tabs">
    <div class="m-portlet__head">
        <div class="m-portlet__head-tools">
            <ul class="nav nav-tabs m-tabs-line m-tabs-line--left m-tabs-line--success" role="tablist">
                
                <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link active"
                       data-toggle="tabajax"
                       data-target="#general_pane"
                       id = "general_tab"
                       href="${ruta}?action=tabGeneral&type=${type}&id=${id}"
                       role="tab">
                        <i class="flaticon-share m--font-success"></i> General 
                    </a>
                </li>
                <c:if test = "${type=='update'}" >
                <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link "
                       data-toggle="tabajax"
                       data-target="#students_pane"
                       id = "students_tab"
                       href="${ruta}?action=tabStudents&type=${type}&id=${id}"
                       role="tab">
                        <i class="flaticon-folder-2 m--font-success"></i> Students
                    </a>
                </li>
                </c:if>
            </ul>
        </div>
    </div>

    <div class="tab-content">
        <div class="tab-pane active" id="general_pane"></div>
        <c:if test = "${type=='update'}" >
        <div class="tab-pane" id="students_pane"></div>
        </c:if>
    </div>
    
</div>

<jsp:include page="/Components/footer.jsp"/>

<script>
    var snippet_tab_item = function () {
        var borra_contenido_tabs = function () {
            $("#general_pane").html("");
            $("#students_pane").html("");            
        };
        var handler_tab_build = function(){
            $('[data-toggle="tabajax"]').click(function(e) {
                //e.preventDefault();
                var $this = $(this),
                    loadurl = $this.attr('href'),
                    targ = $this.attr('data-target');
                //Vaciamos el tab
                borra_contenido_tabs();
                $(targ).html(" Loading Tab.. ");
                
                swal({
                    title: 'Loading your request',
                    html: 'Processing data'+cargando_vista,
                    showConfirmButton: false,
                    allowEnterKey: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                });

                $.get(loadurl, function(data) {
                    $(targ).html(data);
                    swal.close();
                });

                $this.tab('show');
                return false;
            });
        }
        return {
            init: function() {
                handler_tab_build();
            }
        };
    }();

    jQuery(document).ready(function() {
        snippet_tab_item.init();
        $('#general_tab').trigger('click');
        //$('#tabs_principal').removeClass('m--hide');

    });
</script>
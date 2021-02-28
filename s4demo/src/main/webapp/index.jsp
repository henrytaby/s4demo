<%-- 
    Document   : index
    Created on : 27-02-2021, 03:36:35 AM
    Author     : henry.taby
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="Components/header.jsp"/>


    <style>
        .titulo_menu{
            /*text-shadow: -1px -1px 5px #0A0A0A!important;*/
            text-shadow:  -1px 2px 6px #0A0A0A   !important;

        }
        /*
        .m-portlet.m-portlet--full-height {
               border-bottom: 5px solid #00c0a3 !important;
           }
        */
        div[rel="color_0"]{
            border-bottom: 3px solid #FFB900!important;
        }
        div[rel="color_1"]{
            border-bottom: 3px solid #00C6DE!important;
        }
        div[rel="color_2"]{
            border-bottom: 3px solid #FF506D!important;
        }
        div[rel="color_3"]{
            border-bottom: 3px solid #00C0A3!important;
        }
        div[rel="color_4"]{
            border-bottom: 3px solid #5067E1!important;
        }
        div[rel="color_5"]{
            border-bottom: 3px solid #FFB900!important;
        }
        div.m-portlet.m-portlet--full-height [rel="color_6"]{
            border-bottom: 3px solid #00C6DE!important;
        }
        div[rel="color_7"]{
            border-bottom: 3px solid #FF506D!important;
        }
        div[rel="color_8"]{
            border-bottom: 3px solid #00C0A3!important;
        }
        div[rel="color_9"]{
            border-bottom: 3px solid #5067E1!important;
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
        .cuadro-padding-0{
            padding: 0px !important;
        }
        .cuadro-margin-0{
            margin: 0px !important;
        }
        .titulo{
            border-bottom: 1px solid #34bfa3;
            padding-bottom: 5px;
        }
        .titulo_estado2{
            border-bottom: 4px solid #8c49c4 !important;
            background: #f9f6fb;
            padding: 8px;
        }


        .titulo-estado{
            border-bottom: 1px solid #8c49c4;
            padding-bottom: 2px;
            font-size: 15px;
            font-weight: bolder;
            color: #8c49c4;
        }
        .cuadro-estado{
            background-color: #faf9fc;
            border:1px solid #8c49c4;
            height: 100%;
            border-radius: 5px 5px 5px 5px;
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;

        }

    </style>

    <div class="row">
        <div class="col-xl-9 col-lg-8 m--padding-right-5 "  >
            <div class="m-portlet m--padding-bottom-5">
                <div class="m-portlet__body ">
                    <div class="row">

                        <div class="col-xl-6 m--padding-5">

                            <div class="m-portlet m-portlet--bordered-semi m-portlet--full-height  m-portlet--rounded-force" >
                                <div class="m-portlet__head m-portlet__head--fit">
                                    <div class="m-portlet__head-caption"><div class="m-portlet__head-action"></div></div>
                                </div>

                                <div class="m-portlet__body m--padding-left-20 m--padding-right-20">
                                    <div class="m-widget19">
                                        <div class="m-widget19__pic m-portlet-fit--top m-portlet-fit--sides" style="min-height-: 286px" rel="color_1">
                                            <img src="images/01.jpg" alt="">
                                            <h3 class="m-widget19__title m--font-light titulo_menu"><strong>Classes</strong> </h3>
                                            <div class="m-widget19__shadow"></div>
                                        </div>

                                        <div class="m-widget19__content">
                                            <div class="m-widget19__body"> You can manage classes</div>
                                        </div>
                                        <ul class="m-nav">
                                            <li class="m-nav__item">
                                                <a class="m-nav__link" href="/miempresa/venta/nuevo">
                                                    <i class="m-nav__link-icon flaticon-plus"></i>
                                                    <span class="m-nav__link-text">New Class</span>
                                                </a>
                                            </li>
                                            <li class="m-nav__item">
                                                <a class="m-nav__link" href="classes">
                                                    <i class="m-nav__link-icon flaticon-list-2"></i>
                                                    <span class="m-nav__link-text">List Class</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="col-xl-6 m--padding-5">

                            <div class="m-portlet m-portlet--bordered-semi m-portlet--full-height  m-portlet--rounded-force" >
                                <div class="m-portlet__head m-portlet__head--fit">
                                    <div class="m-portlet__head-caption"><div class="m-portlet__head-action"></div></div>
                                </div>

                                <div class="m-portlet__body m--padding-left-20 m--padding-right-20">
                                    <div class="m-widget19">
                                        <div class="m-widget19__pic m-portlet-fit--top m-portlet-fit--sides" style="min-height-: 286px" rel="color_1">
                                            <img src="images/02.jpg" alt="">
                                            <h3 class="m-widget19__title m--font-light titulo_menu"><strong>Students</strong> </h3>
                                            <div class="m-widget19__shadow"></div>
                                        </div>

                                        <div class="m-widget19__content">
                                            <div class="m-widget19__body"> You can manage students</div>
                                        </div>
                                        <ul class="m-nav">
                                            <li class="m-nav__item">
                                                <a class="m-nav__link" href="students?action=itemUpdate&id=&type=new">
                                                    <i class="m-nav__link-icon flaticon-plus"></i>
                                                    <span class="m-nav__link-text">New Student</span>
                                                </a>
                                            </li>
                                            <li class="m-nav__item">
                                                <a class="m-nav__link" href="students">
                                                    <i class="m-nav__link-icon flaticon-list-2"></i>
                                                    <span class="m-nav__link-text">List Students</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>                    
                </div>
            </div>

        </div>
        
        
        <div class="col-xl-3 col-lg-4 m--padding-left-5">
            <div class="m-portlet m-portlet--full-height  ">
                <div class="m-portlet__body m--padding-10">

                    <div class="m-card-profile">
                        <div class="cuadro-estado m--padding-10 m--margin-bottom-10" >
                            <div class="titulo-estado text-center">Henry Taby</div>
                        </div>

                        
                    </div>
                    

                    <div class="m-widget1 m--padding-5">
                        <div class="m-widget1__item resumen_global" >
                            <div class="row m-row--no-padding align-items-center">
                                <div class="col-lg-8">
                                    <h3 class="m-widget1__title">Total Classes </h3>
                                    <span class="m-widget1__desc">Registered Classes</span>
                                </div>
                                <div class="col-lg-4 m--align-right">
                                    <span class="m-widget1__number m--font-info" id="resumen_especies">2</span>
                                </div>
                            </div>
                        </div>

                        <div class="m-widget1__item resumen_global" >
                            <div class="row m-row--no-padding align-items-center">
                                <div class="col-lg-8">
                                    <h3 class="m-widget1__title">Total Students </h3>
                                    <span class="m-widget1__desc">Registered Students</span>
                                </div>
                                <div class="col-lg-4 m--align-right">
                                    <span class="m-widget1__number m--font-success" id="resumen_especies">1</span>
                                </div>
                            </div>
                        </div>

                        
                    </div>
                </div>

            </div>
        </div>
    </div>

<jsp:include page="Components/footer.jsp"/>
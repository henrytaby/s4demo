<%-- 
    Document   : header
    Created on : 27-02-2021, 04:24:42 AM
    Author     : henry.taby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <!-- begin::Head -->
    <head>
        <meta charset="utf-8" />
        <title>S4 Demo</title>
        <meta name="description" content="UYUNI - Mi Empresa">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--begin::Page Vendors -->
        <link href="/s4demo/themes/metro/assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <!--end::Page Vendors -->

        <!--begin::Base Styles -->
        <link href="/s4demo/themes/metro/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/s4demo/themes/metro/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
        <!--end::Base Styles -->
        <!--begin::Fonts Styles -->
        <link href="/s4demo/themes/fonts.css" rel="stylesheet" type="text/css" />
        <!--end::Fonts Styles -->

        <style>
            .loader {
                border: 16px solid #f3f3f3; /* Light grey */
                border-top: 16px solid #3498db; /* Blue */
                border-radius: 50%;
                width: 120px;
                height: 120px;
                animation: spin 2s linear infinite;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
    </head>
    <!-- end::Head -->
    <!-- end::Body -->
    <body class="m-page--fluid m--skin- m-page--loading m-page--loading-enabled
          m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas
          m-footer--push m-aside--offcanvas-default " style="">
        <!-- begin::Page loader -->
        <div class="m-page-loader m-page-loader--base">
            <div class="m-blockui">
                <span>Cargando UYUNI...</span>
                <span><div class="m-loader m-loader--success"></div></span>
            </div>
        </div>
        <!-- end::Page Loader -->

        <!-- begin:: Page -->
        <div class="m-grid m-grid--hor m-grid--root m-page">
            <!-- BEGIN: Header -->
            <header id="m_header" class="m-grid__item    m-header "m-minimize-offset="200" m-minimize-mobile-offset="200" >

                <div class="m-container m-container--fluid m-container--full-height">
                    <div class="m-stack m-stack--ver m-stack--desktop">
                        <!-- BEGIN: Brand -->
                        <div class="m-stack__item m-brand  m-brand--skin-dark ">
                            <div class="m-stack m-stack--ver m-stack--general">
                                <div class="m-stack__item m-stack__item--middle m-brand__logo">
                                    <a href="/" class="m-brand__logo-wrapper">
                                        <img alt="Henry Taby" src="images/logo/logo_white.png" width="160"/>
                                    </a>
                                </div>
                                <div class="m-stack__item m-stack__item--middle m-brand__tools">
                                    <!-- BEGIN: Left Aside Minimize Toggle -->
                                    <a href="javascript:;" id="m_aside_left_minimize_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block">
                                        <span></span>
                                    </a>
                                    <!-- END -->
                                    <!-- BEGIN: Responsive Aside Left Menu Toggler -->
                                    <a href="javascript:;" id="m_aside_left_offcanvas_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block">
                                        <span></span>
                                    </a>
                                    <!-- END -->
                                    <!-- BEGIN: Responsive Header Menu Toggler -->
                                    <a id="m_aside_header_menu_mobile_toggle" href="javascript:;" class="m-brand__icon m-brand__toggler m--visible-tablet-and-mobile-inline-block">
                                        <span></span>
                                    </a>
                                    <!-- END -->
                                    <!-- BEGIN: Topbar Toggler -->
                                    <a id="m_aside_header_topbar_mobile_toggle" href="javascript:;" class="m-brand__icon m--visible-tablet-and-mobile-inline-block">
                                        <i class="flaticon-more"></i>
                                    </a>
                                    <!-- BEGIN: Topbar Toggler -->
                                </div>
                            </div>
                        </div>            <!-- END: Brand -->


                        <div class="m-stack__item m-stack__item--fluid m-header-head" id="m_header_nav">
                            <!-- BEGIN: Horizontal Menu -->
                            <button class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark " id="m_aside_header_menu_mobile_close_btn">
                                <i class="la la-close"></i>
                            </button>

                            <div id="m_header_menu" class="m-header-menu m-aside-header-menu-mobile m-aside-header-menu-mobile--offcanvas  m-header-menu--skin-light m-header-menu--submenu-skin-light m-aside-header-menu-mobile--skin-dark m-aside-header-menu-mobile--submenu-skin-dark "  >

                                <ul class="m-menu__nav  m-menu__nav--submenu-arrow ">
                                    <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel"  m-menu-submenu-toggle="click" m-menu-link-redirect="1" aria-haspopup="true">
                                        <a href="javascript:;" class="m-menu__link m-menu__toggle">
                                            <i class="m-menu__link-icon flaticon-layers"></i>
                                            <span class="m-menu__link-text">Mas Sobre Henry Taby</span>
                                            <i class="m-menu__hor-arrow la la-angle-down"></i>
                                            <i class="m-menu__ver-arrow la la-angle-right"></i>
                                        </a>
                                        <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left">
                                            <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                                            <ul class="m-menu__subnav">
                                                <li class="m-menu__item "  aria-haspopup="true">
                                                    <a  href="http://henrytaby.com" target="_blank" class="m-menu__link ">
                                                        <i class="m-menu__link-icon fab fa-hotjar"></i>
                                                        <span class="m-menu__link-text">Página Web</span>
                                                    </a>
                                                </li>
                                                <li class="m-menu__item "  aria-haspopup="true">
                                                    <a  href="https://www.facebook.com/henrytaby" target="_blank" class="m-menu__link ">
                                                        <i class="m-menu__link-icon fab fa-hotjar"></i>
                                                        <span class="m-menu__link-text">Facebook</span>
                                                    </a>
                                                </li>
                                                <li class="m-menu__item "  aria-haspopup="true">
                                                    <a  href="https://www.linkedin.com/in/henrytaby/" target="_blank" class="m-menu__link ">
                                                        <i class="m-menu__link-icon fab fa-hotjar"></i>
                                                        <span class="m-menu__link-text">Linkedin</span>
                                                    </a>
                                                </li>


                                            </ul>
                                        </div>
                                    </li>
                                </ul>

                            </div>                <!-- END: Horizontal Menu -->
                            <!-- BEGIN: Topbar -->
                            <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general m-stack--fluid">
                                <div class="m-stack__item m-topbar__nav-wrapper">
                                    <ul class="m-topbar__nav m-nav m-nav--inline">


                                        <li class="m-nav__item m-topbar__user-profile m-topbar__user-profile--img
                                            m-dropdown m-dropdown--medium m-dropdown--arrow m-dropdown--header-bg-fill m-dropdown--align-right
                                            m-dropdown--mobile-full-width m-dropdown--skin-light" m-dropdown-toggle="click">
                                            <a href="#" class="m-nav__link m-dropdown__toggle">
                                                <span class="m-topbar__userpic">
                                                    <img src="images/default.png" class="m--img-rounded m--marginless m--img-centered" alt=""/>
                                                </span>
                                            </a>

                                            <div class="m-dropdown__wrapper">
                                                <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                                <div class="m-dropdown__inner">

                                                    <div class="m-dropdown__header m--align-center" style="background: #434441; background-size: cover;">
                                                        <div class="m-card-user m-card-user--skin-dark">
                                                            <div class="m-card-user__pic">
                                                                <img src="/?accion=getPhoto" class="m--img-rounded m--marginless" alt=""/>
                                                            </div>
                                                            <div class="m-card-user__details">
                                                                <span class="m-card-user__name m--font-weight-500">Usuario Público</span>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="m-dropdown__body">
                                                        <div class="m-dropdown__content">
                                                            <ul class="m-nav m-nav--skin-light">


                                                                <li class="m-nav__item">
                                                                    Nunca dejes de soñar
                                                                </li>


                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>                <!-- END: Topbar -->
                        </div>

                    </div>
                </div>
            </header>    <!-- END: Header -->

            <!-- begin::Body -->
            <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
                <!-- BEGIN: Left Aside -->
                <button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn"><i class="la la-close"></i></button>
                <div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark ">
                    <div id="m_ver_menu"
                         class="m-aside-menu m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark m-scroller ps ps--active-y"

                         m-menu-vertical="1"
                         m-menu-scrollable="1"
                         m-menu-dropdown-timeout="500"
                         style="position: relative; overflow: hidden;">
                        <ul class="m-menu__nav  m-menu__nav--dropdown-submenu-arrow " style="padding: 0px;">

                            <li class="m-menu__item " aria-haspopup="true"  style=" border-bottom: 1px dotted #525780;">
                                <a  href="/s4demo" class="m-menu__link ">
                                    <i class="m-menu__link-icon fa fa-home"></i>
                                    <span class="m-menu__link-title">
                                        <span class="m-menu__link-wrap">
                                            <span class="m-menu__link-text">Home</span>
                                            <span class="m-menu__link-badge"><span class="m-badge m-badge--info">&nbsp;</span></span>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="m-menu__section" style="border-bottom: 2px solid #387ec9; margin: 0px;">
                                <h4 class="m-menu__section-text" style="color:whitesmoke;" >Test Técnico</h4>
                                <i class="m-menu__section-icon flaticon-more-v2"></i>
                            </li>


                            <li class="m-menu__item m-menu__item--submenu " aria-haspopup="true"  >

                                <a  href="javascript:;" class="m-menu__link m-menu__toggle" style=" border-bottom: 1px dotted #0699b3;">
                                     <i class="m-menu__link-icon flaticon-tool"></i>
                                    <span class="m-menu__link-text">Classes</span>
                                    <i class="m-menu__ver-arrow la la-angle-right"></i>
                                </a>
                                <div class="m-menu__submenu ">
                                    <span class="m-menu__arrow"></span>
                                    <ul class="m-menu__subnav">
                                        <li class="m-menu__item " aria-haspopup="true" >
                                            <a class="m-menu__link " href="/miempresa/venta/nuevo">
                                                <i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
                                                <span class="m-menu__link-text">New Classe </span>
                                            </a>
                                        </li>
                                        <li class="m-menu__item " aria-haspopup="true" >
                                            <a class="m-menu__link " href="control?action=classes" >
                                                <i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
                                                <span class="m-menu__link-text">List Classes </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            
                            
                            <li class="m-menu__item m-menu__item--submenu " aria-haspopup="true"  >

                                <a  href="javascript:;" class="m-menu__link m-menu__toggle" style=" border-bottom: 1px dotted #0699b3;">
                                     <i class="m-menu__link-icon flaticon-users"></i>
                                    <span class="m-menu__link-text">Students</span>
                                    <i class="m-menu__ver-arrow la la-angle-right"></i>
                                </a>
                                <div class="m-menu__submenu ">
                                    <span class="m-menu__arrow"></span>
                                    <ul class="m-menu__subnav">
                                        <li class="m-menu__item " aria-haspopup="true" >
                                            <a class="m-menu__link " href="students?action=new">
                                                <i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
                                                <span class="m-menu__link-text">New student </span>
                                            </a>
                                        </li>
                                        <li class="m-menu__item " aria-haspopup="true" >
                                            <a class="m-menu__link " href="students" >
                                                <i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
                                                <span class="m-menu__link-text">List students </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div></div>
                <!-- END: Left Aside -->
                <div class="m-grid__item m-grid__item--fluid m-wrapper">
                    <!-- BEGIN: Subheader -->
                    <div class="m-subheader m--padding-top-5" >
                        <div class="d-flex align-items-center">
                            <div class="mr-auto">
                                <h3 class="m-subheader__title m-subheader__title--separator"> My S4 </h3>
                                <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                    <li class="m-nav__item m-nav__item--home">
                                        <a href="/miempresa" class="m-nav__link m-nav__link--icon"><i class="m-nav__link-icon la la-home"></i></a>
                                    </li>
                                    <li class="m-nav__item">
                                        <a href="/miempresa" class="m-nav__link"><span class="m-nav__link-text">Home</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- END: Subheader -->
<div class="m-content m--padding-top-5">
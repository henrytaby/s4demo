<%-- 
    Document   : footer
    Created on : 27-02-2021, 04:23:26 AM
    Author     : henry.taby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
</div>
 </div>
            </div>
            <!-- end:: Body -->

            <!-- begin::Footer -->
            <footer class="m-grid__item	m-footer ">
                <div class="m-container m-container--fluid m-container--full-height m-page__container">
                    <div class="m-stack m-stack--flex-tablet-and-mobile m-stack--ver m-stack--desktop">
                        <div class="m-stack__item m-stack__item--left m-stack__item--middle m-stack__item--last">
                            <span class="m-footer__copyright">
                                2021 &copy; <a href="http://henrytaby.com" target="_blank" class="m-link">Henry Taby </a> - henrytaby.com  - v 0.0.1
                            </span>
                        </div>
                        <div class="m-stack__item m-stack__item--right m-stack__item--middle m-stack__item--first">
                            <ul class="m-footer__nav m-nav m-nav--inline m--pull-right">
                                <li class="m-nav__item m-nav__item">
                                    <a href="/"  class="m-nav__link" data-toggle="m-tooltip" title="Inicio UYUNI" data-placement="left">
                                        <i class="m-nav__link-icon flaticon-info m--icon-font-size-lg3"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>    <!-- end::Footer -->
        </div>
        <!-- end:: Page -->

        <!-- begin::Scroll Top -->
        <div id="m_scroll_top" class="m-scroll-top">
            <i class="la la-arrow-up"></i>
        </div>
        <!-- end::Scroll Top -->
        <!--begin::Base Scripts -->
        <script src="/s4demo/themes/metro/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
        <script src="/s4demo/themes/metro/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
        <!--end::Base Scripts -->

        <!--begin::Page Vendors -->
        <script src="/s4demo/themes/metro/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
        <!--end::Page Vendors -->
        <!--begin::number -->
        <script src="/s4demo/Resources/js/jquery.number/jquery.number.min.js" type="text/javascript"></script>
        <!--end::number -->


        
        <script src="/s4demo/Resources/js/datepicker.spanish.js" type="text/javascript"></script>
        <!-- begin::Page Loader -->
        <script>
        $(window).on('load', function () {
            $('body').removeClass('m-page--loading');
        });
        var cargando_vista = '<div class="sk-folding-cube dis-none">' +
                '        <div class="sk-cube1 sk-cube"></div>' +
                '        <div class="sk-cube2 sk-cube"></div>' +
                '        <div class="sk-cube4 sk-cube"></div>' +
                '        <div class="sk-cube3 sk-cube"></div>' +
                '    </div>';
        </script>

        <!-- end::Page Loader -->
    </body>
    <!-- end::Body -->
</html>
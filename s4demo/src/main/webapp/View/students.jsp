<%-- 
    Document   : students
    Created on : 27-02-2021, 04:50:41 AM
    Author     : henry.taby
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/Components/header.jsp"/>


<div class="table-responsive">
    <table class="table table-active table-bordered table-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Last name</th>
            <th>Phone Number</th>
            <th>Description</th>
            <th>Address</th>
            <th>Email</th>
            <th></th>
        </tr>
        <c:forEach items="${baseM}" var="m">
            <tr>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.last_name}</td>
                <td>${m.phone_number}</td>
                <td>${m.description}</td>
                <td>${m.address}</td>
                <td>${m.email}</td>
                <th>
                    <a href="control?action=Eliminar&id=${m.id}" class="btn btn-warning">Eliminar</a>
                </th>
                <th>
                    <a href="control?action=Actualizar&id=${m.id}" class="btn btn-info">Actualizar</a>
                </th>
            </tr>
        </c:forEach>
    </table>
    <a href="control?action=nuevoMa" class="btn btn-block btn-dark">Nueva Matricula</a>
</div>
                
        
<jsp:include page="/Components/footer.jsp"/>

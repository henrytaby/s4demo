/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.studentsDAO;
import Entity.Students;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author henry.taby
 */
@WebServlet(name = "students", urlPatterns = {"/students"})
public class students extends HttpServlet {

       
    studentsDAO studentsDAO;
    public students(){
        super();
        studentsDAO = new studentsDAO();
    }
    private RequestDispatcher dis;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ruta = "";
        String action = request.getParameter("action");
        if(action == null ){
            action="index";
        }
        switch(action){
                case "itemupdatesql":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.itemUpdateSQL(request, response,ruta);
                break;
                case "tabGeneral":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/students/general.jsp";
                    this.general(request, response,ruta);
                break;
                
                case "itemUpdate":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/students/item.jsp";
                    this.item(request, response,ruta);
                break;
                case "delete":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.deleteJson(request, response,ruta);
                break;
                case "listJson":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.listJson(request, response,ruta);
                break;
                default:
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/students/list.jsp";
                    this.list(request, response,ruta);
                    break;
        }
        
    }
    
    protected void itemUpdateSQL(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String respuesta = "1";

        String msg = "";

        Students st = new Students();
        String id = request.getParameter("itemId");
        st.setName(request.getParameter("txtname"));
        st.setLast_name(request.getParameter("txtlast_name"));
        st.setPhone_number(request.getParameter("phone_number"));
        st.setAddress(request.getParameter("txtaddress"));
        st.setEmail(request.getParameter("txtemail"));
        st.setDescription(request.getParameter("txtdescription"));

        String itemId = id;
        try {
            String msj = "";
            if (id == null || id.isEmpty()) {
                msj = studentsDAO.insert(st);
            } else {
                st.setId(Integer.parseInt(id));
                msg = studentsDAO.update(st);
            }
          
        } catch (Exception e) {
            System.out.println("Error: "+ e);
            respuesta = "2";
            msg = "error :"+ e.getMessage();
        }
           String res = "{\"res\":\""+respuesta+"\",\"msg\":\""+msg+"\",\"id\":\""+itemId+"\"}";
           out.print(res);
           out.flush();

    }
    
    protected void general(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            request.setAttribute("id", id);
            request.setAttribute("type", type);
            request.setAttribute("ruta", "students");
            
            request.setAttribute("item", studentsDAO.getStudents(Integer.parseInt(id)));

        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }

        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    protected void item(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            request.setAttribute("id", id);
            request.setAttribute("type", type);
            request.setAttribute("ruta", "students");
            
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    protected void deleteJson(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String respuesta = "1";
        String msg = "";
        try {
           String id = request.getParameter("id");
           if( id !="" && id!= null){
               String msgDelete = studentsDAO.delete(Integer.parseInt(id));
               if (msgDelete!="1"){
                   respuesta = "2";
                   msg = msgDelete;
               }
           }else{
               respuesta = "2";
               msg = "error id is null or empty";
           }
        } catch (Exception e) {
            System.out.println("Error: "+ e);
            respuesta = "2";
            msg = "error :"+ e.getMessage();
        }
           String res = "{\"res\":\""+respuesta+"\",\"msg\":\""+msg+"\"}";
           out.print(res);
           out.flush();
           
    }
    
    protected void listJson(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
           
           String json = new Gson().toJson(studentsDAO.getList());
           String res = "{\"data\":"+json+"}";
           out.print(res);
           out.flush();
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
    }
    protected void list(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            request.setAttribute("baseM", studentsDAO.getList());
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }

        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

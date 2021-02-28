/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.classesDAO;
import DAO.studentsDAO;
import Entity.Classes;
import Entity.studentclass;
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
@WebServlet(name = "classes", urlPatterns = {"/classes"})
public class classes extends HttpServlet {

    classesDAO classesDAO;
    public classes(){
        super();
        classesDAO = new classesDAO();
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
            
                case "itemstudentupdatesql":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.itemstudentupdatesql(request, response,ruta);
                break;
                
                case "itemUpdateStudent":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/classes/studentsform.jsp";
                    this.itemStudent(request, response,ruta);
                break;
                
                case "deletestudent":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.deleteStudentJson(request, response,ruta);
                break;
                
                case "listStudentsJson":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.listStudentsJson(request, response,ruta);
                break;
                
                case "tabStudents":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/classes/students.jsp";
                    this.students(request, response,ruta);
                break;
                
                case "itemupdatesql":
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    this.itemUpdateSQL(request, response,ruta);
                break;
                
                case "tabGeneral":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/classes/general.jsp";
                    this.general(request, response,ruta);
                break;
                
                case "itemUpdate":
                    response.setContentType("text/html;charset=UTF-8");
                    ruta = "View/classes/item.jsp";
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
                    ruta = "View/classes/list.jsp";
                    this.list(request, response,ruta);
                    break;
        }
    }
    
    protected void itemstudentupdatesql(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String respuesta = "1";
System.out.println("---------------------");
        String msg = "";

        studentclass st = new studentclass();
        String id = request.getParameter("id");
        String item_id = request.getParameter("item_id");
        
        System.out.println("---------------------");
        
        st.setStudent_id(Integer.parseInt(request.getParameter("student_id")));
        st.setClass_id(Integer.parseInt(item_id));
       
        String itemId = id;
        try {
            String msj = "";
            if (id == null || id.isEmpty()) {
                Integer idr;
                idr= classesDAO.insertStudent(st);
                id = String.valueOf(idr);
            } else {
                 //System.out.println("Actualizar datos");
                /*
                 st.setId(Integer.parseInt(id));
                msg = studentsDAO.update(st);
                */
            }
          
        } catch (Exception e) {
            System.out.println("Error: "+ e);
            respuesta = "2";
            msg = "error :"+ e.getMessage();
        }
           String res = "{\"res\":\""+respuesta+"\",\"msg\":\""+msg+"\",\"id\":\""+id+"\"}";
           out.print(res);
           out.flush();

    }
    
    protected void itemStudent(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            String item_id = request.getParameter("item_id");
            String type = request.getParameter("type");
            request.setAttribute("id", id);
            request.setAttribute("item_id", item_id);
            request.setAttribute("type", type);
            request.setAttribute("ruta", "classes");
            
            request.setAttribute("classesopt", classesDAO.getStudentsListOpt(Integer.parseInt(item_id)));
            request.setAttribute("item", classesDAO.getStudentsClass(Integer.parseInt(id)));
            
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    
    protected void deleteStudentJson(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String respuesta = "1";
        String msg = "";
        try {
           String id = request.getParameter("id");
           if( id !="" && id!= null){
               String msgDelete = classesDAO.deleteStudent(Integer.parseInt(id));
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
    
    
    protected void listStudentsJson(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
           String id = request.getParameter("id");
                             
           String json = new Gson().toJson(classesDAO.getStudentsList(Integer.parseInt(id)));
           String res = "{\"data\":"+json+"}";
           out.print(res);
           out.flush();
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
    }
    
    
    protected void students(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            request.setAttribute("id", id);
            request.setAttribute("type", type);
            request.setAttribute("ruta", "classes");
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }

        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }

    protected void itemUpdateSQL(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String respuesta = "1";

        String msg = "";

        Classes st = new Classes();
        String id = request.getParameter("itemId");
        st.setName(request.getParameter("txtname"));
        st.setDescription(request.getParameter("txtdescription"));
        
        String itemId = id;
        try {
            String msj = "";
            if (id == null || id.isEmpty()) {
                Integer idr;
                idr= classesDAO.insert(st);
                id = String.valueOf(idr);
            } else {
                /* 
                System.out.println("Actualizar datos");
                System.out.println("---------------------------------");
                */
                st.setId(Integer.parseInt(id));
                msg = classesDAO.update(st);
            }
          
        } catch (Exception e) {
            System.out.println("Error: "+ e);
            respuesta = "2";
            msg = "error :"+ e.getMessage();
        }
           String res = "{\"res\":\""+respuesta+"\",\"msg\":\""+msg+"\",\"id\":\""+id+"\"}";
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
            
            request.setAttribute("item", classesDAO.getClasses(Integer.parseInt(id)));

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
            request.setAttribute("ruta", "classes");
            
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
               String msgDelete = classesDAO.delete(Integer.parseInt(id));
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
           
           String json = new Gson().toJson(classesDAO.getList());
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
            //request.setAttribute("baseM", classesDAO.getList());
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


}

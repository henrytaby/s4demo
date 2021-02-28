/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.classesDAO;
import Entity.Classes;
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.studentsDAO;
import java.io.IOException;
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
@WebServlet(name = "control", urlPatterns = {"/control"})
public class control extends HttpServlet {

    studentsDAO studentsDAO;
    public control(){
        super();
        studentsDAO = new studentsDAO();
    }
    
    private RequestDispatcher dis;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String ruta = "";
        String action = request.getParameter("action");
        switch(action){
            
                case "classes":
                    ruta = "View/classes.jsp";
                    this.classes(request, response,ruta);
                break;
                case "students":
                    ruta = "View/students.jsp";
                    this.students(request, response,ruta);
                break;
        }
        
    }
    
    protected void classes(HttpServletRequest request, HttpServletResponse response,String ruta)
            throws ServletException, IOException {
        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    protected void students(HttpServletRequest request, HttpServletResponse response,String ruta)
            throws ServletException, IOException {
        
        try {
            request.setAttribute("baseM", studentsDAO.getList());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    
    protected void menu(HttpServletRequest request, HttpServletResponse response,String ruta)
            throws ServletException, IOException {
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

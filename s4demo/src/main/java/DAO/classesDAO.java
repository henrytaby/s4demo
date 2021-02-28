/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Classes;
import Entity.StudentClasses;
import Entity.Students;
import Entity.studentclass;
import com.google.gson.JsonObject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author henry.taby
 */
public class classesDAO extends Conexion{
    
    
    public int insertStudent(studentclass ma) throws Exception {
        String msj = "";
        int generatedkey=0;
        try {
            this.Connect();
            String query = "insert into student_class (student_id,class_id) values (?,?)";
            PreparedStatement stm = this.getCnx().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, ma.getStudent_id());
            stm.setInt(2, ma.getClass_id());
            
            int valor = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            
            if (rs.next()) {
                generatedkey=rs.getInt(1);   
                //System.out.println("Auto Generated Primary Key " + generatedkey); 
            }
            
            if(valor > 0){
                msj = "Datos Insertados Correctamente";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return generatedkey;
    }
    
    public ArrayList<Students> getStudentsListOpt(int id) throws Exception{
        ArrayList<Students> lista = new ArrayList<Students>();
        
        try {
            this.Connect();

            String Query = "SELECT * FROM student AS s " +
                            "WHERE s.id NOT IN(SELECT sc.student_id FROM student_class AS sc WHERE sc.class_id=?) ";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            

            while(rt.next()){
                Students c = new Students();
                c.setId(rt.getInt("id"));
                c.setName(rt.getString("name"));
                c.setLast_name(rt.getString("last_name"));
                lista.add(c);   
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error : "+ e.getMessage());
        } finally{
            this.Disconnect();
        }
        
        return lista;
    }
    
    public studentclass getStudentsClass(int id) throws Exception {

        studentclass m = new studentclass();
        try {
            this.Connect();
            String Query = "SELECT sc.id,sc.student_id,sc.class_id, c.name AS class_name, s.name AS student_name, s.last_name\n" +
                "FROM student_class  AS sc\n" +
                "LEFT JOIN class AS c ON c.id =  sc.class_id\n" +
                "LEFT JOIN student AS s ON s.id = sc.student_id\n" +
                "WHERE sc.id= ? ";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                Classes c = new Classes();
                Students s = new Students();
                        
                m.setId(rt.getInt("id"));
                m.setClass_id(rt.getInt("class_id"));
                m.setStudent_id(rt.getInt("student_id"));
                
                c.setId(rt.getInt("class_id"));
                c.setName(rt.getString("class_name"));
                m.setClasses(c);
                
                s.setId(rt.getInt("student_id"));
                s.setName(rt.getString("student_name"));
                s.setLast_name(rt.getString("last_name"));
                m.setStudents(s);
                
            }
        } catch (Exception e) {
            System.out.println("Error  " + e.getMessage());
        } finally {
            this.Disconnect();
        }
        //System.out.println(m);
        return m;
    }
    
    
    public String deleteStudent(int id) throws Exception {
        String msj = "";
        try {
            this.Connect();
            String query = "DELETE FROM student_class WHERE id= ?";
            PreparedStatement stm = this.getCnx().prepareStatement(query);
            stm.setInt(1, id);
            int valor = stm.executeUpdate();
            if(valor > 0){
                msj = "1";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return msj;
    }
    
    public ArrayList<StudentClasses> getStudentsList(int id) throws Exception{
        ArrayList<StudentClasses> lista = new ArrayList<StudentClasses>();
        
        try {
            this.Connect();

            String Query = "SELECT " +
                "sc.id,sc.class_id,sc.student_id,c.id AS class_id,c.name AS class_name,s.id AS student_id,s.name AS student_name " +
                "FROM student_class AS sc " +
                "LEFT JOIN class AS c ON c.id = sc.class_id " +
                "LEFT JOIN student AS s ON s.id = sc.student_id " +
                "WHERE class_id= ?";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
                        
            while(rt.next()){
                StudentClasses a = new StudentClasses();

                a.setId(rt.getInt("id"));
                a.setStudent_name(rt.getString("student_name"));
                lista.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error : "+ e.getMessage());
        } finally{
            this.Disconnect();
        }
        
        return lista;
    }
    
    public ArrayList<Classes> getList() throws Exception{
        
        ArrayList<Classes> lista = new ArrayList<Classes>();
        
        try {
            this.Connect();
            
            String Query = "SELECT id,name,description FROM class";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            ResultSet rt = smt.executeQuery();
            
            while(rt.next()){
                Classes a = new Classes();
                a.setId(rt.getInt("id"));
                a.setName(rt.getString("name"));
                a.setDescription(rt.getString("description"));
                lista.add(a);
            }

        } catch (Exception e) {
            System.out.println("Error : "+ e.getMessage());
        } finally{
            this.Disconnect();
        }
        
        return lista;
    }
    
    public String update(Classes ma) throws Exception {
        String msj = "";
        try {
            this.Connect();
            String query = "update class set name=? ,description=? where id=?";
            System.out.println("---------------------------------");
            PreparedStatement stm = this.getCnx().prepareStatement(query);
            stm.setString(1, ma.getName());
            stm.setString(2, ma.getDescription());
            stm.setInt(3, ma.getId());
            
            int valor = stm.executeUpdate();
            
            
            if(valor > 0){
                msj = "Datos Actualizados Correctamente";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return msj;
    }
    
    public int insert(Classes ma) throws Exception {
        String msj = "";
        int generatedkey=0;
        try {
            this.Connect();
            String query = "insert into class (name,description) values (?,?)";
            PreparedStatement stm = this.getCnx().prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, ma.getName());
            stm.setString(2, ma.getDescription());
            
            int valor = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            
            if (rs.next()) {
                generatedkey=rs.getInt(1);   
                System.out.println("Auto Generated Primary Key " + generatedkey); 
            }
            
            if(valor > 0){
                msj = "Datos Insertados Correctamente";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return generatedkey;
    }
    
    public Classes getClasses(int id) throws Exception {

        Classes m = new Classes();
        try {
            this.Connect();
            String Query = "SELECT * FROM class WHERE id=  ? ";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                m.setId(rt.getInt("id"));
                m.setName(rt.getString("name"));
                m.setDescription(rt.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error  " + e.getMessage());
        } finally {
            this.Disconnect();
        }
        System.out.println(m);
        return m;
    }
    
    public String delete(int id) throws Exception {
        String msj = "";
        try {
            this.Connect();
            String query = "DELETE FROM class WHERE id= ?";
            PreparedStatement stm = this.getCnx().prepareStatement(query);
            stm.setInt(1, id);
            int valor = stm.executeUpdate();
            if(valor > 0){
                msj = "1";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return msj;
    }
    
}

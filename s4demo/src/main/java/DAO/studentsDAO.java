/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Classes;
import Entity.Students;
import com.google.gson.JsonObject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author henry.taby
 */
public class studentsDAO extends Conexion{
    
    public ArrayList<Students> getList() throws Exception{
        ArrayList<Students> lista = new ArrayList<Students>();
        
        
        try {
            this.Connect();
            
            String Query = "SELECT id,name,last_name,phone_number,description,address,email FROM student";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            ResultSet rt = smt.executeQuery();
            
            while(rt.next()){
                Students a = new Students();
                a.setId(rt.getInt("id"));
                a.setName(rt.getString("name"));
                a.setLast_name(rt.getString("last_name"));
                a.setPhone_number(rt.getString("phone_number"));
                a.setDescription(rt.getString("description"));
                a.setAddress(rt.getString("address"));
                a.setEmail(rt.getString("email"));
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
    
    public String update(Students ma) throws Exception {
        String msj = "";
        try {
            this.Connect();
            String query = "update student set name=? ,last_name=? ,phone_number =?,description=?,address=?,email=? where id=?";
            PreparedStatement stm = this.getCnx().prepareStatement(query);
            stm.setString(1, ma.getName());
            stm.setString(2, ma.getLast_name());
            stm.setString(3, ma.getPhone_number());
            stm.setString(4, ma.getDescription());
            stm.setString(5, ma.getAddress());
            stm.setString(6, ma.getEmail());
            stm.setInt(7, ma.getId());
            
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
    
    public String insert(Students ma) throws Exception {
        String msj = "";
        try {
            this.Connect();
            String query = "insert into student (name,last_name,phone_number,description,address,email) values (?,?,?,?,?,?)";
            PreparedStatement stm = this.getCnx().prepareStatement(query);
            stm.setString(1, ma.getName());
            stm.setString(2, ma.getLast_name());
            stm.setString(3, ma.getPhone_number());
            stm.setString(4, ma.getDescription());
            stm.setString(5, ma.getAddress());
            stm.setString(6, ma.getEmail());
            
            int valor = stm.executeUpdate();
            if(valor > 0){
                msj = "Datos Insertados Correctamente";
            }
        } catch (Exception e) {
            msj = "Error : " + e.getMessage();
        } finally {
            this.Disconnect();
        }
        return msj;
    }
    
    public Students getStudents(int id) throws Exception {

        Students m = new Students();
        try {
            this.Connect();
            String Query = "SELECT * FROM student WHERE id=  ? ";
            PreparedStatement smt = this.getCnx().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                m.setId(rt.getInt("id"));
                m.setName(rt.getString("name"));
                m.setLast_name(rt.getString("last_name"));
                m.setPhone_number(rt.getString("phone_number"));
                m.setDescription(rt.getString("description"));
                m.setAddress(rt.getString("address"));
                m.setEmail(rt.getString("email"));
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
            String query = "DELETE FROM student WHERE id= ?";
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

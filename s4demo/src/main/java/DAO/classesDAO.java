/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Classes;
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

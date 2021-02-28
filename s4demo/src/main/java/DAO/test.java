/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author henry.taby
 */
public class test {
    public static void main(String[] args){
        try{
            Conexion cn = new Conexion();
            cn.Connect();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Error : " + e.getMessage());
        }
    }
}

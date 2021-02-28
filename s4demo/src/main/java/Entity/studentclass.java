/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author henry.taby
 */
public class studentclass {
    private int id;
    private Classes class_id;
    private Students student_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Classes getClass_id() {
        return class_id;
    }

    public void setClass_id(Classes class_id) {
        this.class_id = class_id;
    }

    public Students getStudent_id() {
        return student_id;
    }

    public void setStudent_id(Students student_id) {
        this.student_id = student_id;
    }
    
}

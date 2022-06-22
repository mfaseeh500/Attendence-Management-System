
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MUHAMMAD FASEEH
 */
public class Employee {
    private String id,name,age,d_ID,d_name,designation,salary,email,p_num,password, doj, dol;
  private String status,shiftid,shiftname,shifttiming,date;
public String getId(){
    return id;
}
public String getName(){
    return name;
}

public String getAge(){
    return age;
}
public String getDepartmentID(){
    return d_ID;
}
public String getDepartmentname(){
    return d_name;
}
public String getDesignation(){
    return designation;
}
public String getSalary(){
    return salary;
}
public String getEmail(){
    return email;
}
public String getPhonenumber(){
    return p_num;
}
public String getPassword(){
    return password;
}
public String getDOJ(){
    return doj;
}
public String getDOL(){
    return dol;
}
public void setName(String name){
    
    this.name=name;
}
public void setId(String id){
    this.id=id;
}
public void setAge(String age){
    this.age=age;
}
public void setDepartmentID(String d_ID){
    this.d_ID=d_ID;
}
public void setDepartmentname(String d_name){
    this.d_name=d_name;
}
public void setDesignation(String designation){
    this.designation=designation;
}
public void setSalary(String salary){
    this.salary=salary;
}
public void setEmail(String email){
    this.email=email;
}
public void setPhonenumber(String p_num){
    this.p_num=p_num;
}
public void setPassword(String password){
    this.password=password;
}
public void setDOJ(String doj){
    this.doj=doj;
}
public void setDOL(String dol){
    this.dol=dol;
}
public String getStatus(){
    return status;
}
public String getShiftid(){
    return shiftid;
}
public String getShiftname(){
    return shiftname;
}
public String getShifttiming(){
    return shifttiming;
}
public String getDate(){
    return date;
}
public void setStatus(String status){
    
    this.status=status;
}
public void setShiftid(String shiftid){
    
    this.shiftid=shiftid;
}
public void setShiftname(String shiftname){
    
    this.shiftname=shiftname;
}
public void setShifttiming(String shifttiming){
    
    this.shifttiming=shifttiming;
}
public void setDate(String date){
    
    this.date=date;
}
}

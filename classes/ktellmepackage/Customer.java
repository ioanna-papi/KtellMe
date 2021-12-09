package ktellmepackage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Customer {
    
    private int custid;
    private String firstname;
    private String surname;
    private String username;
    private String password;
    private String birth;
    private String phonenumber;

    /**
	 * Constructor
	 * 
     * @param custid 
	 * @param firstname
	 * @param surname
	 * @param username
	 * @param password
     * @param birth
     * @param phonenumber
	 */

	public Customer(int custid, String firstname, String surname, String username, String password,
            String birth, String phonenumber) {

        this.custid = custid;
        this.firstname = firstname;
        this.surname = surname;
        this.username = username;
        this.password = password;
        this.birth = birth;
        this.phonenumber = phonenumber;
    }

    public int getCustid() {
        return this.custid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstame(String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirth() {
        return this.birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getPhonenumber() {
        return this.phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
    
    @Override
	public String toString() {
		return "Customer [id=" + custid + ", name=" + firstname + ", surname=" + surname + ", username=" + username + "]";
	}	
	
} //End of class  

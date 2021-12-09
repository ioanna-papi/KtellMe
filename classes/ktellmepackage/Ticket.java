package ktellmepackage;

public class Ticket extends Product{

    private String firstname;
    private String surname;
    private String email;
    private String phone;
    private Double discount;

    /**
	 * Constructor
	 * 
	 * @param firstname
	 * @param surname
	 * @param email
	 * @param phone
     * @param discount
	 */

    public Ticket(int productid, Double price, int time, String date, int from, int to, String firstname, String surname, String email, String phone, Double discount) {
        super(productid, price, time, date, from, to);
        this.firstname = firstname;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.discount = discount;
    }

    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getDiscount() {
        return this.discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double calculatetPrice (Double price, int diafora, Double disc) {
        Double fprice = price;
        try {
            fprice = price / (6-diafora);
            fprice = fprice*(1-disc);
        } catch(Exception e) {
            
        }
        return fprice;
    }



    @Override
	public String toString() {
		return "Ticket [id = " + getProductid() + ", name=" + firstname + ", surname=" + surname + ", username=" + email + "]";
    }

}


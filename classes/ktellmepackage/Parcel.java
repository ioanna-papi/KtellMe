package ktellmepackage;

public class Parcel extends Product{

    private String receiverName;
    private String receiverSurname;
    private String receiverEmail;
    private String receiverPhone;
    private String senderName;
    private String senderSurname;
    private String senderEmail;
    private String senderPhone;
    private Double height;
    private Double length;
    private Double width;
    private Double weight;
    private String comments;


    /**
	 * Constructor
	 * 
	 * @param receiverName
	 * @param receiverSurname
	 * @param receiverEmail
	 * @param receiverPhone
     * @param senderName
     * @param senderSurname
     * @param senderEmail
     * @param senderPhone
     * @param height;
     * @param length;
     * @param width; 
     * @param weight; 
     * @param comments;
     * 
	 */

    public Parcel(int productid, Double price, int time, String date, int from, int to, String receiverName, String receiverSurname, String receiverEmail, String receiverPhone, 
    String senderName, String senderSurname, String senderEmail, String senderPhone, Double height, Double length, Double width, Double weight, String comments) {
        super(productid, price, time, date, from, to);
        this.receiverName = receiverName;
        this.receiverSurname = receiverSurname;
        this.receiverEmail = receiverEmail;
        this.receiverPhone = receiverPhone;
        this.senderName = senderName;
        this.senderSurname = senderSurname;
        this.senderEmail = senderEmail;
        this.senderPhone = senderPhone;
        this.height = height;
        this.length = length;
        this.width = width;
        this.weight = weight;
        this.comments = comments;
        
    }

    public String getReceiverName() {
        return this.receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverSurname() {
        return this.receiverSurname;
    }

    public void setReceiverSurname(String receiverSurname) {
        this.receiverSurname = receiverSurname;
    }

    public String getReceiverEmail() {
        return this.receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getReceiverPhone() {
        return this.receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getSenderName() {
        return this.senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderSurname() {
        return this.senderSurname;
    }

    public void setSenderSurname(String senderSurname) {
        this.senderSurname = senderSurname;
    }

    public String getSenderEmail() {
        return this.senderEmail;
    }

    public void setSenderEmail(String senderEmail) {
        this.senderEmail = senderEmail;
    }

    public String getSenderPhone() {
        return this.senderPhone;
    }

    public void setSenderPhone(String senderPhone) {
        this.senderPhone = senderPhone;
    }

    public Double getHeight() {
        return this.height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getLength() {
        return this.length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getWidth() {
        return this.width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    public Double getWeight() {
        return this.weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
    

    public Double calculatepPrice (Double price, int diafora, Double w, Double vol) {
        Double fprice = price;
        try {
            if (w > vol) {
                if (w>0 && w<=3) {
                    fprice = price/6;
                } else if (w>3 && w<=7) {
                    fprice=price/5;
                } else if (w>7 && w<=12) {
                    fprice=price/4;
                } else if (w>12 && w<=17) {
                    fprice=price/3;
                } else if (w>17 && w<=23) {
                    fprice=price/2;
                } else { //>23 && <=30
                    fprice=(2*price)/3;
                }
            } else { //vol>w
                if (w>0 && w<=8) {
                    fprice = price/6;
                } else if (w>8 && w<=17) {
                    fprice=price/5;
                } else if (w>17 && w<=27) {
                    fprice=price/4;
                } else if (w>27 && w<=38) {
                    fprice=price/3;
                } else if (w>38 && w<=50) {
                    fprice=price/2;
                } else { //>50 && <=63
                    fprice=(2*price)/3;
                }
            }
            fprice = fprice / (6-diafora);
        } catch(Exception e) {
            
        }
        return fprice;
    }


    @Override
	public String toString() {
        return "Parcel [id = " + getProductid() + ", receivername=" + receiverName + ", receiversurname=" + receiverSurname + ", receiveremail=" + receiverEmail + ", sendername=" + senderName + ", sendersurname=" + senderSurname + " , senderemail=" + senderEmail + " , senderphone=" + senderPhone + "]";
    }

}



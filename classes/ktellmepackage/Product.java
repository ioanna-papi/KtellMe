package ktellmepackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import ktellmepackage.DB;
import ktellmepackage.Ticket;

public abstract class Product {

    private int productid;
    private Double price;
    private int time;
    private String date;
    private int from;
    private int to;

    public Product (int productid, Double price, int time, String date, int from, int to) {
       
        this.productid = productid;
        this.price = price; 
        this.time = time;
        this.date = date;
        this.from = from;
        this.to = to;  
    }

    public int getProductid() {
        return this.productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
    }
    
    public int getTime() {
        return this.time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getDate() {
        return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getFrom() {
		return this.from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getTo() {
		return this.to;
	}

	public void setTo(int to) {
		this.to = to;
	}

    }


    
   //public abstract Double calculatetPrice(Double price, int diafora, Double discount);
   //public abstract Double calculatepPrice(Double price, int diafora, Double weight, Double vol);

   
    

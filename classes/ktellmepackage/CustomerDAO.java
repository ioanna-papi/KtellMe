package ktellmepackage;

import java.sql.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Date;  java.time.Instant;
import java.time.LocalDate;

//import com.mysql.jdbc.ResultSet;

/**
 * CustomerDAO provides all the necessary methods related to registeredCustomers
 */

public class CustomerDAO {

    public int sizeofcust() throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sqlquery = "SELECT * FROM registered_customer ;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sqlquery);
            rs = stmt.executeQuery();

            int count = 0;
            while (rs.next()) {
                count++;
            }

            rs.close();
            stmt.close();
            db.close();
            return count;
        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public int maxofcust() throws Exception { // tha thn kalw san thn sizeofcust kai tha vazw ++maxofcust sto id. thn
                                              // idia methodo tha kanw kai sthn productdao(maxofprod).

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sqlquery = "SELECT cId FROM registered_customer;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sqlquery);
            rs = stmt.executeQuery();

            int max = 0;
            while (rs.next()) {
                if (rs.getInt("cId") > max) {
                    max = rs.getInt("cId");
                }
            }

            rs.close();
            stmt.close();
            db.close();
            return max;

        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public List<Customer> getCustomers() throws Exception {

        List<Customer> customers = new ArrayList<Customer>();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sqlquery = "SELECT * FROM registered_customer ;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sqlquery);
            rs = stmt.executeQuery();

            while (rs.next()) {

                Date birth = rs.getDate("birthdate");
                String birthdate = birth.toString();
                String phonenumber = null;
                Customer cst = new Customer(rs.getInt("cId"), rs.getString("username"), rs.getString("passwd"),
                        rs.getString("firstname"), rs.getString("surname"), birthdate, phonenumber);
                customers.add(cst);

            }

            rs.close();
            stmt.close();
            db.close();
            return customers;

        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }

    public Customer authenticate(String username, String password) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sqlquery = "SELECT * FROM registered_customer WHERE username=? AND passwd=? ;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sqlquery);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            Customer cust = null;

            if (!rs.next()) {
                throw new Exception("Wrong email or password");

            } else {

                Date birthdate = rs.getDate("birthdate");
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                String birthday = df.format(birthdate);
                String phonenumber = null;
                Customer cust2 = new Customer(rs.getInt("cId"), rs.getString("firstname"), rs.getString("surname"),
                        rs.getString("username"), rs.getString("passwd"), birthday, phonenumber);
                cust = cust2;
            }

            rs.close();
            stmt.close();
            db.close();

            return cust;

        } catch (SQLException e) {
            throw new SQLException(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }

        }
    }

    public void register(Customer customer) throws Exception {
        /* thema 1d */
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;
        String sqlquery = "SELECT * FROM registered_customer WHERE username=? ;";

        try {

            con = db.getConnection();
            stmt2 = con.prepareStatement(sqlquery);
            stmt2.setString(1, customer.getUsername());
            rs = stmt2.executeQuery();

            if (rs.next()) {
                throw new Exception("Email already registered");

            } else {

                String sqlquery2 = "INSERT INTO registered_customer (cId,firstname,surname,username,passwd,birthdate) VALUES (?,?,?,?,?,?) ;";
                stmt2 = con.prepareStatement(sqlquery2);
                stmt2.setInt(1, customer.getCustid());
                stmt2.setString(2, customer.getFirstname());
                stmt2.setString(3, customer.getSurname());
                stmt2.setString(4, customer.getUsername());
                stmt2.setString(5, customer.getPassword());
                String stringDate = customer.getBirth();
                Date sqlDate = java.sql.Date.valueOf(stringDate);
                stmt2.setDate(6, sqlDate);
                int rows = stmt2.executeUpdate();

            }

            rs.close();
            stmt2.close();
            db.close();

        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }

    }

}

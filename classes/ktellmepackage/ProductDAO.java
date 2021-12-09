package ktellmepackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Date;  
import java.time.LocalDate;

import ktellmepackage.DB;
import ktellmepackage.Parcel;
import ktellmepackage.Product;
import ktellmepackage.Ticket;

public class ProductDAO {

	public int sizeProducts() throws Exception {

        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM product ;";

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlquery);
			rs = stmt.executeQuery();
			
			int count = 0;
			if (rs.next()) {
				count = 1;
			}

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
	
	public int maxofprod() throws Exception { //tha thn kalw san thn sizeofcust kai tha vazw ++maxofcust sto id. thn idia methodo tha kanw kai sthn productdao(maxofprod).

        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sqlquery = "SELECT prodId FROM product;";
        
        try {
                con = db.getConnection();
                stmt = con.prepareStatement(sqlquery);
                rs = stmt.executeQuery();
                
                int max = 0;
                while (rs.next()) {
                    if (rs.getInt("prodId") > max) {
                        max = rs.getInt("prodId");
                    }
                }

                rs.close();
			    stmt.close();
                db.close();
                return max;

        }  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }
    }



	public int givetripid(int itinid) throws Exception {
		DB db = new DB();
        Connection con = null;
		PreparedStatement stmt = null;
		//PreparedStatement stmt2 = null;
        ResultSet rs = null;
		String sqlquerymid = "SELECT tripId FROM trip WHERE itineraryId=? ; ";

		try {

            con = db.getConnection();
			stmt = con.prepareStatement(sqlquerymid);
			stmt.setInt(1, itinid); //to id pou tha pairnw me kapoion tropo
			rs = stmt.executeQuery();
			int tripid=0;
			if (rs.next()) {
				tripid = rs.getInt("tripId");
			}

			rs.close();
            stmt.close();
            db.close();

			return tripid;

        } catch (SQLException e) {
            throw new SQLException(e.getMessage());
        } finally {
            try {
            	db.close();
            } catch (Exception e) {
            }
         }
	  

    }
	

    public void buy(Ticket ticket, Customer customer, int itinid) throws Exception { //method creates entries in ticket and product databases

        DB db = new DB();
        Connection con = null;
		PreparedStatement stmt = null;
		//PreparedStatement stmt2 = null;
        //ResultSet rs = null;
		//String sqlquerymid = "SELECT tripId FROM trip WHERE itineraryId=? ; ";
		String sqlquery2 = "INSERT INTO product (prodId,custId,itId,price,departure,destination,dep_time,dep_date) VALUES (?,?,?,?,?,?,?,?) ;";
		String sqlquery = "INSERT INTO ticket (tickId,firstname,surname,email,phone,discount) VALUES (?,?,?,?,?,?);";
		
		//int prodnumber = getProducts().size();
        
         
        try {

            con = db.getConnection();
			//stmt = con.prepareStatement(sqlquerymid);
			//stmt.setInt(1, itinid); //to id pou tha pairnw me kapoion tropo
			//rs = stmt.executeQuery();
			//int tripid=0;
			//if (rs.next()) {
				//tripid = rs.getInt("tripId");
			//}

			stmt = con.prepareStatement(sqlquery2);
			stmt.setInt(1, ticket.getProductid());
			stmt.setInt(2, customer.getCustid());
			stmt.setInt(3, itinid);
			stmt.setDouble(4, ticket.getPrice()); //prosoxh edw me th methodo calculate price
			stmt.setInt(5, ticket.getFrom());
			stmt.setInt(6, ticket.getTo());
			stmt.setInt(7, ticket.getTime());
			String stringdate = ticket.getDate();
			Date sqlDate = java.sql.Date.valueOf(stringdate); 
			stmt.setDate(8, sqlDate);
			int rows2 = stmt.executeUpdate();

			String firstname = ticket.getFirstname();
			firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");

			String surname = ticket.getSurname();
			surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
			stmt = con.prepareStatement(sqlquery);
			stmt.setInt(1, ticket.getProductid());
            stmt.setString(2, firstname);
            stmt.setString(3, surname);
            stmt.setString(4, ticket.getEmail());
            stmt.setString(5, ticket.getPhone());
            stmt.setDouble(6, ticket.getDiscount());
			int rows = stmt.executeUpdate();

            stmt.close();
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
	

	public void send(Parcel parcel, Customer customer, int itinid) throws Exception { //method creates entries in parcel and product databases

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		//ResultSet rs = null;
		String sqlquery = "INSERT INTO product (prodId,custId,itId,price,departure,destination,dep_time,dep_date) VALUES (?,?,?,?,?,?,?,?) ;" ;
		String sqlquery2 = "INSERT INTO parcel (parcId,receiverName,receiverSurname,receiverEmail,receiverPhone,senderName,senderSurname,senderEmail,senderPhone,height,length,width,weight,comments) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlquery);
			stmt.setInt(1, parcel.getProductid());
			stmt.setInt(2, customer.getCustid());
			stmt.setInt(3, itinid);
			stmt.setDouble(4, parcel.getPrice());
			stmt.setInt(5, parcel.getFrom());
			stmt.setInt(6, parcel.getTo());
			stmt.setInt(7, parcel.getTime());
			String stringdate = parcel.getDate();
			Date sqlDate = java.sql.Date.valueOf(stringdate); 
			stmt.setDate(8, sqlDate);
			int rows = stmt.executeUpdate();

			String receivername = parcel.getReceiverName();
			receivername = new String(receivername.getBytes("ISO-8859-1"), "UTF-8");
			String receiversurname = parcel.getReceiverSurname();
			receiversurname = new String(receiversurname.getBytes("ISO-8859-1"), "UTF-8");
			String sendername = parcel.getSenderName();
			sendername = new String(sendername.getBytes("ISO-8859-1"), "UTF-8");
			String sendersurname = parcel.getSenderSurname();
			sendersurname = new String(sendersurname.getBytes("ISO-8859-1"), "UTF-8");
			String com = parcel.getComments();
			com = new String(com.getBytes("ISO-8859-1"), "UTF-8");

			stmt = con.prepareStatement(sqlquery2);
			stmt.setInt(1, parcel.getProductid());
			stmt.setString(2, receivername);
			stmt.setString(3, receiversurname);
			stmt.setString(4, parcel.getReceiverEmail());
			stmt.setString(5, parcel.getReceiverPhone());
			stmt.setString(6, sendername);
			stmt.setString(7, sendersurname);
			stmt.setString(8, parcel.getSenderEmail());
			stmt.setString(9, parcel.getSenderPhone());
			stmt.setDouble(10, parcel.getHeight());
			stmt.setDouble(11, parcel.getLength());
			stmt.setDouble(12, parcel.getWidth());
			stmt.setDouble(13, parcel.getWeight());
			stmt.setString(14, com);
			int rows2 = stmt.executeUpdate();

			stmt.close();
            db.close();

		} catch(SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {
		   try {
			   db.close();
		   } catch (Exception e) {
		   }
		}
	}

	public void cancel(int id) throws Exception {

		DB db = new DB();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sqlquery = "SELECT * FROM ticket WHERE tickId=? ;";
		String sqlquery2 = "DELETE FROM ticket WHERE tickId=? ;";
		String sqlquery3 = "DELETE FROM parcel WHERE parcId=? ;";
		String sqlquery4 = "DELETE FROM product WHERE prodId=? ;";
		Boolean isTicket = false;

		try {

            con = db.getConnection();
			stmt = con.prepareStatement(sqlquery);
			stmt.setInt(1, id); 
			rs = stmt.executeQuery();

			if (rs.next()) { //so it's a ticket
				isTicket = true;
				stmt = con.prepareStatement(sqlquery2);
				stmt.setInt(1, id); 
				int rows = stmt.executeUpdate();

				stmt = con.prepareStatement(sqlquery4);
				stmt.setInt(1, id); 
				rows = stmt.executeUpdate();
			} else { //is a parcel
				stmt = con.prepareStatement(sqlquery3);
				stmt.setInt(1, id); 
				int rows2 = stmt.executeUpdate();

				stmt = con.prepareStatement(sqlquery4);
				stmt.setInt(1, id); 
				rows2 = stmt.executeUpdate();
			}

			rs.close();
            stmt.close();
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

	public Boolean findProdById(int id) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM product WHERE prodId=?;";
		int res=0;
        
        try {
                con = db.getConnection();
				stmt = con.prepareStatement(sqlquery);
				stmt.setInt(1,id);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
					res=1;
				}
            
                rs.close();
			    stmt.close();
				db.close();
				
				if (res==1) {
					return true;
				} else {
					return false;
				}

        }  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }


	}


	public Boolean findParcelById(int id) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM parcel WHERE parcId=?;";
		int res=0;
        
        try {
                con = db.getConnection();
				stmt = con.prepareStatement(sqlquery);
				stmt.setInt(1,id);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
					res=1;
				}
            
                rs.close();
			    stmt.close();
				db.close();
				
				if (res==1) {
					return true;
				} else {
					return false;
				}

        }  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }


	}












	public int getItinid(int parcid) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM product WHERE prodId=?;";
		int itinid=0;
        
        try {
                con = db.getConnection();
				stmt = con.prepareStatement(sqlquery);
				stmt.setInt(1,parcid);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
					itinid = rs.getInt("itid");    
                }

                rs.close();
			    stmt.close();
                db.close();
                return itinid;

        }  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }
	}
	
	
	public int[] getList(int parcid) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM product WHERE prodId=?;";
	
		try {
				con = db.getConnection();
				stmt = con.prepareStatement(sqlquery);
				stmt.setInt(1,parcid);
                rs = stmt.executeQuery();
                
                if (!rs.next()) {
					 throw new Exception("This product doesn't exist");
				}
				int[] things = {rs.getInt("departure"), rs.getInt("destination"), rs.getInt("dep_time")};
				
				rs.close();
			    stmt.close();
                db.close();
                return things;
}  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }
	}


	public Date getDate(int parcid) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM product WHERE prodId=?;";
	
		try {
				con = db.getConnection();
				stmt = con.prepareStatement(sqlquery);
				stmt.setInt(1,parcid);
                rs = stmt.executeQuery();
                
                if (!rs.next()) {
					 throw new Exception("This product doesn't exist");
				}
				Date d = rs.getDate("dep_date");
				
				rs.close();
			    stmt.close();
                db.close();
                return d;
}  catch (SQLException e) {
			throw new SQLException(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
        }
	}





}
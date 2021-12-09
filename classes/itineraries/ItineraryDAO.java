package itineraries;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ItineraryDAO {
	
	
	public List<Itinerary> getStations() throws Exception {
		List<Itinerary> stations = new ArrayList<Itinerary>();
		
		   DB db = new DB();
		   Connection con = null;
		   PreparedStatement stmt1 = null;
		   ResultSet rs = null;
		   String sqlQuery = "SELECT * FROM itinerary ;";
		   try {
			   con = db.getConnection();
			   stmt1 = con.prepareStatement(sqlQuery);
			   rs = stmt1.executeQuery();
			   
			   while(rs.next()) {
				   stations.add(new Itinerary(rs.getInt("itId"),rs.getString("itName"), rs.getDouble("price"),rs.getString("beginning"), 
				   rs.getString("station1"),rs.getString("station2"),rs.getString("station3"),rs.getString("station4"),
				   rs.getString("time1"), rs.getString("time2"), rs.getString("time3"), rs.getString("time4"),rs.getString("ending")));
			   }
			   rs.close();
			   stmt1.close();
		   db.close();
		   
		   return stations;
		   
		   } catch(SQLException e) {
			   throw new SQLException(e.getMessage());
		   } finally {
			   try {
			     db.close();
			   } catch (Exception e) {
			   }
		   }
		
		
	}
	
	public Itinerary printStations(String name) throws Exception{
		
		   DB db = new DB();
		   Connection con = null;
		   PreparedStatement stmt2 = null;
		   ResultSet rs = null;
		   String sqlQuery = "SELECT * FROM itinerary WHERE itname=? ;";
	
		   try {
			   
			con = db.getConnection();
			stmt2 = con.prepareStatement(sqlQuery);
			stmt2.setString(1,name);
			rs = stmt2.executeQuery();
			if(!rs.next()) {
				throw new Exception("This itinerary doesn't exist");
			}
			Itinerary st = new Itinerary(rs.getInt("itId"),rs.getString("itName"), rs.getDouble("price"),rs.getString("beginning"), 
				   rs.getString("station1"),rs.getString("station2"),rs.getString("station3"),rs.getString("station4"),
				   rs.getString("time1"), rs.getString("time2"), rs.getString("time3"), rs.getString("time4"),rs.getString("ending"));
	
			rs.close();
			stmt2.close();
			db.close();
			return st;
			
			} catch(SQLException e) {
			   throw new SQLException(e.getMessage());
		   } finally {
			   try {
			     db.close();
			   } catch (Exception e) {
			   }
		   }
	
	
	}
	
	
	public double findPriceById(int id) throws Exception{
		
		   DB db = new DB();
		   Connection con = null;
		   PreparedStatement stmt3 = null;
		   ResultSet rs = null;
		   String sqlQuery = "SELECT * FROM itinerary WHERE itId=? ;";
	
		   try {
			   
			con = db.getConnection();
			stmt3 = con.prepareStatement(sqlQuery);
			stmt3.setInt(1,id);
			rs = stmt3.executeQuery();
			if(!rs.next()) {
				throw new Exception("This itinerary doesn't exist");
			}
			double pr = rs.getDouble("price");
	
			rs.close();
			stmt3.close();
			db.close();
			return pr;
			
			} catch(SQLException e) {
			   throw new SQLException(e.getMessage());
		   } finally {
			   try {
			     db.close();
			   } catch (Exception e) {
			   }
		   }
		   
	}
		   
		   
		   public Itinerary findById(int id) throws Exception{
		
		   DB db = new DB();
		   Connection con = null;
		   PreparedStatement stmt3 = null;
		   ResultSet rs = null;
		   String sqlQuery = "SELECT * FROM itinerary WHERE itId=? ;";
	
		   try {
			   
			con = db.getConnection();
			stmt3 = con.prepareStatement(sqlQuery);
			stmt3.setInt(1,id);
			rs = stmt3.executeQuery();
			if(!rs.next()) {
				throw new Exception("This itinerary doesn't exist");
			}
			Itinerary st = new Itinerary(rs.getInt("itId"),rs.getString("itName"), rs.getDouble("price"),rs.getString("beginning"), 
				   rs.getString("station1"),rs.getString("station2"),rs.getString("station3"),rs.getString("station4"),
				   rs.getString("time1"), rs.getString("time2"), rs.getString("time3"), rs.getString("time4"),rs.getString("ending"));
	
			rs.close();
			stmt3.close();
			db.close();
			return st;
			
			} catch(SQLException e) {
			   throw new SQLException(e.getMessage());
		   } finally {
			   try {
			     db.close();
			   } catch (Exception e) {
			   }
		   }
		   }
	
	
	
		
	
	
}
	
	
	
	
	
	
	
	

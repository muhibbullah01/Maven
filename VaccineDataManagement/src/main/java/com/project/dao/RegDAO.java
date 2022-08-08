package com.project.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.project.conn.Connectivity;
import com.project.entity.Bean;

public class RegDAO {

	private Connection con;

	public RegDAO(Connection con) {
		super();
		this.con = con;
	}

	public RegDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
public String insertData(Bean et) {
		
		Connection con = null;
		String result = null;
		
		try {
			
			con = Connectivity.create();
			String insertQuery = "insert into users values(?,?,?,?,?,?,?);";
			PreparedStatement pst = con.prepareStatement(insertQuery);
			pst.setInt(1, et.getNid());
			pst.setString(2, et.getName());
			pst.setString(3, et.getGender());
			pst.setString(4, et.getDob());
			pst.setInt(5, et.getContact());
			pst.setString(6, et.getAddress());
			pst.setString(7, et.getCenter());
			int i = pst.executeUpdate();
			if(i > 0) {result = et.getName();}
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
			if(con != null) {con.close();}
			}catch(SQLException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
	
	public List<Bean> showingFullList(){
		
		List<Bean> list = new ArrayList<Bean>();
		Bean et = null;
		try {
			
			Connection con = Connectivity.create();
			String fullList = "select * from users;";
			PreparedStatement pst = con.prepareStatement(fullList);
			ResultSet rs = pst.executeQuery(fullList);
			while(rs.next()) {
				
				et = new Bean();
				et.setNid(rs.getInt(1));
				et.setName(rs.getString(2));;
				et.setGender(rs.getString(3));;
				et.setDob(rs.getString(4));;
				et.setContact(rs.getInt(5));;
				et.setAddress(rs.getString(6));;
				et.setCenter(rs.getString(7));;
				list.add(et);
				
			}
			
		}catch(Exception e) {e.printStackTrace();}
		
		
		return list;
	}
	
	public Bean selectID(int nid) {
		
		Bean et = null;
		try {
			
			Connection con = Connectivity.create();
			String selct = "select * from users where NID = "+nid;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selct);
			
			while(rs.next()) {
				
				int nId = rs.getInt(1);
				String name = rs.getString(2);
				String gender = rs.getString(3);
				String dob = rs.getString(4);
				int mobile = rs.getInt(5);
				String address = rs.getString(6);
				String center = rs.getString(7);
				et = new Bean(nId,name,gender,dob,mobile,address,center);
				
			}
			
			
		}catch(Exception e) {e.printStackTrace();}
		
		return et;
	}
	
	public boolean editUser(Bean et) {
		
		boolean rowUpdated = false;
		try {
			
			Connection con = Connectivity.create();
			String editQuery = "update users set Name = ?, Gender = ?, Date_Of_Birth =?, Mobile_Number = ?, Address = ?, Center = ? where NID = ?;";
			PreparedStatement pst = con.prepareStatement(editQuery);
			
			pst.setString(1, et.getName());
			pst.setString(2, et.getGender());
			pst.setString(3, et.getDob());
			pst.setInt(4, et.getContact());
			pst.setString(5, et.getAddress());
			pst.setString(6, et.getCenter());
			pst.setInt(7, et.getNid());
			
			int i = pst.executeUpdate();
			if(i==1) {
				rowUpdated = true;
			}
			
			
		}catch(Exception e) {e.printStackTrace();}
		
		return rowUpdated;
	}
	
	public boolean deleteUser(int nid) {
		boolean f = false;
		
		try {
			
			String dlt = "delete from users where NID=?";
			PreparedStatement pst = con.prepareStatement(dlt);
			pst.setInt(1, nid);
			int i = pst.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}

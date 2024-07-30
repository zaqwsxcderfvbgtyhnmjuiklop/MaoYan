package com.maoyan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MaoyanDao {
	static Connection con;
	static String sql;
	static PreparedStatement pr;
	static ResultSet rs;
	
	public static List<Maoyan> getMaoyanList() throws Exception {
		List<Maoyan> list=new ArrayList<Maoyan>();
		con=JDBC.getConnection();
		sql="select * from movies_top100 limit 10";
		pr=con.prepareStatement(sql);
		
		rs=pr.executeQuery();
		while (rs.next()) {
			Maoyan st=new Maoyan();
			st.setId(rs.getInt(1));
			st.setMovieName(rs.getString(2));
			st.setMovieActress(rs.getString(3));
			st.setMovieTime(rs.getString(4));
			st.setMovieScore(rs.getString(5));
			st.setMovieImgSrc(rs.getString(6));
			list.add(st);
		}
		return list;
	}
	
	public static List<Maoyan> getPageMaoyanList(int pageNo, int pagesize) throws Exception {
		int Count = pageNo*pagesize;
		if (Count>100) {
			Count=100;
		}else if (Count<100) {
			Count=0;
		}
		List<Maoyan> list=new ArrayList<Maoyan>();
		con=JDBC.getConnection();
		sql="select * from movies_top100 limit ?";
		pr=con.prepareStatement(sql);
		pr.setInt(1, Count);
		rs=pr.executeQuery();
		while (rs.next()) {
			Maoyan st=new Maoyan();
			st.setId(rs.getInt(1));
			st.setMovieName(rs.getString(2));
			st.setMovieActress(rs.getString(3));
			st.setMovieTime(rs.getString(4));
			st.setMovieScore(rs.getString(5));
			st.setMovieImgSrc(rs.getString(6));
			list.add(st);
		}
		return list;
	}
	
	public int getTotalCount(int pageNo, int pagesize) throws Exception {
		return getPageMaoyanList(pageNo, pagesize).size();
	}
	
	public static List<Maoyan> getMaoyanByAny(String movieTitle) throws Exception {
		List<Maoyan> list=new ArrayList<Maoyan>();
		con=JDBC.getConnection();
		sql="select * from movies_top100 where movieName like '%"+movieTitle+"%' or "
				+ "movieActress like '%"+movieTitle+"%' or "
				+ "movieTime like '%"+movieTitle+"%' or "
				+ "movieScore like '%"+movieTitle+"%'";

		pr=con.prepareStatement(sql);

		rs=pr.executeQuery();
		while (rs.next()) {
			Maoyan st=new Maoyan();
			st.setId(rs.getInt(1));
			st.setMovieName(rs.getString(2));
			st.setMovieActress(rs.getString(3));
			st.setMovieTime(rs.getString(4));
			st.setMovieScore(rs.getString(5));
			st.setMovieImgSrc(rs.getString(6));
			list.add(st);
		}
		return list;
	}
}

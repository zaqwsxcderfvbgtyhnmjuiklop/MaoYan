package com.maoyan;

public class Maoyan {
	private int id;
	private String movieName;
	private String movieActress;
	private String movieTime;
	private String movieScore;
	private String movieImgSrc;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieActress() {
		return movieActress;
	}
	public void setMovieActress(String movieActress) {
		this.movieActress = movieActress;
	}
	public String getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}
	public String getMovieScore() {
		return movieScore;
	}
	public void setMovieScore(String movieScore) {
		this.movieScore = movieScore;
	}
	public String getMovieImgSrc() {
		return movieImgSrc;
	}
	public void setMovieImgSrc(String movieImgSrc) {
		this.movieImgSrc = movieImgSrc;
	}
	public Maoyan(String movieName, String movieActress, String movieTime, String movieScore, String movieImgSrc) {
		super();
		this.movieName = movieName;
		this.movieActress = movieActress;
		this.movieTime = movieTime;
		this.movieScore = movieScore;
		this.movieImgSrc = movieImgSrc;
	}
	public Maoyan() {
		super();
	}
	
}

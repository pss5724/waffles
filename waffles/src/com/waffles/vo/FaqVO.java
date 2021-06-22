package com.waffles.vo;

public class FaqVO {
	int rno, fhit;
	String fid, name, ftitle, fcontent, ffile, fsfile, fdate, pass;
	int boardgroup, boardsequence, boardlevel;
	
	public int getRno() {
		return rno;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getBoardgroup() {
		return boardgroup;
	}
	public void setBoardgroup(int boardgroup) {
		this.boardgroup = boardgroup;
	}
	public int getBoardsequence() {
		return boardsequence;
	}
	public void setBoardsequence(int boardsequence) {
		this.boardsequence = boardsequence;
	}
	public int getBoardlevel() {
		return boardlevel;
	}
	public void setBoardlevel(int boardlevel) {
		this.boardlevel = boardlevel;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getFhit() {
		return fhit;
	}
	public void setFhit(int fhit) {
		this.fhit = fhit;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFfile() {
		return ffile;
	}
	public void setFfile(String ffile) {
		this.ffile = ffile;
	}
	public String getFsfile() {
		return fsfile;
	}
	public void setFsfile(String fsfile) {
		this.fsfile = fsfile;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	
	
}

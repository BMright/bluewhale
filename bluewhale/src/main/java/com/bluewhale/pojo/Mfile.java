package com.bluewhale.pojo;

public class Mfile {
	private int id;
	private String filename;
	private String filesuffix;
	private String filepath;
	private long filesize;
	private String filedate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesuffix() {
		return filesuffix;
	}
	public void setFilesuffix(String filesuffix) {
		this.filesuffix = filesuffix;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long l) {
		this.filesize = l;
	}
	public String getFiledate() {
		return filedate;
	}
	public void setFiledate(String filedate) {
		this.filedate = filedate;
	}
	@Override
	public String toString() {
		return "Mfile [id=" + id + ", filename=" + filename + ", filesuffix=" + filesuffix + ", filepath=" + filepath
				+ ", filesize=" + filesize + ", filedata=" + filedate + "]";
	}
}

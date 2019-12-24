package com.bluewhale.mapper;

import java.util.List;

import com.bluewhale.pojo.Mfile;
import com.bluewhale.pojo.QueryVo;

public interface FileDao {
	// 获取全部的文件信息
	public List<Mfile> getFileList(QueryVo<Mfile> qv);
	
	// 添加文件信息
	public void addFileInfo(Mfile mfile);
	
	// 通过文件id获取文件信息
	public Mfile getFileById(Integer id);
	
	// 获取文件总数
	public int getFileSum();
}

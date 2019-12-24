package com.bluewhale.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.FileDao;
import com.bluewhale.pojo.Mfile;
import com.bluewhale.pojo.QueryVo;

@Service
public class FileListService {
	
	@Autowired
	private FileDao fileDao;
	
	// 获取所有文件信息
	public List<Mfile> getFileList(QueryVo<Mfile> qv){
		qv.setTotal(getFileSum());
		qv.setTotalPage();
		qv.setBeginIndex();
		return fileDao.getFileList(qv);
	}
	
	// 通过id获取文件信息
	public Mfile getFileById(Integer id) {
		return fileDao.getFileById(id);
	}
	
	// 添加文件信息
	public void addFileInfo(Mfile mfile) {
		SimpleDateFormat simpleDateFormat;
		simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String time = simpleDateFormat.format(date);
		mfile.setFiledate(time);
		fileDao.addFileInfo(mfile);
	}
	
	// 获取文件总数
	public int getFileSum() {
		
		return 0;
	}
}

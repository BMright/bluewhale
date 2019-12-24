package com.bluewhale.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bluewhale.pojo.Mfile;
import com.bluewhale.pojo.QueryVo;
import com.bluewhale.service.FileListService;

@Controller
public class FileListController extends BaseController{
	
	@Autowired
	private FileListService fileListService;
	
	// 跳转到文件列表页面
	@RequestMapping(value = "/fileList")
	public String toFileList() {
		return "file/fileList";
	}
	
	// 跳转到上传页面
	@RequestMapping(value = "/toUpload")
	public String toUpload() {
		return "file/upLoadFile";
	}
	
	// 实现下载功能
	@RequestMapping(value="/download")
    public void download(Integer id) throws IOException {
		Mfile mfile = fileListService.getFileById(id);
    	String path = mfile.getFilepath()+mfile.getFilename();
        // 获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
        System.out.println(bis);
        // 转码，免得文件名中文乱码  
        String filename = mfile.getFilename();
        filename = URLEncoder.encode(filename,"UTF-8");
        // 设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
        // 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        
        byte dataBuffer[] = new byte[8192];
        int bytesRead;
        while ((bytesRead = bis.read(dataBuffer, 0, 8192)) != -1) {
        	out.write(dataBuffer, 0, bytesRead);
        	out.flush();
        }
        
        /*int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  */
        System.out.println("filepath:" + path);
        System.out.println("filename:" + filename);
        out.close();  
    }
	
	// 实现上传功能
	@RequestMapping(value = "/upLoadFile")
	@ResponseBody
	public Map<String, Object> upLoadFile(MultipartFile file){
		Map<String, Object> map = new HashMap<>();
		try {
			if(null!=file){
		        String fileOrigName=file.getOriginalFilename();// 文件原名称
		        if (!fileOrigName.contains(".")) {
		            throw new IllegalArgumentException("缺少后缀名");
		        }
		        //获取后缀名
		        String fileEndName = fileOrigName.substring(fileOrigName.lastIndexOf("."));
		        System.out.println("后缀名:"+fileEndName);
		        //String randFileName = UUID.randomUUID().toString();
		        //String newfileName =randFileName +fileEndName;
		        String savePath = "C:\\uploadFile\\";
		        Mfile mfile = new Mfile();
		        mfile.setFilename(fileOrigName);
		        mfile.setFilesuffix(fileEndName);
		        mfile.setFilepath(savePath);
		        mfile.setFilesize(file.getSize());
		        fileListService.addFileInfo(mfile);
		        int id = mfile.getId();
		        map.put("fileId", id);
		        System.out.println("上传文件id:" + id);
		        String newdestPath= savePath+fileOrigName;
		        //判断上传文件的目录是否存在
		        File newfile=new File(newdestPath);
		        if(!newfile.exists() && !newfile.isDirectory()){
		            System.out.println(newfile+"目录不存在，需要创建");
		            //创建目录
		            newfile.mkdirs();
		        }
		        file.transferTo(newfile);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "0");
		    map.put("msg","该文件名已存在，请删除已存在文件或修改此文件名称");
		    return map;
		}
	    map.put("code", "1");
	    map.put("msg","上传成功");
		return map;
	}
	
	// 获取到文件列表
	@RequestMapping(value = "/getFileList")
	@ResponseBody
	public Map<String, Object> getUserList(QueryVo<Mfile> qv){
		Map<String, Object> map = new HashMap<>();
		map.put("code", "");
		map.put("msg", "");
		map.put("count", "");
		map.put("data", "");	
		qv.setCurrentPage(1);
		qv.setPageSize(5);
		List<Mfile> userList = fileListService.getFileList(qv);
		if (userList.size() != 0) {
			map.put("count", userList.size());
			map.put("data", userList);
		}
		return map;
	}

}

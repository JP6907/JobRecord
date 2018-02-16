package com.jp.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jp.po.Company;
import com.jp.service.CompanyService;

@Controller
@RequestMapping("/company")
public class companyController {

	@Autowired
	@Qualifier("companyService")
	private CompanyService companyService;
	
	
	@RequestMapping("/getCompanyList")
	public String getCompanyList(Model model,HttpServletRequest request) throws Exception{
		System.out.println("************获取列表");
		List<Company> companyList = companyService.getCompanyList();
		
		model.addAttribute("companyList", companyList);
		
		return "company_list";
	}
	
	@RequestMapping("/modifyCompany")
	public String modifyCompany(Model model,@Param("id")int id) throws Exception{
		System.out.println("************修改信息");
		Company company = companyService.getCompanyById(id);
		model.addAttribute("company", company);
		return "company_modify";
	} 
	
	@RequestMapping("/modifyCompanySubmit")
	public String modifyCompanySubmit(Model model,Company company,
			HttpServletRequest request) throws Exception{
		System.out.println("************提交修改信息");
		System.out.println(company);
		companyService.modifyCompanyById(company);
		
		//生成excel文件
		String path = request.getServletContext().getRealPath("/excel");
		companyService.createCompanyExcel(path);
		
		return "forward:getCompanyList";
	}
	
	@RequestMapping("/addCompany")
	public String addCompany(Model model){
		System.out.println("*************添加信息");
		
		return "company_add";
	}
	
	@RequestMapping("/addCompanySubmit")
	public String addCompanySubmit(Model model,Company company,
			HttpServletRequest request) throws Exception{
		System.out.println("*************添加信息提交");
		
		companyService.addCompany(company);
		
		//生成excel文件
		String path = request.getServletContext().getRealPath("/excel");
		companyService.createCompanyExcel(path);
		return "forward:getCompanyList";
	}
	
	@RequestMapping("/deleteCompany")
	public String deleteCompany(@Param("id")int id, Model mode,
			HttpServletRequest request) throws Exception{
		
		System.out.println("************删除信息");
		companyService.deleteCompanyById(id);
		
		//生成excel文件
		String path = request.getServletContext().getRealPath("/excel");
		companyService.createCompanyExcel(path);
		return "forward:getCompanyList";
	}
	
	@RequestMapping("/downloadCompanyExcel")
	public ResponseEntity<byte[]> downloadCompanyExcel(HttpServletRequest request,
			Model model) throws Exception{
		String path = request.getServletContext().getRealPath("/excel/");
		String filename = "company.xls";
		System.out.println(path);
		File file = new File(path+File.separator + filename);
		if(!file.exists()){
			companyService.createCompanyExcel(request.getServletContext().getRealPath("/excel"));
		}
		HttpHeaders headers = new HttpHeaders();
		//下载显示中文名，解决中文乱码问题
		String downloadname = new String(filename.getBytes("UTF-8"),"iso-8859-1");
		//通知浏览器以attachment下载方式打开图片
		headers.setContentDispositionFormData("attachment", downloadname);
		//application/cotet-stream:二进制流数据，最常见的文件下载方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		//201 HttpStatus.CREATED
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}
	
	
}

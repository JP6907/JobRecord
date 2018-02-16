package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.CompanyMapper;
import com.jp.mapper.CompanyMapperCustom;
import com.jp.po.Company;
import com.jp.service.CompanyService;
import com.jp.util.DBtoExcel;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyMapperCustom companyMapperCustom;
	
	@Autowired CompanyMapper companyMapper;
	
	@Override
	public List<Company> getCompanyList() throws Exception {
		// TODO Auto-generated method stub
		return companyMapperCustom.getCompanyList();
	}

	@Override
	public void addCompany(Company company) throws Exception {
		
		//companyMapper.insertSelective(company);
		companyMapper.insert(company);
		
	}

	@Override
	public void modifyCompanyById(Company company) throws Exception {
		
		if(company.getId()!=null){
			companyMapper.updateByPrimaryKeySelective(company);
		}
		
	}

	@Override
	public void deleteCompanyById(int id) throws Exception {
		
		companyMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public Company getCompanyById(int id) throws Exception {
		// TODO Auto-generated method stub
		return companyMapperCustom.getCompanyById(id);
	}

	@Override
	public void createCompanyExcel(String path) throws Exception {
		// TODO Auto-generated method stub
		DBtoExcel.createCompanyExcel(path);
	}

	
}

package com.jp.service;

import java.util.List;

import com.jp.po.Company;

public interface CompanyService {
	
	public List<Company> getCompanyList() throws Exception;
	
	public void addCompany(Company company) throws Exception;
	
	public void modifyCompanyById(Company company) throws Exception;
	
	public void deleteCompanyById(int id) throws Exception;
	
	public Company getCompanyById(int id) throws Exception;
	
	public void createCompanyExcel(String path) throws Exception;
}

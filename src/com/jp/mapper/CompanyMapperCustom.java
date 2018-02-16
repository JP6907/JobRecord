package com.jp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.Company;

public interface CompanyMapperCustom {
    
	public List<Company> getCompanyList() throws Exception;
	
	public Company getCompanyById(@Param("id")int id) throws Exception;
	
	public void updateCompanyByIdSelective(Company company) throws Exception;
}
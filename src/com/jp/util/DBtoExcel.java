package com.jp.util;
import java.io.File;   
import jxl.*;   
import jxl.write.*;  
import jxl.write.biff.RowsExceededException;  
import java.sql.*;  
import java.util.*;

public class DBtoExcel {
	/** 
     * 导出Excel表 
     * @param rs 数据库结果集 
     * @param filePath 要保存的路径，文件名为 fileName.xls 
     * @param sheetName 工作簿名称 工作簿名称，本方法目前只支持导出一个Excel工作簿 
     * @param columnName 列名，类型为Vector 
     */  
    public void WriteExcel(ResultSet rs, String filePath, String sheetName, Vector columnName) {  
        WritableWorkbook workbook = null;  
        WritableSheet sheet = null;  
          
          
        int rowNum = 1; // 从第一行开始写入  
        try {  
        	File file = new File(filePath);
        	if(file.exists()){
        		file.delete();
        		file = new File(filePath);
        	}
            workbook = Workbook.createWorkbook(file); // 创建Excel文件  
            sheet = workbook.createSheet(sheetName, 0); // 创建名为 sheetName 的工作簿    
              
            this.writeCol(sheet, columnName, 0); // 首先将列名写入  
            // 将结果集写入  
            while(rs.next()) {  
                Vector col = new Vector(); // 用以保存一行数据  
                  
                for(int i = 1; i <= columnName.size(); i++) { // 将一行内容保存在col中  
                    col.add(rs.getString(i));  
                }  
                // 写入Excel  
                this.writeCol(sheet, col, rowNum++);  
            }  
              
        }catch(Exception e) {  
            e.printStackTrace();  
        }  
        finally {  
            try {  
                // 关闭  
                workbook.write();  
                workbook.close();  
                rs.close();  
                System.out.println("生成excel文件:" + filePath);
            }catch(Exception e) {  
                e.printStackTrace();  
            }  
        }  
    }  
    /*** 
     * 将数组写入工作簿  
     * @param sheet 要写入的工作簿 
     * @param col 要写入的数据数组 
     * @param rowNum 要写入哪一行 
     * @throws WriteException  
     * @throws RowsExceededException  
     */  
    private void writeCol(WritableSheet sheet, Vector col, int rowNum) throws RowsExceededException, WriteException {  
        int size = col.size(); // 获取集合大小  
          
        for(int i = 0; i < size; i++) { // 写入每一列  
            Label label = new Label(i, rowNum, (String) col.get(i));   
            sheet.addCell(label);  
        }  
    }  
    
    public static void createCompanyExcel(String path) throws ClassNotFoundException, SQLException{
    	 	String DRIVER = "com.mysql.jdbc.Driver";  
	        String URL = "jdbc:mysql://localhost:3306/jobrecord";  
	        String USERNAME = "root";  
	        String USERPASSWORD = "123456";  
	          
	        String sql = "Select * from company"; // 查询语句  
	        Vector columnName = new Vector(); // 列名   
	        columnName.add("编号");  
	        columnName.add("名字");  
	        columnName.add("网址");
	        columnName.add("职位");
	        columnName.add("开始时间");
	        columnName.add("结束时间");
	        columnName.add("状态");
	        columnName.add("岗位要求");
	        columnName.add("备注");
	        
	        // 连接数据库  
	        Class.forName(DRIVER);  
	        Connection conn = (Connection) DriverManager.getConnection(URL,USERNAME,USERPASSWORD);  
	        PreparedStatement ps = conn.prepareStatement(sql);  
	        ResultSet rs = ps.executeQuery();  
	        File file = new File("excel");
	        if(!file.exists()){
	        	file.mkdirs();
	        }
	        // 导出文件  
	        new DBtoExcel().WriteExcel(rs, path + "/company.xls", "公司", columnName);    
    }
}  


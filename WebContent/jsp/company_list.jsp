<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>春招记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/style.css" type="text/css">
</head>


<body>

<div id="container">   

	<form action="#">
	<table class="zebra">
    <caption>Campus Recruitment In Spring.</caption>
		<thead>
        	<tr>
        		<th>&nbsp;</th>
				<th>公司名称</th>
				<th>网申地址</th>
				<th>应聘职位</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>状态</th>
				<th>&nbsp;</th>
            </tr>
		</thead>
        <tbody>
        	<tr>
        		<td>&nbsp;</td>
        		<td>
        			<a href="${pageContext.request.contextPath}/company/addCompany" style="color:#FFFFFF">
        				<span>添加...</span>
        			</a>
        		</td>
        		<td>
        			<span>...</span>
        		</td>
        		<td>
        			<span>...</span>
        		</td>
        		<td>
        			<span>...</span>
        		</td>
        		<td>
        			<span>...</span>
        		</td>
        		<td>
        			<span>...</span>
        		</td>
        		<td>
        			<a href="${pageContext.request.contextPath}/company/downloadCompanyExcel" style="color:#FFFFFF">
        				<span>下载</span>
        			</a>
        		</td>
        	</tr>
        	<c:forEach items="${companyList }" var="company" varStatus="index">
        	<tr>
        		<td id="id">${index.index+1 }</td>
            	<td id="name" width="300">${company.name }</td>
                <td id="website">
                	<a href="${company.website }"  style="color:#FFFFFF">
                	<c:choose>	
			    		<c:when test="${fn:length(company.website) >= 15}">     		
			        		<span title="${company.website}">${fn:substring(company.website,0,18)}……</span>
			     		</c:when>
				     	<c:otherwise>
				         	<span title="${company.website}">${company.website}</span>
				     	</c:otherwise>
		 			</c:choose>
                	</a>
                </td>
                <td id="post" width="150">${company.post }</td>
                <td id="starttime" width="300">${company.starttime }</td>
                <td id="endtime" width="300">${company.endtime }</td>
                <td id="status" width="80">${company.status }</td>
                <td width="50">
                	<a href="${pageContext.request.contextPath}/company/modifyCompany?id=${company.id }" style="color:#FFFFFF">
                		<span >修改</span>
                	</a>
                	<a href="${pageContext.request.contextPath}/company/deleteCompany?id=${company.id }" style="color:#FFFFFF">
                		<span >删除</span>
                	</a>
                </td>
            </tr>
            <tr>
            	<td >岗位要求:</td>
                <td id="requirement" colspan="4">${company.requirement}</td>
                <td >备注:</td>
                <td id="remark" colspan="2">${company.remark}</td>
            </tr>
            </c:forEach>
        </tbody>
	</table>
	</form>
</div>
    
</body>
</html>
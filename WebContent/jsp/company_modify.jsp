<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
		<title>春招记录</title>
		<link href="<%=basePath %>/jsp/css/all.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/style.css" type="text/css"/>
		<script src="<%=basePath%>/jsp/js/jquery-1.8.0.min.js"></script>
		<script src="<%=basePath%>/jsp/js/list.js"></script>
	</head>
	<body >
		<form action="${pageContext.request.contextPath}/company/modifyCompanySubmit?id=${company.id}" id="fixCompanyForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="#" style="color:#6E6E6E;">春招</a> &gt; 修改<a href="#" style="float:right;">退出</a></div>
				<div class="rightCont">
					<p class="g_title fix">修改信息&nbsp;&nbsp;&nbsp;&nbsp;
					<table class="tab1">
						<tbody>
							<tr>
								<td align="right" style="color:#000000">公司名称：</td>
								<td>
									<textarea name="name" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.name }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">网申地址：</td>
								<td>
									<textarea name="website" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.website }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">申请职位：</td>
								<td>
									<textarea name="post" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.post }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">网申开始时间：</td>
								<td>
									<textarea name="starttime" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.starttime }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">网申结束时间：</td>
								<td>
									<textarea name="endtime" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.endtime }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">申请状态：</td>
								<td>
									<textarea name="status" cols = "50" rows = "1" style="resize:none;font-size:15px" >${company.status }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">岗位要求：</td>
								<td>
									<textarea name="requirement" cols = "50" rows = "5" style="resize:none;font-size:15px" >${company.requirement }</textarea>
								</td>
	       					</tr>
	       					<tr>
								<td align="right" style="color:#000000">备注：</td>
								<td>
									<textarea name="remark" cols = "50" rows = "5" style="resize:none;font-size:15px" >${company.remark }</textarea>
								</td>
	       					</tr>
	       					<tr>
	       						<td align="right">
	       							&nbsp;
	       						</td>
	       						<td >
	       							<button type="submit" >提交</button>
	       						</td>
	       					</tr>
						</tbody>
					</table>
						
				</div>
			</div>
	    </form>
	</body>
</html>
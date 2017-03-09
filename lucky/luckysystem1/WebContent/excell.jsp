<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="application/msexcel; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!-- 
    以上这行设定本网页为excel格式的网页 -->
<%
   response.setHeader("Content-disposition","attachment; filename=stu.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="application/msexcel;charset=utf-8"><!-- 防止中文乱码 -->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
     <table border="1" width="100%">
    <tr>
     <td>等级</td><td>赞助公司/个人</td><td>产品名称</td><td>单价/元</td><td>数量</td><td>总值/元</td>
    </tr>
    <c:forEach items="${prizes}" var="s">
    <tr>
      <td><c:out value="${s.grade}"/></td> <td><c:out value="${s.sponsor}"/></td> <td><c:out value="${s.productname}"/></td> 
      <td><c:out value="${s.unitprice}"/></td> <td><c:out value="${s.count}"/></td> <td><c:out value="${s.totalvalue}"/></td>
    </tr>
   </c:forEach>
  </table>
  </body>
</html>

<%@page import="com.yameokja.mc.FileManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Download.jsp */
	
	String path = request.getParameter("path");
    String fileName = request.getParameter("fileName");
	
	
	// 파일 다운로드
	out.clear();
	boolean flag = FileManager.doFileDownload(fileName, path, response);
			
%>
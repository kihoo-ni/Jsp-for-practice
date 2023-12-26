<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String saveDirectory=application.getRealPath("/Uploads"); //저장할 디렉토리
	String saveFilename=request.getParameter("sName");
	String originalFilename=request.getParameter("oName");
	
	try{
		//파일을 찾아 입력 스트림 생성
		File file=new File(saveDirectory,saveFilename);
		InputStream inStream=new FileInputStream(file);
			
		//한글 파일명 깨짐 방지 ( 인터넷 익스플로어를 위한것 )
		String client=request.getHeader("User-Agent"); // 웹 브라우저의 종류를 가져옴
		if(client.indexOf("WOW64")==-1){ //브라우져가 인터넷 익스플로어가 아니면 utf-8, 인터넷 익스플로어면 KSC5601방식으로 한글처리
			originalFilename=new String(originalFilename.getBytes("utf-8"), "ISO-8859-1");
		} else {
			originalFilename=new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		//파일 다운로드용 응답 헤더 설정
		response.reset(); //응답헤더 초기화
		response.setContentType("application/octet-stream"); //8비트 스트림 설정
		response.setHeader("Content-Disposition", "attachment; filename=\""+originalFilename+"\"");
		response.setHeader("Content-Length",""+file.length());
		
		//출력 스트림 초기화
		out.clear();
		
		//response 내장 객체로부터 새로운 출력 스트림 생성
		OutputStream outStream=response.getOutputStream();
		
		//출력 스트림에 파일 내용 출력
		byte b[]=new byte[(int)file.length()];
		int readBuffer=0;
		while((readBuffer=inStream.read(b))>0){
			outStream.write(b,0,readBuffer);
		}
		
		//입/출력 스트림 닫음
		inStream.close();
		outStream.close();
		
	} catch ( Exception e ) {
		e.printStackTrace();
		JSFunction.alertBack("예외가 발생했습니다.", out);
	}
%>
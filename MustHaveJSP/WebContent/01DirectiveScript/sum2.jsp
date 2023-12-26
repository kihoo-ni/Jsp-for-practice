<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
 // 1~100까지 합계출력 
 // 선언문 합계 함수 생성
 public int sum(){
 int sum=0;
	 
	 for(int i=0; i<=100; i++){
		 sum+=i;
	 }
	 return sum;
	
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><% 
// 함수 호출 스크릿틀립이용 합계결과 표현식출력
int result=sum();
%></h1>
<h1>합계 결과는 <%=result %>입니다</h1>
</body>
</html>
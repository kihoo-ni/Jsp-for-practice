<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Car" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarResult</title>
</head>
<body>
	<h1> CarResult </h1>
	<%
		Map<Integer,Car> carMaps= (Map<Integer,Car>)application.getAttribute("carMaps");
		Set<Integer>keySet = carMaps.keySet();
		for(Integer key : keySet){
			Car car=carMaps.get(key);
			out.print("이름 : "+car.getCarName()+", 가격 : "+car.getCarPrice()+"<br>");
		}
		/* Iterator<Integer> iterKey=keySet.iterator();
		while(iterKey.hasNext()){
			Integer key=iterKey.next();
			Car car=carMaps.get(key);
			out.print("이름 : "+car.getCarName()+", 가격 : "+car.getCarPrice()+"<br>");
		} */
	%>
	
	<%-- <%
		Map<Integer,Car> carResult = (Map<Integer,Car>)application.getAttribute("carMaps");
		Set<Integer> setkey = carResult.keySet();
		/* for(Integer key : setkey){
			Car car=carResult.get(key);
			out.println("이름 : "+car.getCarName()+", 가격 : "+car.getCarPrice());
		} 
		*/
		 Iterator<Integer> carKey=setkey.iterator();
			while(carKey.hasNext()){
				Integer keycar=carKey.next();
				Car car=carResult.get(keycar);
				out.println("이름 : "+car.getCarName()+", 가격 : "+car.getCarPrice()+"<br>");
		} 
	%> --%>
		
		
</body>
</html>
package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	//명시한 이름, 값, 유지기간 조건으로 새로운 쿠키를 생성합니다.
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie=new Cookie(cName, cValue);//쿠키생성
		cookie.setPath("/"); // MustHaveJSP 루트경로로감 (현재 프로젝트(루트))
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	//명시한 이름의 쿠키를 찾아 그 값을 반환합니다.
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue=""; //반환값
		
		Cookie[] cookies=request.getCookies();
		if(cookies !=null) {
			for(Cookie c: cookies) {
				String cookieName =c.getName();
				if(cookieName.equals(cName)) {
					cookieValue=c.getValue(); //반환해야할 값 넣기
				}
			}
		}
		return cookieValue;
	}
	
	//명시한 이름의 쿠키를 삭제합니다
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}

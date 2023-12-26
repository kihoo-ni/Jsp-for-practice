package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	// 파일 업로드(multipart/form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {
		try {
			//파일 업로드
			System.out.println("파일업로드 성공");
			return new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
		} catch (Exception e) {
			System.out.println("파일업로드 실패");
			e.printStackTrace();
			return null;
		}
	}
	
	// 파일 다운로드 처리
	public static void download(HttpServletRequest request, HttpServletResponse response, String directory, String sfileName, String ofileName) {
		String sDirectory=request.getServletContext().getRealPath(directory);
		try {
			//파일을 찾아 입력 스트림 생성
			File file=new File(sDirectory, sfileName);
			InputStream iStream=new FileInputStream(file);
			
			//한글 파일명 깨짐방지
			String client=request.getHeader("User-Agent"); // 웹 브라우저의 종류를 가져옴
			if(client.indexOf("WOW64")==-1){ //브라우져가 인터넷 익스플로어가 아니면 utf-8, 인터넷 익스플로어면 KSC5601방식으로 한글처리
				ofileName=new String(ofileName.getBytes("utf-8"), "ISO-8859-1");
			} else {
				ofileName=new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			//파일 다운로드용 응답헤더 설정
			response.reset(); //응답헤더 초기화
			response.setContentType("application/octet-stream"); //8비트 스트림 설정
			response.setHeader("Content-Disposition", "attachment; filename=\""+ofileName+"\"");
			response.setHeader("Content-Length",""+file.length());
			
			//출력 스트림 초기화
			//out.clear();
			
			//response 내장 객체로부터 새로운 출력 스트림 생성
			OutputStream oStream=response.getOutputStream();
			
			//출력 스트림에 파일 내용 출력
			byte b[]=new byte[(int)file.length()];
			int readBuffer=0;
			while((readBuffer=iStream.read(b))>0){
				oStream.write(b,0,readBuffer);
			}
			
			//입/출력 스트림 닫음
			iStream.close();
			oStream.close();
			
			
			System.out.println("파일 다운 성공");
		} catch (Exception e) {
			System.out.println("파일 다운 실패");
			e.printStackTrace();
		}
		
	}
	
	// 지정된 위치의 파일을 삭제합니다.
	public static void deleteFile(HttpServletRequest request, String directory, String filename) {
		String sDirectory=request.getServletContext().getRealPath(directory);
		File file=new File(sDirectory+File.separator+filename);
		if(file.exists()) {
			file.delete();
		}
	}
}

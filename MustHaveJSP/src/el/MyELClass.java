package el;

public class MyELClass {
	//주민등록 번호를 입력받아 성별을 반환합니다.
	public String getGender(String jumin) {
		String returnStr="";
		int beginIdx=jumin.indexOf("-")+1;
		String genderStr=jumin.substring(beginIdx, beginIdx+1);
		int genderInt=Integer.parseInt(genderStr);
		if(genderInt==1||genderInt==3)
			returnStr="남자";
		else if(genderInt==2||genderInt==4)
			returnStr="여자";
		else
			returnStr="주민번호 오류입니다.";
		return returnStr;
	}
}

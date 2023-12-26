package common;

public class Person {
	private String name; // 멤버 변수는 private 선언
	private int age;
	
	public Person() {} // 기본 생성자 만들기
	

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}

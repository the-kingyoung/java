

import java.util.Scanner;

class Friend {
	String name;
	int age;

	Friend(String name, int age) {
		this.name = name;
		this.age = age;
	}

	void show() {
		System.out.println("이름:" + name);
		System.out.println("친구가 된 나이:" + age);
	}

}

class Member {
	String id;
	String pass;
	String name;

	Member(String id, String pass, String name) {
		this.id = id;
		this.pass = pass;
		this.name = name;
	}

	void login() {
		System.out.println(name + "님 패스워드 " + pass + "를 통해서 로그인 성공하였습니다");
	}
	void login(String id, String pass) {
		System.out.println((this.id.equals(id)&&this.pass.equals(pass))?"로그인 성공" : "로그인 실패");
	}

}

class Entertainer {
	String name;
	int age;
	String sex;

	Entertainer(String name, int age, String sex) {
		this.name = name;
		this.age = age;
		this.sex = sex;
	}

	void showMyEnter() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + sex);
	}
}

public class A04_Exp {
	public static void main(String[] args) {
//01
		Friend friend01 = new Friend("홍길동", 18);
		friend01.show();
		System.out.println("\n");
//02
		Member member = new Member("몽룡", "123", "이몽룡");
		member.login();
		System.out.println("\n");
//03
		Entertainer ent = new Entertainer("성춘향", 28, "여자");
		ent.showMyEnter();
		System.out.println("\n");
//04
		Scanner scan = new Scanner(System.in);
		System.out.println("id와 password를 입력하세요");
		member.login("123","몽룡");
		member.login("몽룡", "123");


	}

}
/*
 * # 객체의 구성 요소를 통한 연습예제 
 * 1. Friend 클래스를 선언하고 필드 : 이름, 친구가 된 시기, 생성자를 통해 초기화, 메서드 show()출력처리 
 * 2. Member 클래스를 선언, 필드 : id, password, name 생성자를 통해 id, pass
 * name할당, 메서드 : login()을 통해서 @@@님 패스워드 @@@를 통해서 로그인 성공 출력. 
 * 3. Entertainer 클래스를
 * 선언, 필드 : 이름, 나이, 성별, 생성자 초기화, showMyEnter()메서드를 통해서 정보출력 
 * 4. 위 2번에서 login() 메서드에 매개변수로 id, pass입력하게 하여 기존 필드에 있는 id, pass와 동일하면 로그인 성공, 아니면 로그인 실패
 */

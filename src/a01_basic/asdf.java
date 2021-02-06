package a01_basic;
/*
 * # 객체의 구성 요소를 통한 연습예제 
 * 1. Friend 클래스를 선언하고 필드 : 이름, 친구가 된 시기, 생성자를 통해 초기화, 메서드 show()출력처리 
 * 2. Member 클래스를 선언, 필드 : id, password, name 생성자를 통해 id, pass
 * name할당, 메서드 : login()을 통해서 @@@님 패스워드 @@@를 통해서 로그인 성공 출력. 
 * 3. Entertainer 클래스를 선언, 필드 : 이름, 나이, 성별, 생성자 초기화, showMyEnter()메서드를 통해서 정보출력 
 * 4. 위 2번에서 login() 메서드에 매개변수로 id, pass입력하게 하여 기존 필드에 있는 id, pass와 동일하면 로그인 성공, 아니면 로그인 실패
 */

class Friend{
	String name;
	int age;
	
	Friend(String name, int age){
		this.name = name;
		this.age = age;
	}
	void show() {
		System.out.println("친구의 이름 : " + name);
		System.out.println("친구가 된 시기 : " + age + "살");
		System.out.println();
	}
}
class Member{
	String id;
	String pw;
	String name;
	
	Member(String id,String pw,String name){
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	void login() {
		System.out.println(name+"님께서 패스워드"+pw+"를 통해서 로그인 성공");
		System.out.println();
	}
	void login(String id, String pw) {
		System.out.println((this.id.equals(id)&&this.pw.equals(pw))?"로그인 성공":"로그인 실패");
		System.out.println();
	}
}
//4. 위 2번에서 login() 메서드에 매개변수로 id, pass입력하게 하여 기존 필드에 있는 id, pass와 동일하면 로그인 성공, 아니면 로그인 실패
class Entertainer{
	String name;
	int age;
	String gender;
	
	Entertainer(String name, int age, String gender){
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	void showMyEnter() {
		System.out.println("이름 : "+name);
		System.out.println("나이 : "+age);
		System.out.println("성별 : "+gender);
		System.out.println();
	}
}
public class asdf {
	public static void main(String[] args) {
		System.out.println("ex1)");
		Friend f1 = new Friend("김산하", 18);
		f1.show();
		
		System.out.println("ex2)");
		Member m1 = new Member("qwer", "1234","김영하");
		m1.login();
		
		System.out.println("ex3)");
		Entertainer e1 = new Entertainer("박규영", 28, "여성");
		e1.showMyEnter();
		
		System.out.println("ex4)");
		m1.login("qwer", "1234");
		m1.login("1234", "qwer");

		
		 	//ex) 학생 3명의 이름, 국어, 영어, 수학 점수를 각각의 배열로 만들어서
			//	아래의 형식으로 출력하세요
			//		이름		국어		영어		수학		총점		평균
			//		홍길동	70		80		90		240		80
			//		김길동	80		90		95		240		80
			//		신길동	60		80		90		240		80
		 
		 String [] name = {"홍길동", "김길동", "신길동"};
		 int[] kor 	= {70, 80, 60};
		 int[] eng 	= {80, 90, 80};
		 int[] math = {90, 95, 90};
		 System.out.println("이름\t국어\t영어\t수학\t총점\t평균\t");
		 for(int i=0;i<kor.length;i++) {
			 System.out.print(name[i] + "\t");
			 System.out.print(kor[i] + "\t");
			 System.out.print(eng[i] + "\t");
			 System.out.print(math[i] + "\t");
			 int tot = (kor[i]+eng[i]+math[i]);
			 System.out.print(tot+"\t");
			 System.out.println(tot/3.0F);
		 }
		 

	}
}

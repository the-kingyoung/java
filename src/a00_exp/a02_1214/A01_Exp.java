package a00_exp.a02_1214;

import java.util.ArrayList;

public class A01_Exp {
	public static void main(String[] args) {
		// 이파일은 어디에 
		//1. 동적 배열이 무엇인가 기술하세요 
		//- 배열은 초기에 정해진 크기를 바꿀수 없는데 동적 배열은 변경이 가능하다.
		//==> 배열이 동적으로 추가/변경이 가능하는 것을 말한다.
		//==>프로그래밍에서 배열을 동적으로 변경해주는 것이 많은데, 자바는 따로 동적배열을 지원하는 객체를 만들어서 사용한다.
		//==>ArrayList가 대표적인 동적배열을 지원하는 객체이다.
		//2. ArrayList에 지원하는 기능 메서드를 예제와 함께 기술하세요.
		//add()	: 특정한 객체를 마지막위치에 추가할 때, 사용하는 메서드.
		//set(index,변경할객체) : 특정한 위치에 특정한 객체를 변경할 때 사용된다.
		//remove(index) : 특정한 위치에 있는 객체를 삭제할 때 사용된다.
		System.out.println("2.)");
		ArrayList str = new ArrayList();
		str.add("박용택");
		str.add("이병규");
		str.add("정우영");
		str.set(2, "켈리");
		str.remove(2);
		for (int i = 0; i < str.size(); i++) {
			System.out.println(i + 1 + "번타자) " + str.get(i));
		}
		System.out.println();
		/*
		3.ArrayList의 할당시, default데이터 유형과 generic 이용시 장단점을 기술하세요.
		-일반 ArrayList는 typecasting이 필요하지만 generic은 ArrayList생성시부터
			타입이 선언된 채로 사용하기때문에 typecasting이 불필요하다.
	
		ArrayList list = new ArrayList();  
		==ArrayList<Object> list = new ArrayList<Object>();
		<Object> : generic으로 특정한 type의 객체만 들어올 수 있게끔 설정.
		Object는 상속상 자바의 최상위 클래스이기 때문에 모든 클래스를 다 할당할 수 있다.
		ArrayList의 default데이터 유형은 Object형이다.
		그러므로, 초기 default ArrayList는 모든 객체를 추가할 수 있는 특징을 가지고 있다.
		ArrayList list = new ArrayList(); 
		list.add("안녕하세요"); 		//문자열객체
		list.add(new Person());	//사용자 정의 객체
		list.add(new Integer(25));//wrapper 클래스 객체
		default ArrayList의 장점 : 모든 객체를 할당할 수 있다.
		default ArrayList의 단점 : 다시 호출해서 사용하려면 type casting이 필요하다.
		Person p = (Person)list.get(1);
		일반적으로 하나의 데이터 유형을 동적배열로 만드는 경우에는 generic 개념을 활용하여
		ArrayList<객체유형>형태로 사용한다.
		해당 type의 객체만 할당할 수 있게끔 초기에 처리해놓으면, 가져올 때 type casting을 하지않아도 바로 활용할 수 있다.
		ArrayList<Person> plist = new ArrayList<Person>();
		plist.add(new Person("홍길동",25));
		plist.add(new Person("김길동",28));
		plist.add(new Person("신길동",22));
		Person p01 = plist.get(0);
		*/
				
		
		
		//4.ArrayList의 generic Type으로 String과 Food(음식명,선호도 - 5점만점)으로
		//선언하고 활용 예제를 작성하세요.
		ArrayList<String> food01 = new ArrayList<String>();
		food01.add("김치찌개");
		food01.add("된장찌개");
		food01.add("부대찌개");
		for (String str01 : food01) {
			System.out.println(str01);
		}
		System.out.println();

		ArrayList<Food> food02 = new ArrayList<Food>();
		food02.add(new Food("김치찌개", 4));
		food02.add(new Food("된장찌개", 3));
		food02.add(new Food("부대찌개", 5));
		for (Food foodInfo : food02) {
			foodInfo.ev();
		}
		
		//for(int i=0; i<food02.size();i++){
		//	food02.get(i).show(); //food02.get(i)가 Food이기에 바로 .show()를 사용할 수 잇다.
		System.out.println();
		//5.1:다 관계 처리로 학교의 반(class01)1-1반) 객체에 Student(이름,국어,영어)로 설정하여
		//설정하여 학생등록과 성적리스트를 출력하는 기능메서드를 구현하세요.
		/*
		1) 1:다 관계의 클래스를 설정.
			- 여러개의 객체를 선언
			- 여러 단위 클래스를 ArrayList<객체>로 해서 포함하는 클래스 선언.
			
			
		 * */
		
		Class c1 = new Class("3학년 6반");			//반이름 ArrayList<Student>객체 생성
		c1.addStu(new Student("홍길동", 90, 80));		//ArrayList에 단위 객체가 추가.
		c1.addStu(new Student("신길동", 60, 78));
		c1.addStu(new Student("마길동", 100, 30));
		System.out.println();
		c1.ClassInfo();			//전체list 확인.
		//1:다 관계라는 것은 전체 객체를 포함하는 객체가 있고, 그 하위에 단위객체들이 모인 ArrayList<단위객>가 포함되어 있는 것을 말한다.

	}

}

class Food {
	private String name;
	private int point;

	public Food(String name, int point) {
		super();
		this.name = name;
		this.point = point;
	}

	public void ev() {
		System.out.print("음식 이름:" + name + "\t");
		System.out.println("선호도 점수:" + point);
		System.out.println();
	}
}

class Student {
	private String name;
	private int kor;
	private int eng;

	public Student(String name, int kor, int eng) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}

	public void test() {
		System.out.print("이름:" + name + "\t\t");
		System.out.print("국어점수:" + kor + "\t");
		System.out.println("영어점수:" + eng + "\t");

	}

	public String getName() {
		return name;
	}
}

class Class {
	private String num10;
	private ArrayList<Student> stu;
	//반이름과 ArrayList를 초기 생성처리..

	public Class(String num10) {
		super();
		this.num10 = num10;
		stu = new ArrayList<Student>();
		//Student 객체를 하나씩 등록하기 위해서 생성자에서 ArrayList객체를 '생성' 처리한다.
	}
//학생 정보 추가 메서드..
	public void addStu(Student s) {
		System.out.println(s.getName()+"학생 정보 추가 *");
		stu.add(s);
		s.test();
	}
//전체 반의 성적 출력..
	public void ClassInfo() {
		/*
		 1:다에서 1에 해당하는 반정보를 출력하고,
		 다에 해당하는 학생 정보를 FOR EACH구문을 통해서 처리한다.
		 */
		System.out.println(num10 + "학생 성적");
		for (Student s : stu) {
			s.test();
		}
	}

}



class Television{
	static String company 	= "삼성 전자";
	static String model 	= "LED";
	static String info;
	//static 블럭을 통해서 static 변수 데이터를 할당하여 사용할 수 있다.
	static {
		info = company+" - "+model;
	}
}
class Student{
	static String grade 	= "3학년";
	static String cls		= "6반";
	static String num		= "10번";
	static String name		= "홍길동";
	static String studinfo;
	static {
		studinfo = grade + " " + cls + " " + num + " " + name;
		
	}
}
public class A08_StaticBlock {
/*
# static 변수는 static block으로 변수를 변경할 때,
	사용할 수 있다.	 
	
ex) Student 클래스 선언하고 static 변수로 학년 반 번호 이름을 선언할 당하고, studinfo static 변수 선언
	static block을 통해 위 정보 할당하고, 확인하는 코드를 작성하세요..
*/
	public static void main(String[] args) {
		System.out.println(Television.company);
		System.out.println(Television.model);
		System.out.println(Television.info);
		System.out.println();
		System.out.println(Student.studinfo);
		
	}

}

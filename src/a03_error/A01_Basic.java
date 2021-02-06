package a03_error;

public class A01_Basic {
/*
# error 처리.
1. 에러의 유형
	1)	컴파일 : 
			소스 코드를 정상적으로 했는데, 해당클래스 호출하는데서
			에러가 발생..
			Person.java ==> Person.class(실제 기계어가 만들어져서 작동)
			클래스 파일이 만들어지지 않으면 없는거와 같아서 에러가 난다.
			class파일 만들어지는 시점 : 컴파일 되었을 때..
			javaexp\build\classes위치 해당 클래스 파일이 저장하는 시점과
			동일하게 수정되었는지 확인..
			==> 대응 방법
			1)	ctrl+s(저장)
			2)	해당 폴드를 찾아가서 클래스 파일 확인..
			3)	eclipse를 재기동..
			==>	선생님을 찾는다..
			
	2)	오타 : 
			-기본형식의 문제 발생.
			-int break; //내장 키워드를 변수 사용..(해당 변수가 진하게 표기)
			-마지막 ; (세미콜론) 문제..
	3)	블럭 처리 부분(중괄호 블럭)
			-시작블럭과 마지막 {} 습관화 : 블럭을 만들고 내용을 삽입하는 형식으로 처리.
			-탭(4자공백)
	
	4)	NullPointerExcetion
			- 문자열 String s;
			- 객체 선언후,
			데이터나 객체가 생성되지 않은 후에 s, 참조변수.메서드나 참조변수.필드를 사용할 때,
			에러 발생..
			String name=null;
			System.out.println(name);
//			System.out.println(name.toString());
			System.out.println("다음 라인 수행..");
			Person p1 = null;
			p1.call();
			System.out.println("다음 라인 수행..");
	
	5)	변수 초기화 관련.
	int break01; //내장 키워드를 변수 사용..(해당 변수가 진하게 표기)
	System.out.println(break01);//main 메서드 안에서 데이터를 할당하지 않고 사용하면 에러 발생

*/
	public static void main(String[] args) {
		int break01; //내장 키워드를 변수 사용..(해당 변수가 진하게 표기)
		break01=0;
		System.out.println(break01);//main 메서드 안에서 데이터를 할당하지 않고 사용하면 에러 발생
		String name=null;
		System.out.println(name);
//		System.out.println(name.toString());
		System.out.println("다음 라인 수행..");
		Person p1 = new Person();
		p1.call();
		System.out.println("다음 라인 수행..");
	
	}

}
class Person{
	public void call() {
		
	}
}

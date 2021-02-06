package a01_basic;


class Product{
	String name = "사과";
	int price = 1000;
	int cnt = 2;
	
}


public class A02_Memory {
	public static void main(String[] args) {
		
/*
*  java의 메모리 사용
*  1. java는 핵심 메모리로 두가지를 사용하고 있다.
*  2. stack : 기본 데이터 유형, 객체의 참조변수(heap영역의 주소값)
*  3. heap : 실제 객체가 들어 가는 메모리 영역
*/
		
		
		//기본데이터 할당
		int num01 = 25;
		System.out.println("데이터의 할당 확인(stack) : "+ num01 );
		//객체는 stack영역에 직접적으로 객체를 할당하는 것이 아니라
		//heap영역의 주소값으로 할당하고 있다.
		//		javaexp.a01_basic.Person@2ff4acd0
		//		패키지명.객체명@16진수의 주소값
		Person p = new Person();
		System.out.println("데이터의 할당 확인(heap의 주소) : " + p);
		//객체의 구성요소(필드, 생성자, 메서드)는 참조명을 통해서 접근이 가능하다.
		System.out.println("객체의 필드의 값 확인 : " + p.num01);
		
/*
* ex) 일반변수 num01과 num02의 사칙연산 데이터를 할당한 결과값을 출력하고,
* 클래스 Product를 선언하고, 필드로 name, price, cnt를 선언하고
* 할당한 결과값을 출력하세요. 
*/
		int num02 = 30;
		int num03 = 3;
		System.out.println(num02+ "+" + num03+"="+(num02+num03));
		System.out.println(num02+ "-" + num03+"="+(num02-num03));
		System.out.println(num02+ "*" + num03+"="+(num02*num03));
		System.out.println(num02+ "/" + num03+"="+(num02/num03));
		Product p01 = new Product();
		System.out.println(p01);
		System.out.println();
		
		String name01 = "홍길동";
		String name02 = "홍길동";
		String name03 = new String("홍길동");
		String name04 = new String("홍길동");
		//name 03과 04는 new String()로 생성하면 다른 heap주소 위치에 객체가 생성이 된다.
		System.out.println("name03==name04:"+(name03==name04));
		//new 없이 바로 문자열 할당하면 어떤 메모리를 사용하는지?
		//"홍길동"이란 문자열은 모두 다 같은 heap영역의 메모리를 사용한다.
		System.out.println("name01==name02:"+(name01==name02));

		/*
		 * 5. 문자열을 동일한 문자열의 비교는 ==를 활용하면, 예외 사항때문에 문제가 발생한다.
		 * 6. 문자열의 동등 비교는 문자열이 객체이므로 사용되는 .equals()를 활용하여 비교하여야 한다.
		 * 		ex) 파일을 읽거나, console 입력을 통해서 입력받거나, 데이터베이스를 통해서
		 * 		가져오는 데이터는 명시적으로 new String()가 보이진 않지만, 이 처리가 된
		 * 		각각의 heap영역의 메모리에 할당되고 할당 된 데이터를 호출하여 가져온다.
		 * 		ex) 다른 프로그래밍 language에서는 equals == 를 구분하는 경우가 드물기 때문에
		 * 		자바의 특징으로 기억해둬야 한다.
		 */
		
		
		System.out.println("name01.equals(name02):"+name01.equals(name02));
		System.out.println("name01.equals(name04):"+name01.equals(name04));
		System.out.println("name03.equals(name04):"+name03.equals(name04));

/*
 * ex) 임의의 아이디와 패스워드 문자열에 데이터를 할당하고, 해당 id pass가 동일하면 true, or not false로 처리하세요
 * (문자열만 비교)
 */
		String id = "홍길동";
		String pass = "성춘향";
		//id.equals("비교데이터1") : 문자열 내용을 동일할때, true
		//pass.equals("비교데이터1") : 문자열 내용을 동일할때, true
		//연산자1 && 연산자2 : 연산자1과 연산자2가 둘다 동일할 때 true가 된다.
		System.out.println("인증여부:"+(id.equals("홍길동")&&(pass.equals("성춘향"))));
				
		
		
	}

}
class Person{
	int num01 = 30;
}

/*
 * String값과 메모리 할당
 * 1. boolean 연산자(비교연산자) == 는 stack영역의 데이터를 비교해준다
 * 
 * 2. 기본 데이터 유형은 동일한 값을 할당하면 true로 처리되지만,
 * 	  객체의 경우 동일한 값을 할당하더라도 주소값이 다르기 때문에 false가 처리되는 경우가 많다.
 * 3. string 은 객체이다
 * 4. 데이터는 heap영역에 할당된다.*/

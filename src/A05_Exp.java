

import java.util.Scanner;

/*12/09
 * 전날 복습내용
 * 1.조건문의 형식은 if, switch문이 있다. if문의 형식과 기본예제를 기술하세요.
 * 		switch(특정데이터/변수){
 * 			case 데이터1 : 처리할 프로세서 break;
 * 			case 데이터2 : 처리할 프로세서 break;
 * 			case 데이터3 : 처리할 프로세서 break;
 * 			default : 위에 나열된 case가 아닐 때 처리할 process
 * 		}
 * 2.임의의 객관식 문제의 정답을 변수 corNum으로 할당하고 있다가
 * 		Scanner를 통해서 입력받은 변수 inputNum과 비교하여, 같으면 정답, 다르면 오답을
 * 		처리하는 프로그램을 만드세요.
 * 3. 반복문 for의 기본형식 2가지를 기술하세요.
 * 4. 반복문에서 사용되는 continue와 break의 차이를 기술하세요.
 * 5. for을 활용하여 3의 배수를 1~100까지 출력하고, 5의 배수를 100부터 50으로 감소처리하는 구문을 만드세요
 * 6. 실수형 배열로 3명이 키를 할당하고, for문을 이용하여 출력하세요.
 * 7. primitive data type의 default데이터와 객체의 default데이터에 대하여 기술하시오
 * 8. 클래스의 구성요소 3가지를 Music(타이틀, 가수)이라는 이름으로 선언하고 호출하세요
 * 9. 생성자의 overloading은 무엇을 의미하는지 기술하시오
 */
class Music{
	String title;
	String name;
	
	Music(String title, String name){
		this.title = title;
		this.name = name;
		
	}
	void show() {
		System.out.println("곡명"+title+"을 부른 가수는 "+name+"이다.");
	}
}

public class A05_Exp {
	public static void main(String[] args) {
		
		//ex1)
		int i = 0;
		if(i==0) {
			System.out.println("참입니다.");
		}else {
			System.out.println("거짓입니다.");
		}System.out.println();
		
		boolean isMale = true;
		if(isMale) {//if(boolean값)
			System.out.println("신사입니다");
		}
		
		//ex2)
		//특정한 범위의 임의의수 : (int)(Math.random()*경우의수+시작번호)
		//4가지 경우, 1부터 시작인 Math.random문
		System.out.println("정답을 입력하시오");
		Scanner scan = new Scanner(System.in);
		int inputNum = scan.nextInt();
		int corNum = (int)(Math.random()*4+1);
		System.out.println((inputNum==corNum)?"정답":"오답");
		System.out.println();
		
		//ex3)
		//for(초기값;반복조건;증감연산자)
		//for(단일변수나 객체:배열형)
		System.out.println("카운트 시작하겠습니다");
		for(int k=1; k<=10;k++) {
			System.out.println(k+"초");
			
		}System.out.println();
		String fruits[]= {"딸기", "사과"};
		
		for(String fruit : fruits) {
			System.out.println(fruit);
		}System.out.println();
		//ex4)continue문은 조건문과 함께 반복을 해당 단위 step만 더 이상 진행하지 않다가 다음 반복 step은 계속 진행
		//break는 해당 카운트에서 끊는것
		//ex5)
		for(int b=3;b<=100; b+=3) {
			System.out.println(b);
		}System.out.println();
		for(int f=100;50<=f;f-=5) {
			System.out.println(f);
		}System.out.println();
		//ex6)
		
		//for(double hi : arr)
		double [] arr = {173.4, 167.8, 183.6};
		for(int h=0;h<arr.length;h++) {
			System.out.println(arr[h]);
		}System.out.println();
		//ex7) primitive data type의 default데이터는0,0.0,false로 나타나고
		//		객체의 default데이터는 null로 나타난다
		//ex8)
		Music ion = new Music("up","chris");
		ion.show();
		//ex9)
		//짐을 덜어주기 위한(?)방법이다.


}
}

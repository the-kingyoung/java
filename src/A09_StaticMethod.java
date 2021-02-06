
/*
 # static 메서드도 객체 생성없이 바로 사용할 수 있다.
 */
class Calculator{
	static int plus(int num01, int num02) {
		return num01+num02;
	}
}
//ex) 	ShopMember 클래스를 만들고 static 메서드로 login선언하고, 매개변수로 id, pass를 입력
//		하게 하여, himan/7777일 때, 로그인 성공 문자열 그 외에는 로그인 실패 문자열 리턴하게 하세요.
/*
		if("himan".equals(id) && "7777".equals(pass)) {
			return "로그인 성공";
		} else {
			return "로그인 실패";
		}

 */

class ShopMember{
	static String login(String id, String pw) {
		//1. 삼항연산자 활용		조건?true:false;
		//2. 문자열 비교는 문자열1.equals(문자열2)
		return id.equals("himan")&&pw.equals("7777")?"로그인 성공":	"로그인 실패";
	}
	
}
public class A09_StaticMethod {
	static int minus(int num01, int num02) {
		return num01-num02;
	}
	
	public static void main(String[] args) {
		System.out.println("스태틱 메서드 활용1:"+Calculator.plus(25, 30));
		System.out.println("스태틱 메서드 활용2:"+minus(25,30));
		
		System.out.println(ShopMember.login("himan", "7777"));
		System.out.println(ShopMember.login("himan", "7767"));

		
	}

}

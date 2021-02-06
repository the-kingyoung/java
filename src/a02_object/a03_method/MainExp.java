package a02_object.a03_method;

public class MainExp {
	 public static void main(String[] args) {

	      Member m1 = new Member("himan","7777","홍길동");
	      m1.showInfo();
	      System.out.println("현재 입력된 id:"+m1.id);
	      System.out.println("기능 입력 메서드 처리..");
	      m1.setId("higirl");
	      System.out.println("현재 입력된 id:"+m1.id);
	      System.out.println("기능 입력 메서드2 처리(id,pass입력)..");
	      m1.setIdPass("goodMan", "9999");
	      System.out.println("현재 입력된 id:"+m1.id);
	      System.out.println("현재 입력된 pass:"+m1.pass);
	// ex1) name값을 저장하는 메서드 선언하고 변경된 name을 출력하세요..
	// ex2) 필드로 auth(권한)을 추가하여, 메서드로 auth권한 변경하는 처리를 하세요.
	// ex3) 필드 point(정수)를 추가하여, auth와 point를 같이 변경할 수 있게 한다.(12:40)
	      m1.setName("홍리나");//필드값이 기능 메서드에 의해 변경이 된다.
	      System.out.println("이름:"+m1.name);
	      m1.setAuth("관리자권한");
	      System.out.println("권한:"+m1.auth);
	      m1.setData("일반사용자권한", 1000);
	      System.out.println("변경된 권한:"+m1.auth);
	      System.out.println("포인트"+m1.point);
	      
	   }


}

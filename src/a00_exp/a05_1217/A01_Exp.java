package a00_exp.a05_1217;

public class A01_Exp {
	public static void main(String[] args) {
		/*
		1. 	예외 처리의 기본형식을 기술하고, String문자열이 null일때,
			발생할 예외를 코드화하여 처리하세요..
				try {
				String name=null;
				System.out.println("카운트1");
				System.out.println(name.toString());
				}catch(NullPointerException ne){
					System.out.println(ne.getMessage());
				}finally {
					System.out.println("수행2");
				}
				System.out.println("수행3");
				==>기본 형식.
				try{
					예외의 가능성이 있는 코드(실행예외), 반드시 처리할 예외 코드(필수예외)
				}catch(예외처리 객체 e){
					예외가 발생했을 때, 처리할 코드..
					e.getMessage() : 예외의 내용을 문자열로 출력.
				}finally{
					예외와 발생 상관 없이 처리할 내용을 코딩할 부분
				}

		2.	반복문을 통해서 10을 5부터 시작하여 -5까지씩 나누어 처리 결과를 출력하되,
			/0으로 나눌때, 정상적으로 작동하도록 예외 처리를 하여 출력하세요.
			ex) 10/5, 10/4, 10/3....10/0...\
			*/
		/*
		for (int i = 5; i >= -5; i--) {
			try {

				System.out.println("10 / " + i + " = " + 10 / i);
			}

			catch (ArithmeticException e) {
				System.out.println("# 수학적 계산 관련 예외 발생 #");
				System.out.println("예외 발생" + e.getMessage());
				System.out.println("10 / " + i + " = 0");
			} catch (Exception e) {
				System.out.println("# 기타 예외 발생#");
				System.out.println("예외:" + e.getMessage());
			} finally {
				System.out.println("10은 0부터 그 밑의 수로는 나눌 수 없습니다.");
			}
			*/

				/*
			
		3.	예외의 계층 구조화의 목적을 기술하세요.
			- 예외에 대한 메모리 처리를 효과적으로 하기 위하여 계층화 한다.
			==>	예외도 처리시, 메모리를 효과적으로 사용하려고 한다.
				상속관계에서 최상에 있는 예외가 가장 넓은 범위를 수행하여 메모리를 활용한다.
				이렇게 되면 최하위에 있는 예외를 먼저 처리하고, 그 예외로 안잡히면 상위계층에
				있는 예외를 잡는 것이 효과적이다.
				그래서, 아래의 형식으로 예외를 처리하고 있다.
				try{
				
				}catch(최하위예외){
				
				}catch(중간계층예외){
				
				}catch(최상위예외){
				
				}

		4.	예외처리에서 throw, throws키워드를 사용할 때, 차이점을 기술하세요.
			-이 부분 잘 이해가 되지 않아서 다시 한번 설명 부탁드리겠습니다 !
			==>	throw는 강제 예외를 처리할 때, 주로 사용되는 구문으로 throw new 예외객체();로
				활용된다. 특정한 조건인 경우에 명시적으로 예외를 던져, catch블럭의 매개변수로 예외객체를 받아 처리하게 한다.
				
				throws는 메서드 단위로 예외를 위임하여, 위임한 곳에서 한꺼번에 예외를 처리할 때,
				사용하는 keyword로 메서드명() throws 예외클래스1, 예외클래스2..의 형식으로 사용된다.
				
		5.	사용자 정의 예외의 멤버별 특징을 기술하세요..
			==> 생성자의 매개값이 getMessage와 연동 되어 있다던가,
			overriding을 하는 메서드가 주로 어떤 것인지,
			추가 메서드를 통해서 하는 내용.
			그리고, 이렇게 정의한 사용자 정의 클래스를 통해서 예외 처리될 때,
			각 멤버별로 어떻게 처리되는지를 설명하면 됨.
			
			class 사용자정의예외 extends Exception{
				private 필드.. : 사용자 정의에서 사용할 필드 선언
				public 사용정의예외생성자(매개변수){
					super(매개변수);	//super(매개변수)는 Exception 클래스의
					매개변수가 있는 생성자를 호출하고, 여기에 전달된 문자열은
					Exception 클래스 하위에 있는 getMessage()의 리턴값으로 활용된다.
				}
				//Exception 클래스의 getMessage() 오버라이딩
				public String getMessage(){
					//super.getMessage() : 상위 Exception의 해당 메서드 사용..
					return "[사용자 정의 예외]"+super.getMessage();		
				}
				// 사용자 정의 메서드에서 추가할 메서드 선언.
				public void showInfo(){
					System.out.println("예외의 발생~~추가 메서드 구현..")
				}
				 
			
			}
			

		6.	1에서 20까지 처리되는 내용에 있어서 3의 배수마다 사용자 정의 예외를 발생하게 한다.
			(ExceptionTriple를 선언하여 재정의(getMessage)와 추가메서드를 처리하여 출력하도록 하세요.)
		*/

		/*

				for (int i = 1; i <= 20; i++) {
					System.out.println("번호:" + i);
					try {
						if (i % 3 == 0) {
							throw new ExceptionTriple("3의 배수 예외", i);
						}
					} catch (ExceptionTriple e) {
						// 재정의한 메서드 호출.
						System.out.println(e.getMessage());
						// 추가정의한 메서드 호출
						e.showInfo();
					} catch (Exception e) {
						System.out.println("기타 예외:" + e.getMessage());
					} finally {}
				}
				

		*/

		/*
			
		7. eclipse를 통한 웹서버 구축과정을 기술하고, 각 단계별로 주의 사항을 설명하도록 하세요.
			1) 웹 어플리케이션 서버 다운로드..
				tomcat download
			2) 버전확인 다운로드 압축해제..
			3) eclipse 하단 servers메뉴를 통해서 해당 다운된 버전 tomcat 설정과 위치 지정.
			4) eclipse Dynamic Web 프로젝트 생성
			   jsp 사용을 위해서 lib부분 파일 copy
			   -C:\apache-tomcat-9.0.41\lib에 있는
			5) 프로젝트와 tomcat 연동
			6) tomcat 초기 port의 변경
			7) web프로젝트 하위 폴드에 WebContent 폴드에 index.html이나,
			   index.jsp 등 웹관련 파일 생성..
			8) tomcat 시작 해당 파일을 통해 실행 처리..

		8. javaexp10 프로젝트를 만들고, Webcontent및 show.html과 show.jsp를 통해
			화면을 구현하고, port번호 3030으로 지정하여 웹서버와 연동하여
			출력한 화면과 서버구축 내용을 캡처하여 전송하세요.
			*/
	}
}

class ExceptionTriple extends Exception {
	private int num;

	public ExceptionTriple() {
		super("3의 배수 예외 발생!!");
	}

	public ExceptionTriple(String msg, int num) {
		super(msg); // 지정한 메시지로 예외 처리.
		this.num = num;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "[사용자 정의 3의 배수 예외]" + super.getMessage();
	}

// 추가 메서드 정의
	public void showInfo() {
		System.out.println("3의 배수 메서드 처리" + num + " 예외 발생~~");
	}
}

package a02_object;

class MathExp{
	int num01 = 25; //초기값 할당.
	final double PI = 3.14;
	final double PI2;
	MathExp(){
		PI2=0.0; //객체에 포함된 필드가 초기화되지 않으면 에러 발생.
	}
	
	MathExp(int pi){//생성자를 통한 초기화처리..
		PI2 = pi;
	}
}
final class Dragon{
	Dragon(){
		System.out.println("용 객체 생성..");
	}
	void fly() {
		System.out.println("용이 불을 뿜으며 날아다니다.");
	}
}
//class Dragon2 extends Dragon{} (상속이 불가하다 !)
class Horse{
	void sound() {
		System.out.println("말이 소리 내다..");
	}
	final void stop(){ //특정한 메서드를 상속 하위에서 변경해서 사용하지 못하게 할 때, 앞에 final을 붙인다.
		System.out.println("정지하다");
	}
	void runningFast() {
		System.out.println("빠르게 달리다!!");
	}
}
class RobotHorse extends Horse{
	void sound() { //상위에서 선언한 메서드와 동일한 메서드를 재정의(overriding)
		super.sound(); //상위에 정의된 메서드 사용..
		System.out.println("경쾌한 음악소리를 포함해서 소리가 난다.");
	}
	void runningFast() {
		super.runningFast();
		System.out.println("로켓을 장착해서 공중부양해서 달리다!!");
	}
	//void stop(){} 상위 클래스 final 정의 되어 있기 때문에 더 이상 하위에서 추가 정의하거나
	//변경처리 불가능 : overriding금지!
}
//class DragonSon extends Dragon{}  Dragon클래스 앞에 상수가 붙어 있기에 더 이상 상속은 할 수 없다.
class Duck{
	void sound() {
		System.out.println("꽥, 꽥");
	}
	final void swim() {
		System.out.println("수영을 잘한다.");
	}
	void fly() {
		System.out.println("하늘을 날다");
	}
}
class RubberDuck extends Duck{
	void sound() {
		super.sound();
		System.out.println("누를때마다 소리를 낸다");
	}
	void fly() {
		super.fly();
		System.out.println("던지면 잠깐 나는 것 처럼 보인다");
	}
}
public class A06_Final {
	/*
# final
1. final은 클래스의 구성요소와 클래스 자체에 키워드로 사용된다.
2. 적용 대상별로 기능 내용.
	1)  필드명 앞에 쓰이면? = 초기값 할당 이후, 더 이상 변경할 수 없는 값으로 설정된다.
		상수로 사용되면 일반적으로 상수를 표현할 때, 상수명을 전체 다 대문자로 사용한다.
		ex) final double PI = 3.141592;
		변수(variable)	: 데이터가 변경될 수 있는 수;
		상수(const)		: 데이터가 변경될 수 없는 수
	2)	클래스명앞에 붙으면 어떻게 될까? => final 클래스명으로 선언되면 더 이상 상속을 할 수 없다.
		ex) final class Horse{}
	3)	메서드명 앞에 붙으면 더 이상 재정의(overriding)- 상속받은 하위 클래스에서 재정의 하여 사용할 수 없다.
	 	ex) final void running(){}
	 
	
	 
	 */
	
	public static void main(String[] args) {
		MathExp m01 = new MathExp();
		System.out.println("변수1:"+m01.num01);
		System.out.println("변수2:"+m01.PI);
		m01.num01 = 75; //다른 데이터 할당.
		//m01.PI=3.75; <==다른데이터 할당시 에러 발생
		// ex) 상수의 사용 예제..Calculator2  num01, num02는 변수
		//연산자("+/-/*//")상수로 생성자에 의해 초기화 될 수 있게 처리하고, show()를 통해서 출력하세요.
		Calculator2 c1 = new Calculator2(25," X ",5);
		c1.show();
		Dragon d1 = new Dragon();
		d1.fly();
		RobotHorse rh = new RobotHorse();
		rh.sound();
		rh.runningFast();
		rh.stop();
		
		RubberDuck rb = new RubberDuck();
		rb.fly();
		
	}
// ex) final 메서드 확인 예제..
//		class Duck 메서드 sound(), fly(), swim() swim은 final로 처리하고
//		상속받은 하위 클래스 class RobotDuck //class RubberDuck 재정의하고, swim에 대한 내용을 확인

}
class Calculator2{
	int num01;
	int num02;
	final String CAL;
	
	Calculator2(int num01,String cal, int num02){
		this.num01=num01;
		this.CAL = cal;
		this.num02=num02;		
	}
	void show() {
		System.out.println(num01+CAL+num02);
	}
}












package a04_inherit.a03_interface;

public class A02_AnonymousInterface {
/*
# 익명인터페이스 사용.
1. 	인터페이스 사용은 인터페이스 = 상속하는 실제객체 일반적..
2. 	인터페이스에 인터페이스 = new 인터페이스명(){
	};
	실제 객체대신에 생성하여 재정의한 내용을 포함시켜 바로 할당하는 
	실제객체 이름이 없는(익명) 인터페이스를 다형성에 의해서 사용할 수 있다.
	호출하는 곳에서 따로 선언없이 바로 사용할 때, 활용된다.
 */
	public static void main(String[] args) {
		RemoteControl rc = new RemoteControl() {
			@Override
			public void setVolume(int volume) {
				// TODO Auto-generated method stub
				System.out.println("볼륨:"+volume+"로 설정");
			}
		};
		rc.setMute(false);
		rc.setVolume(5);
//ex) AttackWay에서 바로 익명으로 무기를 만들어서 attack()를 호출하세요./
//		태권도 발차기 공격
		AttackWay aw = new AttackWay() {

			@Override
			public void attack() {
				// TODO Auto-generated method stub
				System.out.println("태권도 발차기 공격을 한다.");
				
			}
		};
		aw.attack();
	}
}

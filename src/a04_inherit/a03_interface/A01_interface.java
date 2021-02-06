package a04_inherit.a03_interface;

public class A01_interface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Mz m1 = new Mz();
		m1.run();
		m1.attack();
		m1.fly();
		//날개 1호를 장착..
		m1.setFlyway(new Wing01());
		m1.fly();
		//Mz에 코드를 변경하지 않고, Flyway를 상속받은 클래스만 
		//.setFlyway에 장착하면 된다.
		m1.setFlyway(new Wing02());
		m1.fly();
		m1.setWeapon(new Rocket());
		m1.attack();
		
		
		Audio audio = new Audio();
		audio.setMute(true);	//default메서드 호출.
		audio.setVolume(15);	//재정의한 메서드 호출.
		RemoteControl.changeBattery();//static 메서드로 바로 사용한 경우
	
		
		

	}
//ex) 	인터페이스로 AttackWay를 선언하고 attack()를 추상메서드 선언.
//		상속받은 하위 실제 클래스로 무기의 종류를 새롭게 장착하여 
//		공격방법을 다르게 처리하세요..		무기 - 로켓포, 미사일, 레이저빔..
}
interface AttackWay{
	public void attack();
	
}
class Rocket implements AttackWay{
	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println("로켓포로 공격하다!!");
	}	
}
class Missile implements AttackWay{
	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println("미사일로 공격하다!!");
	}	
}
class Laser implements AttackWay{
	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println("레이저로 공격하다!!");
	}	
}
/*
# 인터페이스
1. 	시작하면서..
	MZ(마징가Z)
	초기 - 뛰어다니는 로봇..
	박사가 날개를 만듬  -	MZ에 어깨쪽에 날개의 송수신을 할 수 있는 adapter를 만들고,
						adapter(인터페이스)를 통해 중앙처리장치에서 연결할 수 있게 처리.
	박사는 따로 날개를 제작..adapter기반으로 제작. 수개월..걸려서 완성..
	완성된 날개가 어깨와 허리를 통해 부착이 됨..
	핵심 - adapter(인터페이스)만 만들어 놓으면, 따로 로봇은 연구소에서 날개가 제작이 완료될때까지
		  있지않아도 된다.
		  adapter에 있는 송수신에형태만 맞으면, 그 이후에 계속 날개는 upgrade가 가능하다.

2. 	인터페이스를 사용하면, 기본 클래스에 영향을 미치지 않고, 추가적인 개발을 계속할 수 있는 
	특징이 있다.

3. 	인터페이스란?
	개발 코드와 객체가 서로 통신하는 접점을 말한다.
	1) 주요 역할
		개발 코드가 객체에 종속되지 않게, 상속에 의해 생성되는 여러 객체들로 간편하게 교체할 수 있는 역할을 한다.
		ex) Mz에 여러가지 날개1호, 날개2호 교체..
			여러가지 무기 종류 교체..
		메인 코드를 변경 없이 추가적이거나 변경되는 코드를 다양하게 사용할 수 있다.
		ex) Mz의 코드 변경없이 날으는 기능이나 무기를 다양하게 사용할 수 있다.

4. 	인터페이스의 선언..
	interface 인터페이스명{
		[public static final] 데이터타입 상수명 = 할당할데이터;
		[public abstract] 리턴타입 추상메서드();
		default 리턴타입 메소드명(매개변수){
		
		}//default 메소드.
		static 리턴타입 메소드명(){
		}
	}
	1) 인터페이스명은 클래스와 동일하게 대문자로 시작하여 사용한다.
	2) 인터페이스는 초기값이 할당된 static 상수만 사용할 수 있다.
	*/
interface RemoteControl{
	int MAX_VOLUME = 10;	// public static final이 생략됨..
	int MIN_VOLUME = 0;
	void setVolume(int volume); // public abstract가 생략됨..
	default void setMute(boolean mute) {
		if(mute) {
			System.out.println("무음 처리합니다.");
		}else {
			System.out.println("무음 해제 합니다.");
		}
	}
	static void changeBattery() {
		System.out.println("건전지를 교환합니다.");
	}
}
class Audio implements RemoteControl{
	//현재 볼륨..
	private int volume;
	@Override
	public void setVolume(int volume) {
		// TODO Auto-generated method stub
		if(volume>RemoteControl.MAX_VOLUME) {
			this.volume = RemoteControl.MAX_VOLUME;
		}else if (volume<RemoteControl.MIN_VOLUME) {
			this.volume = RemoteControl.MIN_VOLUME;
		}else {
			this.volume = volume;
		}
		System.out.println("현재 오디오 볼륨은 "+this.volume);
	} 
	
}
/*
  **3) 추상메서드 : 상속받는 하위 클래스에서 재정의할 메서드..\
	4) 공통기능메서드 : default메서드, 객체생성없이 사용할 수 있는
					static메서드(java1.8이후)
		
					
 */

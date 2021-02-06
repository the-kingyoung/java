package a02_object.a04_methodExp;
/*
Member
	필드 : id, pass, name, point
	생성자 : 필드값 할당.
	기능메서드1 : 회원정보변경..매개변수3
				id, pass, name변경
				변경된 내용 출력..
	
	기능메서드2 : 패스워드변경 매개변수1
				변경된 패스워드 내용 출력.
	
	기능메서드3 : 포인트 추가(매개변수 만큼 포인트 추가)
				추가된 포인트 : @@@
				현재 포인트 : @@@
	
	기능메서드4 : 구매처리(구매할물건, 차감할 point 매개변수)
				@@@를 @@pt에 구매하여 현재포인트 @@
				return 차감후 포인트
 */
class Member {
	String id;
	String pw;
	String name;
	int point;

	Member(String id, String pw, String name, int point) {// 매개변수
		this.id = id; // 오른쪽에 있는게 매개변수, 왼쪽이 의미하는건 필드값
		this.pw = pw;
		this.name = name;
		this.point = point;

	}

	void change(String id, String pw, String name) {
		System.out.println("# 회원 정보 변경 #");
		System.out.println("id :" + id);
		System.out.println("pw :" + pw);
		System.out.println("name :" + name);
		System.out.println();
	}

	void change(String pw) {
		System.out.println("# 비밀 번호 변경 #");
		System.out.println("패스워드를 " + pw + "로 변경합니다.");
		System.out.println();
	}

	void addPoint(int point) {
		this.point += point;//기존에 있는 point에서 추가 처리
		System.out.println("추가된 포인트" + point);
		System.out.println("잔여 포인트" + this.point);
		System.out.println();
	}

	int buy(String buyProduct, int price) {
		//기존에 있는 포인트를 차감 .
		/*
		 * point-=price;
		 * syso(buyproduct를 price 로 구매하여 현재포인트 point)
		 */
		System.out.println("구매");
		if (this.point < price) {
			System.out.println("포인트가 부족합니다.");
			return this.point;
		} else {
			System.out.println(buyProduct + "를 " + price + "포인트를 주고 구매하였습니다.");
			return this.point -= price;
		}
	}

}

public class A01_MethodExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Member m1 = new Member(null, null, null, 0);
		m1.change("rladudgk", "1234", "김영하");
		m1.change("2345");
		m1.addPoint(3000);
		m1.addPoint(650);
		m1.addPoint(5000);
		System.out.println("현재 포인트:" + m1.buy("닭고기", 5000));

	}

}

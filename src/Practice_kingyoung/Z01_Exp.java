package Practice_kingyoung;
//1. 	사람(이름, 주소, 핸드폰) vs 핸드폰(전화번호,제조사) 관계를
//메서드 할당하는데 까지 처리해서 출력해 주세요.
class Phone {
	String pnum;
	String company;

	public Phone(String pnum, String company) {
		super();
		this.pnum = pnum;
		this.company = company;
	}

	void phoneInfo() {
		System.out.println("# 핸드폰 정보 #");
		System.out.println("전화번호:" + pnum);
		System.out.println("제조사:" + company);
	}
}

class Man {
	String name;
	String address;
	Phone phone;

	public Man(String name, String address) {
		super();
		this.name = name;
		this.address = address;
	}

	void grip(Phone phone) {
		this.phone = phone;
	}

	void showPhone() {
		System.out.println("# 핸드폰 소유 여부 #");
		if (phone != null) {
			System.out.println("핸드폰을 가지고 있습니다.");
			phone.phoneInfo();
		} else {
			System.out.println("핸드폰을 가지고있지 않습니다.");
		}
	}

}
//2. 	컴퓨터(종류, 제조사) vs cpu(클럭속도, 제조사)
//메서드로 할당하고, cpu 장착 여부에 대한 처리..
class Cpu {
	String clock;
	String made;

	public Cpu(String clock, String made) {
		super();
		this.clock = clock;
		this.made = made;
	}

	void cpuInfo() {
		System.out.println("#cpu 정보#");
		System.out.println("클럭 속도:" + clock);
		System.out.println("제조사:" + made);
	}
}

class Computer {
	String kind;
	String company;
	Cpu cpu;

	public Computer(String kind, String company) {
		super();
		this.kind = kind;
		this.company = company;
	}

	void cpuget(Cpu cpu) {
		this.cpu = cpu;
	}

	void computerInfo() {
		System.out.println("# CPU 존재 여부 #");
		if (cpu != null) {
			System.out.println("cpu를 가지고 있습니다.");
			cpu.cpuInfo();
		} else {
			System.out.println("cpu를 가지고 있지 않습니다.");
		}
	}
}
//3.	Person(이름,Friend) vs Friend(이름, 좋은기억)
class Friend {
	String name1;
	String memory;

	public Friend(String name1, String memory) {
		super();
		this.name1 = name1;
		this.memory = memory;
	}

	void friendInfo() {
		System.out.println("# 친구의 정보 #");
		System.out.println("친구 이름:" + name1);
		System.out.println("좋은 기억:" + memory);
	}
}

class Person {
	String name;
	Friend friend;

	public Person(String name) {
		super();
		this.name = name;
	}

	void remember(Friend friend) {
		this.friend = friend;
	}

	void doyouhave() {
		System.out.println("# 당신은 좋은 기억을 가진 친구가 있습니까? #");
		if (friend != null) {
			System.out.println("예, 있습니다.");
			friend.friendInfo();
		} else {
			System.out.println("아니오, 없습니다.");
		}
	}
}
public class Z01_Exp {

	public static void main(String[] args) {
		Man m1 = new Man("홍길동", "서울 특별시");
		m1.showPhone();
		m1.grip(new Phone("010-1234-1234", "apple"));
		m1.showPhone();

		Computer c1 = new Computer("노트북", "삼성");
		c1.computerInfo();
		c1.cpuget(new Cpu("3.2Ghz", "intell"));
		c1.computerInfo();

		Person p1 = new Person("유비");
		p1.doyouhave();
		p1.remember(new Friend("관우", "도원결의"));
		p1.doyouhave();
	}
}
package a00_exp.a01_1210;

class Cpu {
	double clockSpeed;
	String company;

	public Cpu(double clockSpeed, String company) {// 생성자를 통해 데이터를 받아들일수 있게 만든다.
		super();
		this.clockSpeed = clockSpeed;
		this.company = company;
	}

	void info() {
		System.out.println("# CPU 정보 #");
		System.out.println("클럭 속도" + clockSpeed + "GHZ");
		System.out.println("제조사:" + company);
	}
}

class Ram {
	String company;
	int memory;

	public Ram(String company, int memory) {
		super();
		this.company = company;
		this.memory = memory;
	}

	void info() {
		System.out.println("# Ram 정보 #");
		System.out.println("메모리 용량 : " + memory + "G");
		System.out.println("제조사 : " + company);
	}
}

class Computer {
	String kind;
	String company;
	Cpu cpu;
	Ram ram; // 1:다수 - 하나의 객체가 여러개의 객체로 구성되어 있을 때, 사용된다.

	public Computer(String kind, String company) {
		super();
		this.kind = kind;
		this.company = company;
	}

	// 메서드로 할당..(객체가 메모리 할당..)
	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}

	public void setRam(Ram ram) {
		this.ram = ram;
	}

	void show() {
		System.out.println("컴퓨터의 종류 : " + kind);
		System.out.println("제조사 : " + company);
		if (cpu != null) {
			cpu.info();
		} else {
			System.out.println("CPU가 장착되지 않았습니다.");
		}
		if (ram != null) {
			ram.info();
		} else {
			System.out.println("RAM이 장착되지 않았습니다.");
		}
	}

}


public class A02_Exp {
	public static void main(String[] args) {
		Computer c1 = new Computer("데스크탑", "Mac");
		c1.show();
		c1.setCpu(new Cpu(3.6,"intell"));
		c1.setRam(new Ram("삼성전자", 16));
		c1.show();
	}
}

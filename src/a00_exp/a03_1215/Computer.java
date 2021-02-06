package a00_exp.a03_1215;

import java.util.ArrayList;

class Cpu{
	private String company;
	private String capacity;
	
	public Cpu(String company, String capacity) {
		super();
		this.company = company;//kind=="CPU
		this.capacity = capacity;
	}
	public void showInfo() {
		System.out.println("CPU의 제조사는 "+company+"입니다.");
		System.out.println("CPU 속도는 "+capacity+"GHz 입니다.");
	}
}
class Ram{
	private String company;
	private String capacity;
	
	public Ram(String company, String capacity) {
		super();
		this.company = company;
		this.capacity = capacity;
	}
	public void showInfo() {
		System.out.println("Ram의 제조사는 "+company+"입니다.");
		System.out.println("Ram 속도는 "+capacity+"MHz 입니다.");
	}
}
class Hdd{
	private String company;
	private String capacity;
	
	public Hdd(String company, String capacity) {
		super();
		this.company = company;
		this.capacity = capacity;
	}
	public void showInfo() {
		System.out.println("Hdd의 제조사는 "+company+"입니다.");
		System.out.println("Hdd 용량은 "+capacity+"TB 입니다.");
	}
}

public class Computer {
	private String kind;
	private ArrayList<Cpu> info1;
	private ArrayList<Ram> info2;
	private ArrayList<Hdd> info3;
	
	public Computer(String kind) {
		super();
		this.kind = kind;
		info1 = new ArrayList<Cpu>();
		info2 = new ArrayList<Ram>();
		info3 = new ArrayList<Hdd>();
	}
	public void addCpu(Cpu c1) {
		info1.add(c1);
	}
	public void addRam(Ram r1) {
		info2.add(r1);
	}
	public void addHdd(Hdd h1) {
		info3.add(h1);
	}
	public void comInfo() {
		System.out.println(kind+" 정보");
		for(Cpu c1 : info1) {
			c1.showInfo();
		}
		for(Ram r1 : info2) {
			r1.showInfo();
		}
		for(Hdd h1 : info3) {
			h1.showInfo();
		}
	}
	

}

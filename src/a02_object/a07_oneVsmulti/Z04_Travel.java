package a02_object.a07_oneVsmulti;

import java.util.ArrayList;

/*
ex) 1:다 관계의 내용을 아래의 구조로 처리하세요.
	
	Travel : 필드 - 여행타이틀(여름휴가/가족여행/취업여행...),
				   ArrayList<Location>
			 매서드 - 여행지 객체 추가 메서드
			 		전체 여행일정 리스트 메서드
				   
	Location(여행지) 위치, 수단(배, 비행기,차량),기간
 */

public class Z04_Travel {
	public static void main(String[] args) {
		Travel t1 = new Travel("취업여행");
		t1.addLoc(new Location("제주도","비행기","2주일"));
		t1.addLoc(new Location("오사카","비행기","1주일"));
		t1.addLoc(new Location("고성","자동차","3일"));
		System.out.println();
		t1.travInfo();
		
	}
}
class Location{
	private String loc;
	private String trans;
	private String term;
	
	public Location(String loc, String trans, String term) {
		super();
		this.loc = loc;
		this.trans = trans;
		this.term = term;
	}
	public void locInfo() {
		System.out.print("여행지: "+loc+"\t");
		System.out.print("교통수단: "+trans+"\t");
		System.out.println("여행기간: "+term);
	}
	public String getLoc() {
		return loc;
	}
}


class Travel{
	private String title;
	private ArrayList<Location> info;
	
	public Travel(String title) {
		super();
		this.title = title;
		info = new ArrayList<Location>();
	}
	//여행지 추가메서드
	public void addLoc(Location l1) {
		System.out.println(l1.getLoc()+"여행 계획");
		info.add(l1);		
	}
	//전체 출력 리스트 처리
	public void travInfo() {
		System.out.println("여행 주제:"+title);
		for (Location l1 : info) {
			l1.locInfo();
		}
	}
}





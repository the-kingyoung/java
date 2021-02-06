package a02_object.a07_oneVsmulti;

import java.util.ArrayList;

public class League {
	private String lname;
	private ArrayList<Team> tlist;

	public League(String lname) {
		super();
		this.lname = lname;
		tlist = new ArrayList<Team>();
	}

	public void addTeam(Team t) {
		tlist.add(t);
	}

	public void playTeam10() {
		for (Team t : tlist) {
			// 리그에 들어온 팀들 10회 게임 진행
			for (int cnt = 0; cnt < 10; cnt++)
				t.play();
		}
	}

	public void teamRecords() {
		System.out.println("팀명\t경기수\t승\t무\t패");
		for (Team t : tlist) {
			t.showRecord();
		}
	}
}

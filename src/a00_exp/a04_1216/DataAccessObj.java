package a00_exp.a04_1216;
/*
 	DataAccessObj라는 데이터베이스 처리하는 인터페이스를 추상메서드(조회, 수정, 삭제, 등록)으로 선언하고,
	이를 상속받은 MySqlDao, OracleDao 실제 클래스를 선언하여, 각 클래스마다 다른 처리를 구현하여
	호출할 수 있도록 하세요.
 */

interface DataAccessObj {
	void lookup();	//public abstract가 생략 가능하다.
	void amend();
	void delete();
	void register();
}

class MySqlDao implements DataAccessObj {

	@Override
	public void lookup() {
		// TODO Auto-generated method stub
		System.out.println("MySql DB 서버에 접속해서 조회를 하다.");

	}

	@Override
	public void amend() {
		// TODO Auto-generated method stub
		System.out.println("MySql DB 서버에 접속해서 수정을 하다.");
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		System.out.println("MySql DB 서버에 접속해서 삭제를 하다.");
	}

	@Override
	public void register() {
		// TODO Auto-generated method stub
		System.out.println("MySql DB 서버에 접속해서 등록을 하다.");

	}

}

class OracleDao implements DataAccessObj {

	@Override
	public void lookup() {
		// TODO Auto-generated method stub
		System.out.println("Oracle DB 서버에 접속해서 조회를 하다.");
	}

	@Override
	public void amend() {
		// TODO Auto-generated method stub
		System.out.println("Oracle DB 서버에 접속해서 수정을 하다.");
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		System.out.println("Oracle DB 서버에 접속해서 삭제를 하다.");
	}

	@Override
	public void register() {
		// TODO Auto-generated method stub
		System.out.println("Oracle DB 서버에 접속해서 등록을 하다.");
	}

}
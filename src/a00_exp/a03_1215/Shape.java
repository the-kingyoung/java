package a00_exp.a03_1215;

class Triangle extends Shape {

	public Triangle() {
		super("삼각형");
	}
}

class Square extends Shape {

	public Square() {
		super("사각형");
	}
}

class Pentagon extends Shape {

	public Pentagon() {
		super("오각형");
	}
}

public class Shape {
	private String kind;

	public Shape(String kind) {
		super();
		this.kind = kind;
	}
	public void shapeInfo() {
		System.out.println("도형은 " + kind + "입니다.");
	}
}

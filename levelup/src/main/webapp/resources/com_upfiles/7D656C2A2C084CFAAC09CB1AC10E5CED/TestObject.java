package test.object;

import java.util.Objects;

public class TestObject {

	public static void main(String[] args) {
		// Object 클래스의 메소드 사용 테스트
		Book book = new Book("Object test",25000);
		Book book2 = (Book)book.clone(); // 얕은 복사에서 깊은 복사로 변경 
		Book book3 = book; // shallow copy
		
		System.out.println("book == book2: " + (book == book2));
		System.out.println("book.hashCode()"+book.hashCode());
		System.out.println("book2.hashCode()"+book2.hashCode());
		System.out.println("---------------------");
		Book book4 = book.cloneBook();
		System.out.println(book == book4);
		System.out.println(book.hashCode());
		System.out.println(book4.hashCode());
		System.out.println(book.equals(book4));
		
		Book book5 = new Book("Object test",25000);
		System.out.println(book.equals(book5));
	}
}

/*
	클래스 추가 
 * 
 */
class Book {
	private String title;
	private int price;
	
	public Book(String title, int price) {
		super();
		this.title = title;
		this.price = price;
	}
	
	public Book() {
		super();
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "Book [title=" + title + ", price=" + price + "]";
	}
	
	
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public Object clone() {
//		// this 가 참조하고 있는 객체와 똑같은 값들을 가진 복사객체를 생성해서 리턴함
		System.out.println("clone() 의 this 가 받은 주소 : " + this.hashCode());
//		return this;
//		// 주소를 넘기는 shallow copy
		
//		Book newBook = new Book(this.title);
//		return newBook
		return new Book(this.title, this.price); //새 객체의 주소 리턴
	}
	
	public Book cloneBook() {
		Book book = new Book(this.title, this.price);
		return book;
	}

	@Override
	public boolean equals(Object obj) {
		// 원래의 기능은 this 가 가진 주소와 전달받은 obj 가 받은 주소가 같은지 확인하는 기등
		boolean result = false;
		if(obj != null && this != obj && obj instanceof Book) {
			Book other = (Book)obj;
			if(this.title.equals(other.title) && this.price == other.price)
				result = true;
		}
		
		// 다른 두 객체가 같은 값을 갖는지 확인하는 용도로 쓰려면 아래 구문은 필요 없다
//		else if(this == obj) {
//			result = true;
//		}   
			
		return result;
	}
}
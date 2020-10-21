package day1;

public class q4 {
	
	public static void main(String[] args) {
		int a=0,b=1,n;
		System.out.print(a+" "+b);
		System.out.print(" ");
		
		for(int i=2;i<=20;i++) {
			n=a+b;
			System.out.print(n+" ");
			a=b;
			b=n;
		}
		
	}

}

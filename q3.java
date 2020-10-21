package day1;
import java.util.Scanner;
public class q3 {
	

	
		public static void main(String[] args) {
			int n;
			Scanner sc= new Scanner(System.in);
			System.out.println("Enter the number of students:");
			n= sc.nextInt();
			if(n>0)
			{
				int m;
			
			int[] grades = new int[n];
			for(int i=0;i<n;i++)
			{
				System.out.println("enter the grade for student"+i+":");
				m=sc.nextInt();
				if(m>100||m<0) {
					System.out.println("please enter valid marks");
					i--;
					continue;
				}
				grades[i]=m;
				
			}
			double sum=0;
			for(int j=0;j<n;j++) {
				sum=sum+grades[j];
			}
			System.out.println("the average is: "+sum/n);
		}
		
	}
}

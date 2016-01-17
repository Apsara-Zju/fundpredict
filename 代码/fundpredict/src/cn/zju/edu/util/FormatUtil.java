package cn.zju.edu.util;

public class FormatUtil {
public static void main(String[] args) {
	
	for(int i=61;i<=242;i++)
	{
		String m="id="+i+"s";
		String m2="<%=pds.gettrue(firstid +"+i+")%></td>";
		String m3="document.getElementById("+i+"s"+").innerHTML";
		System.out.println(i);
	}
}
}

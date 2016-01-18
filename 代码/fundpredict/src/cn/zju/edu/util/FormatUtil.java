package cn.zju.edu.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class FormatUtil {
public static void main(String[] args) throws IOException {
	
	for(int i=1;i<=242;i++)
	{
		String m="<td width="+"100"+" id="+i+"s";
		String m2="<%=pds.gettrue(firstid +"+i+")%></td>";
		String m3="document.getElementById("+i+"s"+").innerHTML";
		int s=+1;
		int r=-1;
		
		System.out.println("'"+i+"'");
	}
	

}
}

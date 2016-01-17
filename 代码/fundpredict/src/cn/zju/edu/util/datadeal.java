package cn.zju.edu.util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class datadeal {
	private static Connection connection;
	PreparedStatement pst = null;
	private static String[] ss = { "002019", "002642", "300104", "300267",
			"300271", "300287", "300324", "300363", "300367", "300392", };// 获取重仓股数据

	public datadeal() {
		connection = (Connection) DataBaseConnection.getConnection();
	}

	public static void main(String[] args) throws SQLException {
		new datadeal();

		insert(ss[0]);

		System.out.println("开始抓取数据……");

	}

	public static void insert(String tablename) throws SQLException {

		Statement s = (Statement) connection.createStatement();
		String sql1 = "select * from stockdata where time BETWEEN '2015-09-01 ' AND '2015-11-30 ' ";
		ResultSet rs = s.executeQuery(sql1);

		while (rs.next()) {

			System.out.println(rs.getString("increase"));
		}
		// double m=Double.parseDouble(rs.getString("increase"))/100;
		// String sql="update stockdata set increase="+m;
		// s.executeUpdate(sql);
	}

}

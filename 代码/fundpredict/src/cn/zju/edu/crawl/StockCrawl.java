package cn.zju.edu.crawl;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import cn.zju.edu.util.Constants;
import cn.zju.edu.util.DataBaseConnection;
import cn.zju.edu.util.URLUtils;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * @author liuxing
 * 
 */
public class StockCrawl {
	private static Connection connection;
	PreparedStatement pst = null;

	public StockCrawl() throws SQLException {
		connection = (Connection) DataBaseConnection.getConnection();
		this.getdata();
		// 开始获取十大重参实时数据
		/* System.out.println(this.getdata()); */

	}

	public int getdata() throws SQLException {
		String[] t = Constants.q;
		for (int m = 0; m <= t.length - 1; m++) {
			this.getdataszangzhengq(t[m]);
		}
		return t.length;
	}

	/* 抓取腾讯财经上的上证新兴产业指数 */
	public String getdataszangzhengq(String stockid) throws SQLException {

		String content = URLUtils.getContent("http://qt.gtimg.cn/q=" + stockid);
		String[] datas = content.split("~");
		if (datas.length <= 1) {
			datas = null;// 当没有基金信息时，返回null。无信息的格式为pv_none_match=1;
		}

		// 根据对照自己对应数据

		Statement s = (Statement) connection.createStatement();
		String m = datas[0].toString().replace("v_" + stockid + "=", stockid)
				.replace("51", "");

		String sql = "insert into stockdata(wz,code,current_price,closeprice_yesterday,openprice_today,times,changes,increase,earnings,total,ricelimit,falllimit) values('"
				+ m.substring(0, m.length() - 1)
				+ "'"
				+ ",'"
				+ datas[1]
				+ "'"
				+ ",'"
				+ datas[2]
				+ "'"
				+ ",'"
				+ datas[3]
				+ "'"
				+ ",'"
				+ datas[4]
				+ "'"
				+ ",'"
				+ datas[5]
				+ "'"
				+ ",'"
				+ datas[6]
				+ "'"
				+ ",'"
				+ datas[7]
				+ "'"
				+ ",'"
				+ datas[8]
				+ "'"
				+ ",'"
				+ datas[9]
				+ "'"
				+ ",'"
				+ datas[10]
				+ "'"
				+ ",'"
				+ datas[11]
				+ "')";
		s.executeUpdate(sql);
		System.out.println("开始抓取数据……");
		return stockid;

	}

	public static void main(String[] args) throws SQLException {

		new StockCrawl();

		// connection.close();

	}
}

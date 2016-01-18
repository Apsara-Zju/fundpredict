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
		// ��ʼ��ȡʮ���ز�ʵʱ����
		/* System.out.println(this.getdata()); */

	}

	public int getdata() throws SQLException {
		String[] t = Constants.q;
		for (int m = 0; m <= t.length - 1; m++) {
			this.getdataszangzhengq(t[m]);
		}
		return t.length;
	}

	/* ץȡ��Ѷ�ƾ��ϵ���֤���˲�ҵָ�� */
	public String getdataszangzhengq(String stockid) throws SQLException {

		String content = URLUtils.getContent("http://qt.gtimg.cn/q=" + stockid);
		String[] datas = content.split("~");
		if (datas.length <= 1) {
			datas = null;// ��û�л�����Ϣʱ������null������Ϣ�ĸ�ʽΪpv_none_match=1;
		}

		// ���ݶ����Լ���Ӧ����

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
		System.out.println("��ʼץȡ���ݡ���");
		return stockid;

	}

	public static void main(String[] args) throws SQLException {

		new StockCrawl();

		// connection.close();

	}
}

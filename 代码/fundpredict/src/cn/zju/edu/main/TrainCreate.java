package cn.zju.edu.main;

import java.sql.SQLException;
import java.util.ArrayList;
import cn.zju.edu.model.Traindata;
import cn.zju.edu.util.Constants;
import cn.zju.edu.util.DataBaseConnection;
import cn.zju.edu.util.DataUtil;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * @author liuxing
 * @category create train data from table Stockdata
 */
public class TrainCreate {
	private Connection conn;
	private static String[] ss = Constants.s;

	public TrainCreate() throws Exception {
		conn = (Connection) DataBaseConnection.getConnection();

	}

//	public void initStockdata(String wz) throws SQLException {
//
//		Iterator<Stockdata> iterators = this.findStockdata(wz).iterator();
//		if (iterators.hasNext()) { // �������һ��ֵ������ѭ��
//			result = iterators.next(); // �õ�����������һ��ֵ ����String����
//			// ������
//		}
//	}
//
//	public String getincrease(String wz) throws SQLException {
//		initStockdata(wz);
//
//		return result.getIncrease();
//	}

	public ArrayList<Traindata> findStockdata(String wzf,String train) {
		
		ArrayList<Traindata> userlist = new ArrayList<Traindata>();
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM traindata where code='" + wzf
				+ "'and time BETWEEN '2015-09-18' and '2015-11-30' limit 42";

		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				Traindata ht = new Traindata();
				ht.setId(rs.getInt("id"));
				ht.setCode(rs.getString("code"));
				ht.setIncrease(rs.getString("increase"));

				/*
				 * System.out.println(ht.getIndex() + "," + ht.getIncrease() +
				 * "," + ht.getClose());
				 */
				DataUtil.newFile("./train"+"/"+train+".txt", ht.getIncrease()
						.toString());
				userlist.add(ht);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}

	public static void main(String[] args) throws Exception {
		TrainCreate hd = new TrainCreate();
		for(int i=1;i<=11;i++){
			DataUtil du = new DataUtil();
			du.deletefile("./train"+"/"+"train"+i+".txt");		
		hd.findStockdata(ss[i-1],"train"+i);
		
		}
		System.out.println("ѵ���ļ�����");
		// System.out.println(hd.getincrease(ss[1]));
	}

}

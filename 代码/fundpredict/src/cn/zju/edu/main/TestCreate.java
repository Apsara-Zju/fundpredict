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
public class TestCreate {
	private Connection conn;
	private static String[] ss = Constants.s;

	public TestCreate() throws Exception {
		conn = (Connection) DataBaseConnection.getConnection();

	}
	/*UPDATE `300267` set time = SUBSTRING_INDEX(time,',',1);
	update `300267` set increase = left(increase,LENGTH(increase)-1);*/
//	public void initStockdata(String wz) throws SQLException {
//
//		Iterator<Stockdata> iterators = this.findStockdata(wz).iterator();
//		if (iterators.hasNext()) { // 如果有下一个值，进入循环
//			result = iterators.next(); // 得到迭代器中下一个值 返回String类型
//			// 输出结果
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
		String sql = "SELECT * FROM testdata where code='" + wzf
				+ "'and time BETWEEN '2015-11-23' and '2015-11-27'";

		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) pstmt.executeQuery();
			while (rs.next()) {
				Traindata ht = new Traindata();
//				ht.setId(rs.getInt("id"));
				ht.setCode(rs.getString("code"));
				ht.setIncrease(rs.getString("increase"));

				/*
				 * System.out.println(ht.getIndex() + "," + ht.getIncrease() +
				 * "," + ht.getClose());
				 */
				DataUtil.newFile("./test"+"/"+train+".txt", ht.getIncrease()
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
		TestCreate hd = new TestCreate();
		for(int i=1;i<=11;i++){
		DataUtil du = new DataUtil();
		du.deletefile("./test"+"/"+"test"+i+".txt");	
		hd.findStockdata(ss[i-1],"test"+i);
		
		}
		System.out.println("测试文件生成");
		// System.out.println(hd.getincrease(ss[1]));
	}

}

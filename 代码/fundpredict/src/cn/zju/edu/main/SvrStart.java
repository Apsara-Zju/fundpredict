package cn.zju.edu.main;

import cn.zju.edu.datasvr.HistorySvr;
import cn.zju.edu.datasvr.StockdataSvr;
import cn.zju.edu.util.DataBaseConnection;

public class SvrStart {
	public static void main(String[] args) throws Exception {
		new HistorySvr();// Ԥ���Ʊ��ʷ����
		new StockdataSvr();// Ԥ���Ʊʵʱ����
		new DataBaseConnection().close();
	}
}

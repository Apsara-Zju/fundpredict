package cn.zju.edu.datasvr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.zju.edu.util.DataBaseConnection;
import cn.zju.edu.util.DataUtil;
import libsvm.svm;
import libsvm.svm_model;
import libsvm.svm_node;
import libsvm.svm_parameter;
import libsvm.svm_problem;

public class HistorySvr {
	public static void main(String[] args) throws Exception {
		new HistorySvr();
	}

	public void createtable() throws SQLException {
		/* ����historyresult�����Ԥ���� */
		String sql = "DROP TABLE IF EXISTS `historyresult`;";
		String sqls = "CREATE TABLE `historyresult` (`id` int(100) NOT NULL AUTO_INCREMENT,truevalue double(100,20) DEFAULT NULL,predictvalue double(100,20) DEFAULT NULL ,PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";
		Connection conn = (Connection) DataBaseConnection.getConnection();
		Statement st = conn.createStatement();
		st.execute(sql);
		st.execute(sqls);
	}

	public void cleartable() throws SQLException {
		Connection conn = (Connection) DataBaseConnection.getConnection();
		Statement st = conn.createStatement();
		st.executeUpdate("delete from historyresult where 1=1");// ������ݿ��ظ�����
		st.execute("ALTER table historyresult AUTO_INCREMENT = 1");// ���ó�ʼ�ֶ�Ϊ1
	}

	public HistorySvr() throws Exception {
		createtable();
		cleartable();
		DataUtil du = new DataUtil();
		du.deletefile("./datasource/historyresult.txt");
		String date1 = "2015-10-12,1";
		String date2 = "2015-10-13,2";
		du.getTrainHistory(date1, 1);
		du.getTestHistory(date2, 242);
		List<Double> label = new ArrayList<Double>();
		List<svm_node[]> nodeSet = new ArrayList<svm_node[]>();
		getData(nodeSet, label, "./datasource/trainHistory.txt");

		int dataRange = nodeSet.get(0).length;
		svm_node[][] datas = new svm_node[nodeSet.size()][dataRange]; // ѵ������������
		for (int i = 0; i < datas.length; i++) {
			for (int j = 0; j < dataRange; j++) {
				datas[i][j] = nodeSet.get(i)[j];
			}
		}
		double[] lables = new double[label.size()]; // a,b ��Ӧ��lable
		for (int i = 0; i < lables.length; i++) {
			lables[i] = label.get(i);
		}
		// ����svm_problem����
		svm_problem problem = new svm_problem();
		problem.l = nodeSet.size(); // ��������
		problem.x = datas; // ѵ����������
		problem.y = lables; // ��Ӧ��lable����
		// ����svm_parameter����
		svm_parameter param = new svm_parameter();
		param.svm_type = svm_parameter.EPSILON_SVR;
		param.kernel_type = svm_parameter.LINEAR;
		param.cache_size = 100;
		param.eps = 0.00001;
		param.C = 1.9;
		// ѵ��SVM����ģ��
		System.out.println(svm.svm_check_parameter(problem, param));
		// �������û�����⣬��svm.svm_check_parameter()��������null,���򷵻�error������
		svm_model model = svm.svm_train(problem, param);
		// svm.svm_train()ѵ����SVM����ģ��
		// ��ȡ��������
		List<Double> testlabel = new ArrayList<Double>();
		List<svm_node[]> testnodeSet = new ArrayList<svm_node[]>();
		getData(testnodeSet, testlabel, "./datasource/testHistory.txt");
		svm_node[][] testdatas = new svm_node[testnodeSet.size()][dataRange]; // ѵ������������
		for (int i = 0; i < testdatas.length; i++) {
			for (int j = 0; j < dataRange; j++) {
				testdatas[i][j] = testnodeSet.get(i)[j];
			}
		}
		double[] testlables = new double[testlabel.size()]; // a,b ��Ӧ��lable
		for (int i = 0; i < testlables.length; i++) {
			testlables[i] = testlabel.get(i);
		}
		// Ԥ��������ݵ�lable
		double err = 0.0;
		for (int i = 0; i < testdatas.length; i++) {
			double truevalue = testlables[i];
			System.out.print("��ʵֵ��" + truevalue + " ");
			double predictValue = svm.svm_predict(model, testdatas[i]);
			System.out.println("Ԥ��ֵ��" + predictValue);
			err += Math.abs(predictValue - truevalue);
			Connection conns = (Connection) DataBaseConnection.getConnection();
			Statement sts = conns.createStatement();
			sts.executeUpdate("insert into historyresult(truevalue,predictvalue) values('"
					+ truevalue + "'" + "," + "'" + predictValue + "');");

			DataUtil.newFile("./datasource/historyresult.txt", "��ʵֵ��"
					+ truevalue + " " + "Ԥ��ֵ��" + predictValue + " " + "err="
					+ err);
		}
		/* System.out.println("err=" + err / datas.length); */

	}

	public static void getData(List<svm_node[]> nodeSet, List<Double> label,
			String filename) {
		try {
			FileReader fr = new FileReader(new File(filename));
			@SuppressWarnings("resource")
			BufferedReader br = new BufferedReader(fr);
			String line = null;
			while ((line = br.readLine()) != null) {
				String[] datas = line.split(",");
				svm_node[] vector = new svm_node[datas.length - 1];
				for (int i = 0; i < datas.length - 1; i++) {
					svm_node node = new svm_node();
					node.index = i + 1;
					node.value = Double.parseDouble(datas[i]);
					vector[i] = node;
				}
				nodeSet.add(vector);
				double lablevalue = Double.parseDouble(datas[datas.length - 1]);// ��ѵ���������һ����Ϊlable
				label.add(lablevalue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
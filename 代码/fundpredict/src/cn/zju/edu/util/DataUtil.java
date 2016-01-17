package cn.zju.edu.util;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

import cn.zju.edu.dao.HistoryDao;
import cn.zju.edu.dao.StockdataDao;

public class DataUtil {
	/*
	 * private static Statement st; private static Statement sts;
	 * 
	 * public static void main(String[] args) throws SQLException, Exception {
	 * new DataUtil().getTrain("2015-10-12,1", 1); new
	 * DataUtil().getTest("2015-10-13,2", 242); }
	 */
	/*
	 * public DataUtil() throws Exception { ɾ���ظ��ļ�
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
	public void deletefile(String path) {
		File file = new File(path);

		delFile(file.getAbsolutePath());
		delEmptyPath(file.getParent());
	}

	private final int sc = Constants.q.length;

	public static void delFile(String path) {
		File file = new File(path);
		if (file.exists() && file.isFile()) {
			file.delete();
		} else if (file.exists() && file.isDirectory()) {
			File[] files = file.listFiles();
			if (files != null) {
				for (File f : files) {
					if (f != null) {
						delFile(f.getAbsolutePath());
					}
				}
			}
		}
	}

	public static void delEmptyPath(String path) {
		File file = new File(path);
		if (file.exists() && file.isDirectory()) {
			File[] files = file.listFiles();
			if (files != null && files.length > 0)
				return;
			if (file.delete()) {
				delEmptyPath(file.getParent());
			}
		}
	}

	// ��ȡ��ʷ����ѵ����
	public void getTrainHistory(String date1, int id1) throws Exception {
		deletefile("./datasource/trainHistory.txt");
		HistoryDao hd = new HistoryDao();
		double[][] b = new double[12][5];

		for (int i = 0; i <= 11; i++) {
			for (int j = 0; j <= 4; j++) {
				b[i][j] = Float.parseFloat(hd.getincrease(date1,
						(5 * i + j + id1)));
				System.out.println(b[i][j]);
				// ����2015��10��12�յ��Ƿ��������ѵ��

			}

		}
		for (int t = 0; t <= 11; t++) {
			newFile("./datasource/trainHistory.txt", b[t][0] + "," + b[t][1]
					+ "," + b[t][2] + "," + b[t][3] + "," + b[t][4]);
		}

	}

	// ��ȡ��ʷ���ݲ��Լ�
	public void getTestHistory(String date2, int id2) throws Exception {
		deletefile("./datasource/testHistory.txt");
		HistoryDao hd = new HistoryDao();

		double[][] b = new double[12][5];

		for (int i = 0; i <= 11; i++) {
			for (int j = 0; j <= 4; j++) {
				b[i][j] = Float.parseFloat(hd.getincrease(date2,
						(5 * i + j + id2)));
				System.out.println(b[i][j]);
				;// ����2015��10��13�յ��Ƿ��������ѵ��

			}

		}
		for (int t = 0; t <= 11; t++) {
			newFile("./datasource/testHistory.txt", b[t][0] + "," + b[t][1]
					+ "," + b[t][2] + "," + b[t][3] + "," + b[t][4]);
		}

	}

	// ��ȡʵʱ����ѵ����
	/*
	 * public void getTrainStockdata(String wz1, int id1) throws Exception {
	 * deletefile("./datasource/trainStockdata.txt"); StockdataDao sdd = new
	 * StockdataDao();
	 * 
	 * double[][] b = new double[12][5];
	 * 
	 * for (int i = 0; i <= 11; i++) { for (int j = 0; j <= 4; j++) { int t1 =
	 * sc * (5 * i + j) + id1;// ����id�������±���ƵĹ��� b[i][j] =
	 * Double.parseDouble(sdd.getincrease(wz1, t1));
	 * System.out.println(b[i][j]); // ����2015��10��12�յ��Ƿ��������ѵ��
	 * 
	 * }
	 * 
	 * } for (int t = 0; t <= 11; t++) {
	 * newFile("./datasource/trainStockdata.txt", b[t][0] + "," + b[t][1] + ","
	 * + b[t][2] + "," + b[t][3] + "," + b[t][4]); }
	 * 
	 * }
	 * 
	 * // ��ȡʵʱ���ݲ��Լ� public void getTestStockdata(String wz2, int id2) throws
	 * Exception { deletefile("./datasource/testStockdata.txt"); StockdataDao
	 * sdd = new StockdataDao(); double[][] b = new double[12][5]; for (int i =
	 * 0; i <= 11; i++) { for (int j = 0; j <= 4; j++) { int t2 = sc * (5 * i +
	 * j) + id2;// ����id�������±���ƵĹ��� b[i][j] =
	 * Double.parseDouble(sdd.getincrease(wz2, t2));
	 * System.out.println(b[i][j]); // ����2015��10��12�յ��Ƿ��������ѵ��
	 * 
	 * }
	 * 
	 * } for (int t = 0; t <= 11; t++) {
	 * newFile("./datasource/testStockdata.txt", b[t][0] + "," + b[t][1] + "," +
	 * b[t][2] + "," + b[t][3] + "," + b[t][4]); }
	 * 
	 * }
	 */
	public static void newFile(String filePathAndName, String fileContent) {
		try {

			File myFilePath = new File(filePathAndName.toString());
			if (!myFilePath.exists()) { // ������ļ�������,�򴴽�
				myFilePath.createNewFile();
			}
			// FileWriter(myFilePath, true); ʵ�ֲ�����׷�ӵ��ļ���

			// FileWriter(myFilePath); ���ǵ�ԭ��������

			FileWriter resultFile = new FileWriter(myFilePath, true);

			PrintWriter myFile = new PrintWriter(resultFile);

			// ���ļ�����д����,ԭ���ĻḲ�ǵ�
			myFile.println(fileContent);

			resultFile.close();

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}

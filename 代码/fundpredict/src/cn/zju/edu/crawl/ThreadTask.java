package cn.zju.edu.crawl;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.TimerTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadTask extends TimerTask {

	@SuppressWarnings("unused")
	private static ThreadPoolExecutor threadPool = new ThreadPoolExecutor(150,
			150, 3, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());

	@Override
	public void run() {

		try {

			Calendar c = Calendar.getInstance();
			if (c.get(Calendar.HOUR_OF_DAY) > 6
					&& c.get(Calendar.HOUR_OF_DAY) < 21
					&& (c.get(Calendar.DAY_OF_WEEK) > 1 && c
							.get(Calendar.DAY_OF_WEEK) < 7)) {// ʱ����ƣ������չ�����Ϣ
				new StockCrawl();// ����������

			} else {
				System.out.println("�Բ��𣬹����ѹرա���");
				System.exit(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

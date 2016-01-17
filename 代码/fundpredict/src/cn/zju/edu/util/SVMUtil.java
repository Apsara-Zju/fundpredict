package cn.zju.edu.util;

import java.io.File;

import weka.classifiers.Classifier;
import weka.classifiers.functions.LibSVM;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ConverterUtils.DataSink;
import weka.experiment.InstanceQuery;
import weka.filters.unsupervised.attribute.Discretize;

public class SVMUtil {
	public boolean getdata() throws Exception {
		InstanceQuery querys = new InstanceQuery();
		querys.setDatabaseURL("jdbc:mysql://localhost:3306/test");
		querys.setUsername("root");
		querys.setPassword("");
		querys.setQuery("SELECT `Open`,Highest,Lowest,`Close`, `Change`,Increase,Amplitude,HandsAll,Money from history where Increase>=0.1;");

		Instances datas = querys.retrieveInstances();
		datas.setClassIndex(0); // ���÷������������кţ���һ��Ϊ0�ţ�,instancesTest.numAttributes()����ȡ����������
		datas.setClassIndex(0);
		Discretize discretizes = new Discretize();
		String[] optiond = new String[6];
		optiond[0] = "-B";
		optiond[1] = "8";
		optiond[2] = "-M";
		optiond[3] = "-1.0";
		optiond[4] = "-R";
		optiond[5] = "2-last";
		discretizes.setOptions(optiond);
		discretizes.setInputFormat(datas);
		DataSink.write("E://svm.arff", datas);
		return true;
	}

	public double getAccuracy() throws Exception {

		File inputFiles = new File("E://svm.arff");// ѵ�������ļ�

		ArffLoader atfs = new ArffLoader();

		atfs.setFile(inputFiles);

		Instances instancesTrains = atfs.getDataSet(); // ��������ļ�

		instancesTrains.setClassIndex(0); // ���÷������������кţ���һ��Ϊ0�ţ�,instancesTest.numAttributes()����ȡ����������

		double sums = instancesTrains.numInstances(), // ��������ʵ����

		rights = 0.0f;

		Classifier m_classifiers = new LibSVM();
		m_classifiers.buildClassifier(instancesTrains); // ѵ��

		for (int i = 0; i < sums; i++)// ���Է�����

		{
			if (m_classifiers.classifyInstance(instancesTrains.instance(i)) == instancesTrains
					.instance(i).classValue())// ���Ԥ��ֵ�ʹ�ֵ��ȣ����������еķ������ṩ����Ϊ��ȷ��,����������壩
			{

				rights++;// ��ȷֵ��1
			}

		}

		return rights / sums;

	}

	public static void main(String[] args) throws Exception {

		System.out.println(new SVMUtil().getAccuracy());
	}
}

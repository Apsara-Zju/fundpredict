package cn.zju.edu.util;

import java.io.File;

import weka.classifiers.Classifier;
import weka.classifiers.trees.J48;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ConverterUtils.DataSink;
import weka.experiment.InstanceQuery;
import weka.filters.unsupervised.attribute.Discretize;

public class J48Util {
	public boolean getdata() throws Exception {
		InstanceQuery query = new InstanceQuery();
		query.setDatabaseURL("jdbc:mysql://localhost:3306/test");
		query.setUsername("root");
		query.setPassword("");
		query.setQuery("SELECT `Open`,Highest,Lowest,`Close`, `Change`,Increase,Amplitude,HandsAll,Money from history where Increase>=0.1;");

		Instances data = query.retrieveInstances();
		data.setClassIndex(0); // ���÷������������кţ���һ��Ϊ0�ţ�,instancesTest.numAttributes()����ȡ����������
		data.setClassIndex(0);
		Discretize discretize = new Discretize();
		String[] options = new String[6];
		options[0] = "-B";
		options[1] = "8";
		options[2] = "-M";
		options[3] = "-1.0";
		options[4] = "-R";
		options[5] = "2-last";
		discretize.setOptions(options);
		discretize.setInputFormat(data);
		DataSink.write("C://j48.arff", data);
		return true;
	}

	public double getAccuracy() throws Exception {

		File inputFile = new File("C://j48.arff");// ѵ�������ļ�

		ArffLoader atf = new ArffLoader();

		atf.setFile(inputFile);

		Instances instancesTrain = atf.getDataSet(); // ��������ļ�

		instancesTrain.setClassIndex(0); // ���÷������������кţ���һ��Ϊ0�ţ�,instancesTest.numAttributes()����ȡ����������

		double sum = instancesTrain.numInstances(), // ��������ʵ����

		right = 0.0f;

		Classifier m_classifier = new J48();

		m_classifier.buildClassifier(instancesTrain); // ѵ��

		for (int i = 0; i < sum; i++)// ���Է�����

		{
			if (m_classifier.classifyInstance(instancesTrain.instance(i)) == instancesTrain
					.instance(i).classValue())// ���Ԥ��ֵ�ʹ�ֵ��ȣ����������еķ������ṩ����Ϊ��ȷ��,����������壩
			{

				right++;// ��ȷֵ��1
			}

		}

		return right / sum;
	}

	public static void main(String[] args) throws Exception {
		System.out.println(new J48Util().getAccuracy());
	}
}

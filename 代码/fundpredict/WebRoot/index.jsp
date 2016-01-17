<%@page import="cn.zju.edu.datasvr.HistorySvr"%>
<%@page import="cn.zju.edu.datasvr.StockdataSvr"%>
<%@ page language="java"
	import="java.util.*, java.sql.*,java.io.File,

weka.classifiers.Classifier,
weka.classifiers.trees.J48,
weka.core.Instances,
cn.zju.edu.dao.HistoryDao,
cn.zju.edu.model.History,
cn.zju.edu.util.J48Util,
cn.zju.edu.util.SVMUtil,
weka.core.converters.ArffLoader,
weka.classifiers.functions.LibSVM,
weka.experiment.InstanceQuery,
weka.core.converters.ConverterUtils.DataSink,
weka.filters.Filter,
weka.filters.unsupervised.attribute.AddID,
weka.filters.unsupervised.attribute.Discretize;"
	pageEncoding="gb2312"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<title>FinaceDataView</title>
<script src="./Chart.js" type="text/javascript"></script>
<meta name="viewport" content="initial-scale = 1, user-scalable = no">
<style type="text/css">
canvas {
	
}

#main {
	width: 960px;
	height: auto;
}

#left {
	width: 250px;
	height: 600px;
}

#right {
	width: 2000px;
	height: 600px;
}

#left,#right {
	float: left;
}
</style>
</head>

<body>


	<input type="submit" name="Submit" value="ͼ1" onClick="searchbar1();" />
	<input type="submit" name="Submit" value="ͼ2" onClick="searchbar2();" />
	<input type="submit" name="Submit" value="ͼ3"
		onClick="searchbar3();" />
	<input type="submit" name="Submit" value="ͼ4"
		onClick="searchbar4();" />
<input type="submit" name="Submit" value="ͼ5" onClick="searchbar5();" />
	<script type="text/javascript">
		function searchbar1() {
			window.location.href = "./data1.jsp"
		}
		function searchbar2() {
			window.location.href = "./data2.jsp"
		}function searchbar3() {
			window.location.href = "./data3.jsp"
		}function searchbar4() {
			window.location.href = "./data4.jsp"
		}function searchbar5() {
			window.location.href = "./data5.jsp"
		}

		
	</script>
</body>
</html>


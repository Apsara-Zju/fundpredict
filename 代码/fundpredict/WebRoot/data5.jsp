<%@page import="cn.zju.edu.datasvr.StockdataSvr"%>
<%@page import="cn.zju.edu.main.CrawlStart"%>
<%@page import="cn.zju.edu.crawl.StockCrawl"%>
<%@page import="cn.zju.edu.util.Constants"%>
<%@page import="cn.zju.edu.dao.StockdataDao"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,java.io.File,cn.zju.edu.dao.PredictHistoryDao,cn.zju.edu.model.Predict,weka.classifiers.Classifier,weka.classifiers.trees.J48,cn.zju.edu.dao.PredictHistoryDao,cn.zju.edu.dao.PredictStokcdataDao,weka.core.Instances,weka.core.converters.ArffLoader,weka.classifiers.functions.LibSVM,weka.experiment.InstanceQuery,cn.zju.edu.util.DataBaseConnection,weka.core.converters.ConverterUtils.DataSink;"
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
<script src="./Chart.js"></script>
<meta name="viewport" content="initial-scale = 1, user-scalable = no">
<style>
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

	<div style="width:48%">
		<div>
			<canvas id="canvas" height="512" width="512"></canvas>
		</div>
	</div>


	<%
		PredictStokcdataDao pds = new PredictStokcdataDao();
	int fifthid = 0+242+242+242+242;
	%>



	<table border="2" width="60%" id="mytable" style="display:none;">

		<!-- 比较股票在2015-10-12,1和2015-10-13,2这两个不同时间段的行情指数 -->

		<tr>
			<td width="100" id="1"><%=pds.gettrue(fifthid + 1)%></td>
			<td width="100" id="2"><%=pds.gettrue(fifthid + 2)%></td>
			<td width="100" id="3"><%=pds.gettrue(fifthid + 3)%></td>
			<td width="100" id="4"><%=pds.gettrue(fifthid + 4)%></td>
			<td width="100" id="5"><%=pds.gettrue(fifthid + 5)%></td>
			<td width="100" id="6"><%=pds.gettrue(fifthid + 6)%></td>
			<td width="100" id="7"><%=pds.gettrue(fifthid + 7)%></td>
			<td width="100" id="8"><%=pds.gettrue(fifthid + 8)%></td>
			<td width="100" id="9"><%=pds.gettrue(fifthid + 9)%></td>
			<td width="100" id="10"><%=pds.gettrue(fifthid + 10)%></td>
			<td width="100" id="11"><%=pds.gettrue(fifthid + 11)%></td>
			<td width="100" id="12"><%=pds.gettrue(fifthid + 12)%></td>
			<td width="100" id="13"><%=pds.gettrue(fifthid + 13)%></td>
			<td width="100" id="14"><%=pds.gettrue(fifthid + 14)%></td>
			<td width="100" id="15"><%=pds.gettrue(fifthid + 15)%></td>
			<td width="100" id="16"><%=pds.gettrue(fifthid + 16)%></td>
			<td width="100" id="17"><%=pds.gettrue(fifthid + 17)%></td>
			<td width="100" id="18"><%=pds.gettrue(fifthid + 18)%></td>
			<td width="100" id="19"><%=pds.gettrue(fifthid + 19)%></td>
			<td width="100" id="20"><%=pds.gettrue(fifthid + 20)%></td>
			<td width="100" id="21"><%=pds.gettrue(fifthid + 21)%></td>
			<td width="100" id="22"><%=pds.gettrue(fifthid + 22)%></td>
			<td width="100" id="23"><%=pds.gettrue(fifthid + 23)%></td>
			<td width="100" id="24"><%=pds.gettrue(fifthid + 24)%></td>
			<td width="100" id="25"><%=pds.gettrue(fifthid + 25)%></td>
			<td width="100" id="26"><%=pds.gettrue(fifthid + 26)%></td>
			<td width="100" id="27"><%=pds.gettrue(fifthid + 27)%></td>
			<td width="100" id="28"><%=pds.gettrue(fifthid + 28)%></td>
			<td width="100" id="29"><%=pds.gettrue(fifthid + 29)%></td>
			<td width="100" id="30"><%=pds.gettrue(fifthid + 30)%></td>
			<td width="100" id="31"><%=pds.gettrue(fifthid + 31)%></td>
			<td width="100" id="32"><%=pds.gettrue(fifthid + 32)%></td>
			<td width="100" id="33"><%=pds.gettrue(fifthid + 33)%></td>
			<td width="100" id="34"><%=pds.gettrue(fifthid + 34)%></td>
			<td width="100" id="35"><%=pds.gettrue(fifthid + 35)%></td>
			<td width="100" id="36"><%=pds.gettrue(fifthid + 36)%></td>
			<td width="100" id="37"><%=pds.gettrue(fifthid + 37)%></td>
			<td width="100" id="38"><%=pds.gettrue(fifthid + 38)%></td>
			<td width="100" id="39"><%=pds.gettrue(fifthid + 39)%></td>
			<td width="100" id="40"><%=pds.gettrue(fifthid + 40)%></td>
			<td width="100" id="41"><%=pds.gettrue(fifthid + 41)%></td>
			<td width="100" id="42"><%=pds.gettrue(fifthid + 42)%></td>
			<td width="100" id="43"><%=pds.gettrue(fifthid + 43)%></td>
			<td width="100" id="44"><%=pds.gettrue(fifthid + 44)%></td>
			<td width="100" id="45"><%=pds.gettrue(fifthid + 45)%></td>
			<td width="100" id="46"><%=pds.gettrue(fifthid + 46)%></td>
			<td width="100" id="47"><%=pds.gettrue(fifthid + 47)%></td>
			<td width="100" id="48"><%=pds.gettrue(fifthid + 48)%></td>
			<td width="100" id="49"><%=pds.gettrue(fifthid + 49)%></td>
			<td width="100" id="50"><%=pds.gettrue(fifthid + 50)%></td>
			<td width="100" id="51"><%=pds.gettrue(fifthid + 51)%></td>
			<td width="100" id="52"><%=pds.gettrue(fifthid + 52)%></td>
			<td width="100" id="53"><%=pds.gettrue(fifthid + 53)%></td>
			<td width="100" id="54"><%=pds.gettrue(fifthid + 54)%></td>
			<td width="100" id="55"><%=pds.gettrue(fifthid + 55)%></td>
			<td width="100" id="56"><%=pds.gettrue(fifthid + 56)%></td>
			<td width="100" id="57"><%=pds.gettrue(fifthid + 57)%></td>
			<td width="100" id="58"><%=pds.gettrue(fifthid + 58)%></td>
			<td width="100" id="59"><%=pds.gettrue(fifthid + 59)%></td>
			<td width="100" id="60"><%=pds.gettrue(fifthid + 60)%></td>
			<td width="100" id="61"><%=pds.gettrue(fifthid + 61)%></td>
			<td width="100" id="62"><%=pds.gettrue(fifthid + 62)%></td>
			<td width="100" id="63"><%=pds.gettrue(fifthid + 63)%></td>
			<td width="100" id="64"><%=pds.gettrue(fifthid + 64)%></td>
			<td width="100" id="65"><%=pds.gettrue(fifthid + 65)%></td>
			<td width="100" id="66"><%=pds.gettrue(fifthid + 66)%></td>
			<td width="100" id="67"><%=pds.gettrue(fifthid + 67)%></td>
			<td width="100" id="68"><%=pds.gettrue(fifthid + 68)%></td>
			<td width="100" id="69"><%=pds.gettrue(fifthid + 69)%></td>
			<td width="100" id="70"><%=pds.gettrue(fifthid + 70)%></td>
			<td width="100" id="71"><%=pds.gettrue(fifthid + 71)%></td>
			<td width="100" id="72"><%=pds.gettrue(fifthid + 72)%></td>
			<td width="100" id="73"><%=pds.gettrue(fifthid + 73)%></td>
			<td width="100" id="74"><%=pds.gettrue(fifthid + 74)%></td>
			<td width="100" id="75"><%=pds.gettrue(fifthid + 75)%></td>
			<td width="100" id="76"><%=pds.gettrue(fifthid + 76)%></td>
			<td width="100" id="77"><%=pds.gettrue(fifthid + 77)%></td>
			<td width="100" id="78"><%=pds.gettrue(fifthid + 78)%></td>
			<td width="100" id="79"><%=pds.gettrue(fifthid + 79)%></td>
			<td width="100" id="80"><%=pds.gettrue(fifthid + 80)%></td>
			<td width="100" id="81"><%=pds.gettrue(fifthid + 81)%></td>
			<td width="100" id="82"><%=pds.gettrue(fifthid + 82)%></td>
			<td width="100" id="83"><%=pds.gettrue(fifthid + 83)%></td>
			<td width="100" id="84"><%=pds.gettrue(fifthid + 84)%></td>
			<td width="100" id="85"><%=pds.gettrue(fifthid + 85)%></td>
			<td width="100" id="86"><%=pds.gettrue(fifthid + 86)%></td>
			<td width="100" id="87"><%=pds.gettrue(fifthid + 87)%></td>
			<td width="100" id="88"><%=pds.gettrue(fifthid + 88)%></td>
			<td width="100" id="89"><%=pds.gettrue(fifthid + 89)%></td>
			<td width="100" id="90"><%=pds.gettrue(fifthid + 90)%></td>
			<td width="100" id="91"><%=pds.gettrue(fifthid + 91)%></td>
			<td width="100" id="92"><%=pds.gettrue(fifthid + 92)%></td>
			<td width="100" id="93"><%=pds.gettrue(fifthid + 93)%></td>
			<td width="100" id="94"><%=pds.gettrue(fifthid + 94)%></td>
			<td width="100" id="95"><%=pds.gettrue(fifthid + 95)%></td>
			<td width="100" id="96"><%=pds.gettrue(fifthid + 96)%></td>
			<td width="100" id="97"><%=pds.gettrue(fifthid + 97)%></td>
			<td width="100" id="98"><%=pds.gettrue(fifthid + 98)%></td>
			<td width="100" id="99"><%=pds.gettrue(fifthid + 99)%></td>
			<td width="100" id="100"><%=pds.gettrue(fifthid + 100)%></td>
			<td width="100" id="101"><%=pds.gettrue(fifthid + 101)%></td>
			<td width="100" id="102"><%=pds.gettrue(fifthid + 102)%></td>
			<td width="100" id="103"><%=pds.gettrue(fifthid + 103)%></td>
			<td width="100" id="104"><%=pds.gettrue(fifthid + 104)%></td>
			<td width="100" id="105"><%=pds.gettrue(fifthid + 105)%></td>
			<td width="100" id="106"><%=pds.gettrue(fifthid + 106)%></td>
			<td width="100" id="107"><%=pds.gettrue(fifthid + 107)%></td>
			<td width="100" id="108"><%=pds.gettrue(fifthid + 108)%></td>
			<td width="100" id="109"><%=pds.gettrue(fifthid + 109)%></td>
			<td width="100" id="110"><%=pds.gettrue(fifthid + 110)%></td>
			<td width="100" id="111"><%=pds.gettrue(fifthid + 111)%></td>
			<td width="100" id="112"><%=pds.gettrue(fifthid + 112)%></td>
			<td width="100" id="113"><%=pds.gettrue(fifthid + 113)%></td>
			<td width="100" id="114"><%=pds.gettrue(fifthid + 114)%></td>
			<td width="100" id="115"><%=pds.gettrue(fifthid + 115)%></td>
			<td width="100" id="116"><%=pds.gettrue(fifthid + 116)%></td>
			<td width="100" id="117"><%=pds.gettrue(fifthid + 117)%></td>
			<td width="100" id="118"><%=pds.gettrue(fifthid + 118)%></td>
			<td width="100" id="119"><%=pds.gettrue(fifthid + 119)%></td>
			<td width="100" id="120"><%=pds.gettrue(fifthid + 120)%></td>
			<td width="100" id="121"><%=pds.gettrue(fifthid + 121)%></td>
			<td width="100" id="122"><%=pds.gettrue(fifthid + 122)%></td>
			<td width="100" id="123"><%=pds.gettrue(fifthid + 123)%></td>
			<td width="100" id="124"><%=pds.gettrue(fifthid + 124)%></td>
			<td width="100" id="125"><%=pds.gettrue(fifthid + 125)%></td>
			<td width="100" id="126"><%=pds.gettrue(fifthid + 126)%></td>
			<td width="100" id="127"><%=pds.gettrue(fifthid + 127)%></td>
			<td width="100" id="128"><%=pds.gettrue(fifthid + 128)%></td>
			<td width="100" id="129"><%=pds.gettrue(fifthid + 129)%></td>
			<td width="100" id="130"><%=pds.gettrue(fifthid + 130)%></td>
			<td width="100" id="131"><%=pds.gettrue(fifthid + 131)%></td>
			<td width="100" id="132"><%=pds.gettrue(fifthid + 132)%></td>
			<td width="100" id="133"><%=pds.gettrue(fifthid + 133)%></td>
			<td width="100" id="134"><%=pds.gettrue(fifthid + 134)%></td>
			<td width="100" id="135"><%=pds.gettrue(fifthid + 135)%></td>
			<td width="100" id="136"><%=pds.gettrue(fifthid + 136)%></td>
			<td width="100" id="137"><%=pds.gettrue(fifthid + 137)%></td>
			<td width="100" id="138"><%=pds.gettrue(fifthid + 138)%></td>
			<td width="100" id="139"><%=pds.gettrue(fifthid + 139)%></td>
			<td width="100" id="140"><%=pds.gettrue(fifthid + 140)%></td>
			<td width="100" id="141"><%=pds.gettrue(fifthid + 141)%></td>
			<td width="100" id="142"><%=pds.gettrue(fifthid + 142)%></td>
			<td width="100" id="143"><%=pds.gettrue(fifthid + 143)%></td>
			<td width="100" id="144"><%=pds.gettrue(fifthid + 144)%></td>
			<td width="100" id="145"><%=pds.gettrue(fifthid + 145)%></td>
			<td width="100" id="146"><%=pds.gettrue(fifthid + 146)%></td>
			<td width="100" id="147"><%=pds.gettrue(fifthid + 147)%></td>
			<td width="100" id="148"><%=pds.gettrue(fifthid + 148)%></td>
			<td width="100" id="149"><%=pds.gettrue(fifthid + 149)%></td>
			<td width="100" id="150"><%=pds.gettrue(fifthid + 150)%></td>
			<td width="100" id="151"><%=pds.gettrue(fifthid + 151)%></td>
			<td width="100" id="152"><%=pds.gettrue(fifthid + 152)%></td>
			<td width="100" id="153"><%=pds.gettrue(fifthid + 153)%></td>
			<td width="100" id="154"><%=pds.gettrue(fifthid + 154)%></td>
			<td width="100" id="155"><%=pds.gettrue(fifthid + 155)%></td>
			<td width="100" id="156"><%=pds.gettrue(fifthid + 156)%></td>
			<td width="100" id="157"><%=pds.gettrue(fifthid + 157)%></td>
			<td width="100" id="158"><%=pds.gettrue(fifthid + 158)%></td>
			<td width="100" id="159"><%=pds.gettrue(fifthid + 159)%></td>
			<td width="100" id="160"><%=pds.gettrue(fifthid + 160)%></td>
			<td width="100" id="161"><%=pds.gettrue(fifthid + 161)%></td>
			<td width="100" id="162"><%=pds.gettrue(fifthid + 162)%></td>
			<td width="100" id="163"><%=pds.gettrue(fifthid + 163)%></td>
			<td width="100" id="164"><%=pds.gettrue(fifthid + 164)%></td>
			<td width="100" id="165"><%=pds.gettrue(fifthid + 165)%></td>
			<td width="100" id="166"><%=pds.gettrue(fifthid + 166)%></td>
			<td width="100" id="167"><%=pds.gettrue(fifthid + 167)%></td>
			<td width="100" id="168"><%=pds.gettrue(fifthid + 168)%></td>
			<td width="100" id="169"><%=pds.gettrue(fifthid + 169)%></td>
			<td width="100" id="170"><%=pds.gettrue(fifthid + 170)%></td>
			<td width="100" id="171"><%=pds.gettrue(fifthid + 171)%></td>
			<td width="100" id="172"><%=pds.gettrue(fifthid + 172)%></td>
			<td width="100" id="173"><%=pds.gettrue(fifthid + 173)%></td>
			<td width="100" id="174"><%=pds.gettrue(fifthid + 174)%></td>
			<td width="100" id="175"><%=pds.gettrue(fifthid + 175)%></td>
			<td width="100" id="176"><%=pds.gettrue(fifthid + 176)%></td>
			<td width="100" id="177"><%=pds.gettrue(fifthid + 177)%></td>
			<td width="100" id="178"><%=pds.gettrue(fifthid + 178)%></td>
			<td width="100" id="179"><%=pds.gettrue(fifthid + 179)%></td>
			<td width="100" id="180"><%=pds.gettrue(fifthid + 180)%></td>
			<td width="100" id="181"><%=pds.gettrue(fifthid + 181)%></td>
			<td width="100" id="182"><%=pds.gettrue(fifthid + 182)%></td>
			<td width="100" id="183"><%=pds.gettrue(fifthid + 183)%></td>
			<td width="100" id="184"><%=pds.gettrue(fifthid + 184)%></td>
			<td width="100" id="185"><%=pds.gettrue(fifthid + 185)%></td>
			<td width="100" id="186"><%=pds.gettrue(fifthid + 186)%></td>
			<td width="100" id="187"><%=pds.gettrue(fifthid + 187)%></td>
			<td width="100" id="188"><%=pds.gettrue(fifthid + 188)%></td>
			<td width="100" id="189"><%=pds.gettrue(fifthid + 189)%></td>
			<td width="100" id="190"><%=pds.gettrue(fifthid + 190)%></td>
			<td width="100" id="191"><%=pds.gettrue(fifthid + 191)%></td>
			<td width="100" id="192"><%=pds.gettrue(fifthid + 192)%></td>
			<td width="100" id="193"><%=pds.gettrue(fifthid + 193)%></td>
			<td width="100" id="194"><%=pds.gettrue(fifthid + 194)%></td>
			<td width="100" id="195"><%=pds.gettrue(fifthid + 195)%></td>
			<td width="100" id="196"><%=pds.gettrue(fifthid + 196)%></td>
			<td width="100" id="197"><%=pds.gettrue(fifthid + 197)%></td>
			<td width="100" id="198"><%=pds.gettrue(fifthid + 198)%></td>
			<td width="100" id="199"><%=pds.gettrue(fifthid + 199)%></td>
			<td width="100" id="200"><%=pds.gettrue(fifthid + 200)%></td>
			<td width="100" id="201"><%=pds.gettrue(fifthid + 201)%></td>
			<td width="100" id="202"><%=pds.gettrue(fifthid + 202)%></td>
			<td width="100" id="203"><%=pds.gettrue(fifthid + 203)%></td>
			<td width="100" id="204"><%=pds.gettrue(fifthid + 204)%></td>
			<td width="100" id="205"><%=pds.gettrue(fifthid + 205)%></td>
			<td width="100" id="206"><%=pds.gettrue(fifthid + 206)%></td>
			<td width="100" id="207"><%=pds.gettrue(fifthid + 207)%></td>
			<td width="100" id="208"><%=pds.gettrue(fifthid + 208)%></td>
			<td width="100" id="209"><%=pds.gettrue(fifthid + 209)%></td>
			<td width="100" id="210"><%=pds.gettrue(fifthid + 210)%></td>
			<td width="100" id="211"><%=pds.gettrue(fifthid + 211)%></td>
			<td width="100" id="212"><%=pds.gettrue(fifthid + 212)%></td>
			<td width="100" id="213"><%=pds.gettrue(fifthid + 213)%></td>
			<td width="100" id="214"><%=pds.gettrue(fifthid + 214)%></td>
			<td width="100" id="215"><%=pds.gettrue(fifthid + 215)%></td>
			<td width="100" id="216"><%=pds.gettrue(fifthid + 216)%></td>
			<td width="100" id="217"><%=pds.gettrue(fifthid + 217)%></td>
			<td width="100" id="218"><%=pds.gettrue(fifthid + 218)%></td>
			<td width="100" id="219"><%=pds.gettrue(fifthid + 219)%></td>
			<td width="100" id="220"><%=pds.gettrue(fifthid + 220)%></td>
			<td width="100" id="221"><%=pds.gettrue(fifthid + 221)%></td>
			<td width="100" id="222"><%=pds.gettrue(fifthid + 222)%></td>
			<td width="100" id="223"><%=pds.gettrue(fifthid + 223)%></td>
			<td width="100" id="224"><%=pds.gettrue(fifthid + 224)%></td>
			<td width="100" id="225"><%=pds.gettrue(fifthid + 225)%></td>
			<td width="100" id="226"><%=pds.gettrue(fifthid + 226)%></td>
			<td width="100" id="227"><%=pds.gettrue(fifthid + 227)%></td>
			<td width="100" id="228"><%=pds.gettrue(fifthid + 228)%></td>
			<td width="100" id="229"><%=pds.gettrue(fifthid + 229)%></td>
			<td width="100" id="230"><%=pds.gettrue(fifthid + 230)%></td>
			<td width="100" id="231"><%=pds.gettrue(fifthid + 231)%></td>
			<td width="100" id="232"><%=pds.gettrue(fifthid + 232)%></td>
			<td width="100" id="233"><%=pds.gettrue(fifthid + 233)%></td>
			<td width="100" id="234"><%=pds.gettrue(fifthid + 234)%></td>
			<td width="100" id="235"><%=pds.gettrue(fifthid + 235)%></td>
			<td width="100" id="236"><%=pds.gettrue(fifthid + 236)%></td>
			<td width="100" id="237"><%=pds.gettrue(fifthid + 237)%></td>
			<td width="100" id="238"><%=pds.gettrue(fifthid + 238)%></td>
			<td width="100" id="239"><%=pds.gettrue(fifthid + 239)%></td>
			<td width="100" id="240"><%=pds.gettrue(fifthid + 240)%></td>
			<td width="100" id="241"><%=pds.gettrue(fifthid + 241)%></td>
			<td width="100" id="242"><%=pds.gettrue(fifthid + 242)%></td>

		</tr>


		<tr>
			<td width="100" id="1s"><%=pds.getpredict(fifthid + 1)%></td>
			<td width="100" id="2s"><%=pds.getpredict(fifthid + 2)%></td>
			<td width="100" id="3s"><%=pds.getpredict(fifthid + 3)%></td>
			<td width="100" id="4s"><%=pds.getpredict(fifthid + 4)%></td>
			<td width="100" id="5s"><%=pds.getpredict(fifthid + 5)%></td>
			<td width="100" id="6s"><%=pds.getpredict(fifthid + 6)%></td>
			<td width="100" id="7s"><%=pds.getpredict(fifthid + 7)%></td>
			<td width="100" id="8s"><%=pds.getpredict(fifthid + 8)%></td>
			<td width="100" id="9s"><%=pds.getpredict(fifthid + 9)%></td>
			<td width="100" id="10s"><%=pds.getpredict(fifthid + 10)%></td>
			<td width="100" id="11s"><%=pds.getpredict(fifthid + 11)%></td>
			<td width="100" id="12s"><%=pds.getpredict(fifthid + 12)%></td>
			<td width="100" id="13s"><%=pds.getpredict(fifthid + 13)%></td>
			<td width="100" id="14s"><%=pds.getpredict(fifthid + 14)%></td>
			<td width="100" id="15s"><%=pds.getpredict(fifthid + 15)%></td>
			<td width="100" id="16s"><%=pds.getpredict(fifthid + 16)%></td>
			<td width="100" id="17s"><%=pds.getpredict(fifthid + 17)%></td>
			<td width="100" id="18s"><%=pds.getpredict(fifthid + 18)%></td>
			<td width="100" id="19s"><%=pds.getpredict(fifthid + 19)%></td>
			<td width="100" id="20s"><%=pds.getpredict(fifthid + 20)%></td>
			<td width="100" id="21s"><%=pds.getpredict(fifthid + 21)%></td>
			<td width="100" id="22s"><%=pds.getpredict(fifthid + 22)%></td>
			<td width="100" id="23s"><%=pds.getpredict(fifthid + 23)%></td>
			<td width="100" id="24s"><%=pds.getpredict(fifthid + 24)%></td>
			<td width="100" id="25s"><%=pds.getpredict(fifthid + 25)%></td>
			<td width="100" id="26s"><%=pds.getpredict(fifthid + 26)%></td>
			<td width="100" id="27s"><%=pds.getpredict(fifthid + 27)%></td>
			<td width="100" id="28s"><%=pds.getpredict(fifthid + 28)%></td>
			<td width="100" id="29s"><%=pds.getpredict(fifthid + 29)%></td>
			<td width="100" id="30s"><%=pds.getpredict(fifthid + 30)%></td>
			<td width="100" id="31s"><%=pds.getpredict(fifthid + 31)%></td>
			<td width="100" id="32s"><%=pds.getpredict(fifthid + 32)%></td>
			<td width="100" id="33s"><%=pds.getpredict(fifthid + 33)%></td>
			<td width="100" id="34s"><%=pds.getpredict(fifthid + 34)%></td>
			<td width="100" id="35s"><%=pds.getpredict(fifthid + 35)%></td>
			<td width="100" id="36s"><%=pds.getpredict(fifthid + 36)%></td>
			<td width="100" id="37s"><%=pds.getpredict(fifthid + 37)%></td>
			<td width="100" id="38s"><%=pds.getpredict(fifthid + 38)%></td>
			<td width="100" id="39s"><%=pds.getpredict(fifthid + 39)%></td>
			<td width="100" id="40s"><%=pds.getpredict(fifthid + 40)%></td>
			<td width="100" id="41s"><%=pds.getpredict(fifthid + 41)%></td>
			<td width="100" id="42s"><%=pds.getpredict(fifthid + 42)%></td>
			<td width="100" id="43s"><%=pds.getpredict(fifthid + 43)%></td>
			<td width="100" id="44s"><%=pds.getpredict(fifthid + 44)%></td>
			<td width="100" id="45s"><%=pds.getpredict(fifthid + 45)%></td>
			<td width="100" id="46s"><%=pds.getpredict(fifthid + 46)%></td>
			<td width="100" id="47s"><%=pds.getpredict(fifthid + 47)%></td>
			<td width="100" id="48s"><%=pds.getpredict(fifthid + 48)%></td>
			<td width="100" id="49s"><%=pds.getpredict(fifthid + 49)%></td>
			<td width="100" id="50s"><%=pds.getpredict(fifthid + 50)%></td>
			<td width="100" id="51s"><%=pds.getpredict(fifthid + 51)%></td>
			<td width="100" id="52s"><%=pds.getpredict(fifthid + 52)%></td>
			<td width="100" id="53s"><%=pds.getpredict(fifthid + 53)%></td>
			<td width="100" id="54s"><%=pds.getpredict(fifthid + 54)%></td>
			<td width="100" id="55s"><%=pds.getpredict(fifthid + 55)%></td>
			<td width="100" id="56s"><%=pds.getpredict(fifthid + 56)%></td>
			<td width="100" id="57s"><%=pds.getpredict(fifthid + 57)%></td>
			<td width="100" id="58s"><%=pds.getpredict(fifthid + 58)%></td>
			<td width="100" id="59s"><%=pds.getpredict(fifthid + 59)%></td>
			<td width="100" id="60s"><%=pds.getpredict(fifthid + 60)%></td>
			<td width="100" id="61s"><%=pds.getpredict(fifthid + 61)%></td>
			<td width="100" id="62s"><%=pds.getpredict(fifthid + 62)%></td>
			<td width="100" id="63s"><%=pds.getpredict(fifthid + 63)%></td>
			<td width="100" id="64s"><%=pds.getpredict(fifthid + 64)%></td>
			<td width="100" id="65s"><%=pds.getpredict(fifthid + 65)%></td>
			<td width="100" id="66s"><%=pds.getpredict(fifthid + 66)%></td>
			<td width="100" id="67s"><%=pds.getpredict(fifthid + 67)%></td>
			<td width="100" id="68s"><%=pds.getpredict(fifthid + 68)%></td>
			<td width="100" id="69s"><%=pds.getpredict(fifthid + 69)%></td>
			<td width="100" id="70s"><%=pds.getpredict(fifthid + 70)%></td>
			<td width="100" id="71s"><%=pds.getpredict(fifthid + 71)%></td>
			<td width="100" id="72s"><%=pds.getpredict(fifthid + 72)%></td>
			<td width="100" id="73s"><%=pds.getpredict(fifthid + 73)%></td>
			<td width="100" id="74s"><%=pds.getpredict(fifthid + 74)%></td>
			<td width="100" id="75s"><%=pds.getpredict(fifthid + 75)%></td>
			<td width="100" id="76s"><%=pds.getpredict(fifthid + 76)%></td>
			<td width="100" id="77s"><%=pds.getpredict(fifthid + 77)%></td>
			<td width="100" id="78s"><%=pds.getpredict(fifthid + 78)%></td>
			<td width="100" id="79s"><%=pds.getpredict(fifthid + 79)%></td>
			<td width="100" id="80s"><%=pds.getpredict(fifthid + 80)%></td>
			<td width="100" id="81s"><%=pds.getpredict(fifthid + 81)%></td>
			<td width="100" id="82s"><%=pds.getpredict(fifthid + 82)%></td>
			<td width="100" id="83s"><%=pds.getpredict(fifthid + 83)%></td>
			<td width="100" id="84s"><%=pds.getpredict(fifthid + 84)%></td>
			<td width="100" id="85s"><%=pds.getpredict(fifthid + 85)%></td>
			<td width="100" id="86s"><%=pds.getpredict(fifthid + 86)%></td>
			<td width="100" id="87s"><%=pds.getpredict(fifthid + 87)%></td>
			<td width="100" id="88s"><%=pds.getpredict(fifthid + 88)%></td>
			<td width="100" id="89s"><%=pds.getpredict(fifthid + 89)%></td>
			<td width="100" id="90s"><%=pds.getpredict(fifthid + 90)%></td>
			<td width="100" id="91s"><%=pds.getpredict(fifthid + 91)%></td>
			<td width="100" id="92s"><%=pds.getpredict(fifthid + 92)%></td>
			<td width="100" id="93s"><%=pds.getpredict(fifthid + 93)%></td>
			<td width="100" id="94s"><%=pds.getpredict(fifthid + 94)%></td>
			<td width="100" id="95s"><%=pds.getpredict(fifthid + 95)%></td>
			<td width="100" id="96s"><%=pds.getpredict(fifthid + 96)%></td>
			<td width="100" id="97s"><%=pds.getpredict(fifthid + 97)%></td>
			<td width="100" id="98s"><%=pds.getpredict(fifthid + 98)%></td>
			<td width="100" id="99s"><%=pds.getpredict(fifthid + 99)%></td>
			<td width="100" id="100s"><%=pds.getpredict(fifthid + 100)%></td>
			<td width="100" id="101s"><%=pds.getpredict(fifthid + 101)%></td>
			<td width="100" id="102s"><%=pds.getpredict(fifthid + 102)%></td>
			<td width="100" id="103s"><%=pds.getpredict(fifthid + 103)%></td>
			<td width="100" id="104s"><%=pds.getpredict(fifthid + 104)%></td>
			<td width="100" id="105s"><%=pds.getpredict(fifthid + 105)%></td>
			<td width="100" id="106s"><%=pds.getpredict(fifthid + 106)%></td>
			<td width="100" id="107s"><%=pds.getpredict(fifthid + 107)%></td>
			<td width="100" id="108s"><%=pds.getpredict(fifthid + 108)%></td>
			<td width="100" id="109s"><%=pds.getpredict(fifthid + 109)%></td>
			<td width="100" id="110s"><%=pds.getpredict(fifthid + 110)%></td>
			<td width="100" id="111s"><%=pds.getpredict(fifthid + 111)%></td>
			<td width="100" id="112s"><%=pds.getpredict(fifthid + 112)%></td>
			<td width="100" id="113s"><%=pds.getpredict(fifthid + 113)%></td>
			<td width="100" id="114s"><%=pds.getpredict(fifthid + 114)%></td>
			<td width="100" id="115s"><%=pds.getpredict(fifthid + 115)%></td>
			<td width="100" id="116s"><%=pds.getpredict(fifthid + 116)%></td>
			<td width="100" id="117s"><%=pds.getpredict(fifthid + 117)%></td>
			<td width="100" id="118s"><%=pds.getpredict(fifthid + 118)%></td>
			<td width="100" id="119s"><%=pds.getpredict(fifthid + 119)%></td>
			<td width="100" id="120s"><%=pds.getpredict(fifthid + 120)%></td>
			<td width="100" id="121s"><%=pds.getpredict(fifthid + 121)%></td>
			<td width="100" id="122s"><%=pds.getpredict(fifthid + 122)%></td>
			<td width="100" id="123s"><%=pds.getpredict(fifthid + 123)%></td>
			<td width="100" id="124s"><%=pds.getpredict(fifthid + 124)%></td>
			<td width="100" id="125s"><%=pds.getpredict(fifthid + 125)%></td>
			<td width="100" id="126s"><%=pds.getpredict(fifthid + 126)%></td>
			<td width="100" id="127s"><%=pds.getpredict(fifthid + 127)%></td>
			<td width="100" id="128s"><%=pds.getpredict(fifthid + 128)%></td>
			<td width="100" id="129s"><%=pds.getpredict(fifthid + 129)%></td>
			<td width="100" id="130s"><%=pds.getpredict(fifthid + 130)%></td>
			<td width="100" id="131s"><%=pds.getpredict(fifthid + 131)%></td>
			<td width="100" id="132s"><%=pds.getpredict(fifthid + 132)%></td>
			<td width="100" id="133s"><%=pds.getpredict(fifthid + 133)%></td>
			<td width="100" id="134s"><%=pds.getpredict(fifthid + 134)%></td>
			<td width="100" id="135s"><%=pds.getpredict(fifthid + 135)%></td>
			<td width="100" id="136s"><%=pds.getpredict(fifthid + 136)%></td>
			<td width="100" id="137s"><%=pds.getpredict(fifthid + 137)%></td>
			<td width="100" id="138s"><%=pds.getpredict(fifthid + 138)%></td>
			<td width="100" id="139s"><%=pds.getpredict(fifthid + 139)%></td>
			<td width="100" id="140s"><%=pds.getpredict(fifthid + 140)%></td>
			<td width="100" id="141s"><%=pds.getpredict(fifthid + 141)%></td>
			<td width="100" id="142s"><%=pds.getpredict(fifthid + 142)%></td>
			<td width="100" id="143s"><%=pds.getpredict(fifthid + 143)%></td>
			<td width="100" id="144s"><%=pds.getpredict(fifthid + 144)%></td>
			<td width="100" id="145s"><%=pds.getpredict(fifthid + 145)%></td>
			<td width="100" id="146s"><%=pds.getpredict(fifthid + 146)%></td>
			<td width="100" id="147s"><%=pds.getpredict(fifthid + 147)%></td>
			<td width="100" id="148s"><%=pds.getpredict(fifthid + 148)%></td>
			<td width="100" id="149s"><%=pds.getpredict(fifthid + 149)%></td>
			<td width="100" id="150s"><%=pds.getpredict(fifthid + 150)%></td>
			<td width="100" id="151s"><%=pds.getpredict(fifthid + 151)%></td>
			<td width="100" id="152s"><%=pds.getpredict(fifthid + 152)%></td>
			<td width="100" id="153s"><%=pds.getpredict(fifthid + 153)%></td>
			<td width="100" id="154s"><%=pds.getpredict(fifthid + 154)%></td>
			<td width="100" id="155s"><%=pds.getpredict(fifthid + 155)%></td>
			<td width="100" id="156s"><%=pds.getpredict(fifthid + 156)%></td>
			<td width="100" id="157s"><%=pds.getpredict(fifthid + 157)%></td>
			<td width="100" id="158s"><%=pds.getpredict(fifthid + 158)%></td>
			<td width="100" id="159s"><%=pds.getpredict(fifthid + 159)%></td>
			<td width="100" id="160s"><%=pds.getpredict(fifthid + 160)%></td>
			<td width="100" id="161s"><%=pds.getpredict(fifthid + 161)%></td>
			<td width="100" id="162s"><%=pds.getpredict(fifthid + 162)%></td>
			<td width="100" id="163s"><%=pds.getpredict(fifthid + 163)%></td>
			<td width="100" id="164s"><%=pds.getpredict(fifthid + 164)%></td>
			<td width="100" id="165s"><%=pds.getpredict(fifthid + 165)%></td>
			<td width="100" id="166s"><%=pds.getpredict(fifthid + 166)%></td>
			<td width="100" id="167s"><%=pds.getpredict(fifthid + 167)%></td>
			<td width="100" id="168s"><%=pds.getpredict(fifthid + 168)%></td>
			<td width="100" id="169s"><%=pds.getpredict(fifthid + 169)%></td>
			<td width="100" id="170s"><%=pds.getpredict(fifthid + 170)%></td>
			<td width="100" id="171s"><%=pds.getpredict(fifthid + 171)%></td>
			<td width="100" id="172s"><%=pds.getpredict(fifthid + 172)%></td>
			<td width="100" id="173s"><%=pds.getpredict(fifthid + 173)%></td>
			<td width="100" id="174s"><%=pds.getpredict(fifthid + 174)%></td>
			<td width="100" id="175s"><%=pds.getpredict(fifthid + 175)%></td>
			<td width="100" id="176s"><%=pds.getpredict(fifthid + 176)%></td>
			<td width="100" id="177s"><%=pds.getpredict(fifthid + 177)%></td>
			<td width="100" id="178s"><%=pds.getpredict(fifthid + 178)%></td>
			<td width="100" id="179s"><%=pds.getpredict(fifthid + 179)%></td>
			<td width="100" id="180s"><%=pds.getpredict(fifthid + 180)%></td>
			<td width="100" id="181s"><%=pds.getpredict(fifthid + 181)%></td>
			<td width="100" id="182s"><%=pds.getpredict(fifthid + 182)%></td>
			<td width="100" id="183s"><%=pds.getpredict(fifthid + 183)%></td>
			<td width="100" id="184s"><%=pds.getpredict(fifthid + 184)%></td>
			<td width="100" id="185s"><%=pds.getpredict(fifthid + 185)%></td>
			<td width="100" id="186s"><%=pds.getpredict(fifthid + 186)%></td>
			<td width="100" id="187s"><%=pds.getpredict(fifthid + 187)%></td>
			<td width="100" id="188s"><%=pds.getpredict(fifthid + 188)%></td>
			<td width="100" id="189s"><%=pds.getpredict(fifthid + 189)%></td>
			<td width="100" id="190s"><%=pds.getpredict(fifthid + 190)%></td>
			<td width="100" id="191s"><%=pds.getpredict(fifthid + 191)%></td>
			<td width="100" id="192s"><%=pds.getpredict(fifthid + 192)%></td>
			<td width="100" id="193s"><%=pds.getpredict(fifthid + 193)%></td>
			<td width="100" id="194s"><%=pds.getpredict(fifthid + 194)%></td>
			<td width="100" id="195s"><%=pds.getpredict(fifthid + 195)%></td>
			<td width="100" id="196s"><%=pds.getpredict(fifthid + 196)%></td>
			<td width="100" id="197s"><%=pds.getpredict(fifthid + 197)%></td>
			<td width="100" id="198s"><%=pds.getpredict(fifthid + 198)%></td>
			<td width="100" id="199s"><%=pds.getpredict(fifthid + 199)%></td>
			<td width="100" id="200s"><%=pds.getpredict(fifthid + 200)%></td>
			<td width="100" id="201s"><%=pds.getpredict(fifthid + 201)%></td>
			<td width="100" id="202s"><%=pds.getpredict(fifthid + 202)%></td>
			<td width="100" id="203s"><%=pds.getpredict(fifthid + 203)%></td>
			<td width="100" id="204s"><%=pds.getpredict(fifthid + 204)%></td>
			<td width="100" id="205s"><%=pds.getpredict(fifthid + 205)%></td>
			<td width="100" id="206s"><%=pds.getpredict(fifthid + 206)%></td>
			<td width="100" id="207s"><%=pds.getpredict(fifthid + 207)%></td>
			<td width="100" id="208s"><%=pds.getpredict(fifthid + 208)%></td>
			<td width="100" id="209s"><%=pds.getpredict(fifthid + 209)%></td>
			<td width="100" id="210s"><%=pds.getpredict(fifthid + 210)%></td>
			<td width="100" id="211s"><%=pds.getpredict(fifthid + 211)%></td>
			<td width="100" id="212s"><%=pds.getpredict(fifthid + 212)%></td>
			<td width="100" id="213s"><%=pds.getpredict(fifthid + 213)%></td>
			<td width="100" id="214s"><%=pds.getpredict(fifthid + 214)%></td>
			<td width="100" id="215s"><%=pds.getpredict(fifthid + 215)%></td>
			<td width="100" id="216s"><%=pds.getpredict(fifthid + 216)%></td>
			<td width="100" id="217s"><%=pds.getpredict(fifthid + 217)%></td>
			<td width="100" id="218s"><%=pds.getpredict(fifthid + 218)%></td>
			<td width="100" id="219s"><%=pds.getpredict(fifthid + 219)%></td>
			<td width="100" id="220s"><%=pds.getpredict(fifthid + 220)%></td>
			<td width="100" id="221s"><%=pds.getpredict(fifthid + 221)%></td>
			<td width="100" id="222s"><%=pds.getpredict(fifthid + 222)%></td>
			<td width="100" id="223s"><%=pds.getpredict(fifthid + 223)%></td>
			<td width="100" id="224s"><%=pds.getpredict(fifthid + 224)%></td>
			<td width="100" id="225s"><%=pds.getpredict(fifthid + 225)%></td>
			<td width="100" id="226s"><%=pds.getpredict(fifthid + 226)%></td>
			<td width="100" id="227s"><%=pds.getpredict(fifthid + 227)%></td>
			<td width="100" id="228s"><%=pds.getpredict(fifthid + 228)%></td>
			<td width="100" id="229s"><%=pds.getpredict(fifthid + 229)%></td>
			<td width="100" id="230s"><%=pds.getpredict(fifthid + 230)%></td>
			<td width="100" id="231s"><%=pds.getpredict(fifthid + 231)%></td>
			<td width="100" id="232s"><%=pds.getpredict(fifthid + 232)%></td>
			<td width="100" id="233s"><%=pds.getpredict(fifthid + 233)%></td>
			<td width="100" id="234s"><%=pds.getpredict(fifthid + 234)%></td>
			<td width="100" id="235s"><%=pds.getpredict(fifthid + 235)%></td>
			<td width="100" id="236s"><%=pds.getpredict(fifthid + 236)%></td>
			<td width="100" id="237s"><%=pds.getpredict(fifthid + 237)%></td>
			<td width="100" id="238s"><%=pds.getpredict(fifthid + 238)%></td>
			<td width="100" id="239s"><%=pds.getpredict(fifthid + 239)%></td>
			<td width="100" id="240s"><%=pds.getpredict(fifthid + 240)%></td>
			<td width="100" id="241s"><%=pds.getpredict(fifthid + 241)%></td>
			<td width="100" id="242s"><%=pds.getpredict(fifthid + 242)%></td>

		</tr>

	</table>


	<script>
		/* var randomScalingFactor = function() {
			return Math.round(Math.random() * 100)
		}; */
		var lineChartData = {
			labels : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
					"12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
					"22", "23", "24", "25", "26", "27", "28", "29", "30", "31",
					"32", "33", "34", "35", "36", "37", "38", "39", "40", "41",
					"42", "43", "44", "45", "46", "47", "48", "49", "50", "51",
					"52", "53", "54", "55", "56", "57", "58", "59", "60", "61",
					"62", "63", "64", "65", "66", "67", "68", "69", "70", "71",
					"72", "73", "74", "75", "76", "77", "78", "79", "80", "81",
					"82", "83", "84", "85", "86", "87", "88", "89", "90", "91",
					"92", "93", "94", "95", "96", "97", "98", "99", "100",
					"101", "102", "103", "104", "105", "106", "107", "108",
					"109", "110", "111", "112", "113", "114", "115", "116",
					"117", "118", "119", "120", "121", "122", "123", "124",
					"125", "126", "127", "128", "129", "130", "131", "132",
					"133", "134", "135", "136", "137", "138", "139", "140",
					"141", "142", "143", "144", "145", "146", "147", "148",
					"149", "150", "151", "152", "153", "154", "155", "156",
					"157", "158", "159", "160", "161", "162", "163", "164",
					"165", "166", "167", "168", "169", "170", "171", "172",
					"173", "174", "175", "176", "177", "178", "179", "180",
					"181", "182", "183", "184", "185", "186", "187", "188",
					"189", "190", "191", "192", "193", "194", "195", "196",
					"197", "198", "199", "200", "201", "202", "203", "204",
					"205", "206", "207", "208", "209", "210", "211", "212",
					"213", "214", "215", "216", "217", "218", "219", "220",
					"221", "222", "223", "224", "225", "226", "227", "228",
					"229", "230", "231", "232", "233", "234", "235", "236",
					"237", "238", "239", "240", "241", "242", ],
			datasets : [
					{
						label : "My First dataset",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : [ document.getElementById("1").innerHTML,
								document.getElementById("2").innerHTML,
								document.getElementById("3").innerHTML,
								document.getElementById("4").innerHTML,
								document.getElementById("5").innerHTML,
								document.getElementById("6").innerHTML,
								document.getElementById("7").innerHTML,
								document.getElementById("8").innerHTML,
								document.getElementById("9").innerHTML,
								document.getElementById("10").innerHTML,
								document.getElementById("11").innerHTML,
								document.getElementById("12").innerHTML,
								document.getElementById("13").innerHTML,
								document.getElementById("14").innerHTML,
								document.getElementById("15").innerHTML,
								document.getElementById("16").innerHTML,
								document.getElementById("17").innerHTML,
								document.getElementById("18").innerHTML,
								document.getElementById("19").innerHTML,
								document.getElementById("20").innerHTML,
								document.getElementById("21").innerHTML,
								document.getElementById("22").innerHTML,
								document.getElementById("23").innerHTML,
								document.getElementById("24").innerHTML,
								document.getElementById("25").innerHTML,
								document.getElementById("26").innerHTML,
								document.getElementById("27").innerHTML,
								document.getElementById("28").innerHTML,
								document.getElementById("29").innerHTML,
								document.getElementById("30").innerHTML,
								document.getElementById("31").innerHTML,
								document.getElementById("32").innerHTML,
								document.getElementById("33").innerHTML,
								document.getElementById("34").innerHTML,
								document.getElementById("35").innerHTML,
								document.getElementById("36").innerHTML,
								document.getElementById("37").innerHTML,
								document.getElementById("38").innerHTML,
								document.getElementById("39").innerHTML,
								document.getElementById("40").innerHTML,
								document.getElementById("41").innerHTML,
								document.getElementById("42").innerHTML,
								document.getElementById("43").innerHTML,
								document.getElementById("44").innerHTML,
								document.getElementById("45").innerHTML,
								document.getElementById("46").innerHTML,
								document.getElementById("47").innerHTML,
								document.getElementById("48").innerHTML,
								document.getElementById("49").innerHTML,
								document.getElementById("50").innerHTML,
								document.getElementById("51").innerHTML,
								document.getElementById("52").innerHTML,
								document.getElementById("53").innerHTML,
								document.getElementById("54").innerHTML,
								document.getElementById("55").innerHTML,
								document.getElementById("56").innerHTML,
								document.getElementById("57").innerHTML,
								document.getElementById("58").innerHTML,
								document.getElementById("59").innerHTML,
								document.getElementById("60").innerHTML,
								document.getElementById("61").innerHTML,
								document.getElementById("62").innerHTML,
								document.getElementById("63").innerHTML,
								document.getElementById("64").innerHTML,
								document.getElementById("65").innerHTML,
								document.getElementById("66").innerHTML,
								document.getElementById("67").innerHTML,
								document.getElementById("68").innerHTML,
								document.getElementById("69").innerHTML,
								document.getElementById("70").innerHTML,
								document.getElementById("71").innerHTML,
								document.getElementById("72").innerHTML,
								document.getElementById("73").innerHTML,
								document.getElementById("74").innerHTML,
								document.getElementById("75").innerHTML,
								document.getElementById("76").innerHTML,
								document.getElementById("77").innerHTML,
								document.getElementById("78").innerHTML,
								document.getElementById("79").innerHTML,
								document.getElementById("80").innerHTML,
								document.getElementById("81").innerHTML,
								document.getElementById("82").innerHTML,
								document.getElementById("83").innerHTML,
								document.getElementById("84").innerHTML,
								document.getElementById("85").innerHTML,
								document.getElementById("86").innerHTML,
								document.getElementById("87").innerHTML,
								document.getElementById("88").innerHTML,
								document.getElementById("89").innerHTML,
								document.getElementById("90").innerHTML,
								document.getElementById("91").innerHTML,
								document.getElementById("92").innerHTML,
								document.getElementById("93").innerHTML,
								document.getElementById("94").innerHTML,
								document.getElementById("95").innerHTML,
								document.getElementById("96").innerHTML,
								document.getElementById("97").innerHTML,
								document.getElementById("98").innerHTML,
								document.getElementById("99").innerHTML,
								document.getElementById("100").innerHTML,
								document.getElementById("101").innerHTML,
								document.getElementById("102").innerHTML,
								document.getElementById("103").innerHTML,
								document.getElementById("104").innerHTML,
								document.getElementById("105").innerHTML,
								document.getElementById("106").innerHTML,
								document.getElementById("107").innerHTML,
								document.getElementById("108").innerHTML,
								document.getElementById("109").innerHTML,
								document.getElementById("110").innerHTML,
								document.getElementById("111").innerHTML,
								document.getElementById("112").innerHTML,
								document.getElementById("113").innerHTML,
								document.getElementById("114").innerHTML,
								document.getElementById("115").innerHTML,
								document.getElementById("116").innerHTML,
								document.getElementById("117").innerHTML,
								document.getElementById("118").innerHTML,
								document.getElementById("119").innerHTML,
								document.getElementById("120").innerHTML,
								document.getElementById("121").innerHTML,
								document.getElementById("122").innerHTML,
								document.getElementById("123").innerHTML,
								document.getElementById("124").innerHTML,
								document.getElementById("125").innerHTML,
								document.getElementById("126").innerHTML,
								document.getElementById("127").innerHTML,
								document.getElementById("128").innerHTML,
								document.getElementById("129").innerHTML,
								document.getElementById("130").innerHTML,
								document.getElementById("131").innerHTML,
								document.getElementById("132").innerHTML,
								document.getElementById("133").innerHTML,
								document.getElementById("134").innerHTML,
								document.getElementById("135").innerHTML,
								document.getElementById("136").innerHTML,
								document.getElementById("137").innerHTML,
								document.getElementById("138").innerHTML,
								document.getElementById("139").innerHTML,
								document.getElementById("140").innerHTML,
								document.getElementById("141").innerHTML,
								document.getElementById("142").innerHTML,
								document.getElementById("143").innerHTML,
								document.getElementById("144").innerHTML,
								document.getElementById("145").innerHTML,
								document.getElementById("146").innerHTML,
								document.getElementById("147").innerHTML,
								document.getElementById("148").innerHTML,
								document.getElementById("149").innerHTML,
								document.getElementById("150").innerHTML,
								document.getElementById("151").innerHTML,
								document.getElementById("152").innerHTML,
								document.getElementById("153").innerHTML,
								document.getElementById("154").innerHTML,
								document.getElementById("155").innerHTML,
								document.getElementById("156").innerHTML,
								document.getElementById("157").innerHTML,
								document.getElementById("158").innerHTML,
								document.getElementById("159").innerHTML,
								document.getElementById("160").innerHTML,
								document.getElementById("161").innerHTML,
								document.getElementById("162").innerHTML,
								document.getElementById("163").innerHTML,
								document.getElementById("164").innerHTML,
								document.getElementById("165").innerHTML,
								document.getElementById("166").innerHTML,
								document.getElementById("167").innerHTML,
								document.getElementById("168").innerHTML,
								document.getElementById("169").innerHTML,
								document.getElementById("170").innerHTML,
								document.getElementById("171").innerHTML,
								document.getElementById("172").innerHTML,
								document.getElementById("173").innerHTML,
								document.getElementById("174").innerHTML,
								document.getElementById("175").innerHTML,
								document.getElementById("176").innerHTML,
								document.getElementById("177").innerHTML,
								document.getElementById("178").innerHTML,
								document.getElementById("179").innerHTML,
								document.getElementById("180").innerHTML,
								document.getElementById("181").innerHTML,
								document.getElementById("182").innerHTML,
								document.getElementById("183").innerHTML,
								document.getElementById("184").innerHTML,
								document.getElementById("185").innerHTML,
								document.getElementById("186").innerHTML,
								document.getElementById("187").innerHTML,
								document.getElementById("188").innerHTML,
								document.getElementById("189").innerHTML,
								document.getElementById("190").innerHTML,
								document.getElementById("191").innerHTML,
								document.getElementById("192").innerHTML,
								document.getElementById("193").innerHTML,
								document.getElementById("194").innerHTML,
								document.getElementById("195").innerHTML,
								document.getElementById("196").innerHTML,
								document.getElementById("197").innerHTML,
								document.getElementById("198").innerHTML,
								document.getElementById("199").innerHTML,
								document.getElementById("200").innerHTML,
								document.getElementById("201").innerHTML,
								document.getElementById("202").innerHTML,
								document.getElementById("203").innerHTML,
								document.getElementById("204").innerHTML,
								document.getElementById("205").innerHTML,
								document.getElementById("206").innerHTML,
								document.getElementById("207").innerHTML,
								document.getElementById("208").innerHTML,
								document.getElementById("209").innerHTML,
								document.getElementById("210").innerHTML,
								document.getElementById("211").innerHTML,
								document.getElementById("212").innerHTML,
								document.getElementById("213").innerHTML,
								document.getElementById("214").innerHTML,
								document.getElementById("215").innerHTML,
								document.getElementById("216").innerHTML,
								document.getElementById("217").innerHTML,
								document.getElementById("218").innerHTML,
								document.getElementById("219").innerHTML,
								document.getElementById("220").innerHTML,
								document.getElementById("221").innerHTML,
								document.getElementById("222").innerHTML,
								document.getElementById("223").innerHTML,
								document.getElementById("224").innerHTML,
								document.getElementById("225").innerHTML,
								document.getElementById("226").innerHTML,
								document.getElementById("227").innerHTML,
								document.getElementById("228").innerHTML,
								document.getElementById("229").innerHTML,
								document.getElementById("230").innerHTML,
								document.getElementById("231").innerHTML,
								document.getElementById("232").innerHTML,
								document.getElementById("233").innerHTML,
								document.getElementById("234").innerHTML,
								document.getElementById("235").innerHTML,
								document.getElementById("236").innerHTML,
								document.getElementById("237").innerHTML,
								document.getElementById("238").innerHTML,
								document.getElementById("239").innerHTML,
								document.getElementById("240").innerHTML,
								document.getElementById("241").innerHTML,
								document.getElementById("242").innerHTML, ]
					},
					{
						label : "My Second dataset",
						fillColor : "rgba(151,187,205,0.2)",
						strokeColor : "rgba(151,187,205,1)",
						pointColor : "rgba(151,187,205,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(151,187,205,1)",
						data : [ document.getElementById("1s").innerHTML,
								document.getElementById("2s").innerHTML,
								document.getElementById("3s").innerHTML,
								document.getElementById("4s").innerHTML,
								document.getElementById("5s").innerHTML,
								document.getElementById("6s").innerHTML,
								document.getElementById("7s").innerHTML,
								document.getElementById("8s").innerHTML,
								document.getElementById("9s").innerHTML,
								document.getElementById("10s").innerHTML,
								document.getElementById("11s").innerHTML,
								document.getElementById("12s").innerHTML,
								document.getElementById("13s").innerHTML,
								document.getElementById("14s").innerHTML,
								document.getElementById("15s").innerHTML,
								document.getElementById("16s").innerHTML,
								document.getElementById("17s").innerHTML,
								document.getElementById("18s").innerHTML,
								document.getElementById("19s").innerHTML,
								document.getElementById("20s").innerHTML,
								document.getElementById("21s").innerHTML,
								document.getElementById("22s").innerHTML,
								document.getElementById("23s").innerHTML,
								document.getElementById("24s").innerHTML,
								document.getElementById("25s").innerHTML,
								document.getElementById("26s").innerHTML,
								document.getElementById("27s").innerHTML,
								document.getElementById("28s").innerHTML,
								document.getElementById("29s").innerHTML,
								document.getElementById("30s").innerHTML,
								document.getElementById("31s").innerHTML,
								document.getElementById("32s").innerHTML,
								document.getElementById("33s").innerHTML,
								document.getElementById("34s").innerHTML,
								document.getElementById("35s").innerHTML,
								document.getElementById("36s").innerHTML,
								document.getElementById("37s").innerHTML,
								document.getElementById("38s").innerHTML,
								document.getElementById("39s").innerHTML,
								document.getElementById("40s").innerHTML,
								document.getElementById("41s").innerHTML,
								document.getElementById("42s").innerHTML,
								document.getElementById("43s").innerHTML,
								document.getElementById("44s").innerHTML,
								document.getElementById("45s").innerHTML,
								document.getElementById("46s").innerHTML,
								document.getElementById("47s").innerHTML,
								document.getElementById("48s").innerHTML,
								document.getElementById("49s").innerHTML,
								document.getElementById("50s").innerHTML,
								document.getElementById("51s").innerHTML,
								document.getElementById("52s").innerHTML,
								document.getElementById("53s").innerHTML,
								document.getElementById("54s").innerHTML,
								document.getElementById("55s").innerHTML,
								document.getElementById("56s").innerHTML,
								document.getElementById("57s").innerHTML,
								document.getElementById("58s").innerHTML,
								document.getElementById("59s").innerHTML,
								document.getElementById("60s").innerHTML,
								document.getElementById("61s").innerHTML,
								document.getElementById("62s").innerHTML,
								document.getElementById("63s").innerHTML,
								document.getElementById("64s").innerHTML,
								document.getElementById("65s").innerHTML,
								document.getElementById("66s").innerHTML,
								document.getElementById("67s").innerHTML,
								document.getElementById("68s").innerHTML,
								document.getElementById("69s").innerHTML,
								document.getElementById("70s").innerHTML,
								document.getElementById("71s").innerHTML,
								document.getElementById("72s").innerHTML,
								document.getElementById("73s").innerHTML,
								document.getElementById("74s").innerHTML,
								document.getElementById("75s").innerHTML,
								document.getElementById("76s").innerHTML,
								document.getElementById("77s").innerHTML,
								document.getElementById("78s").innerHTML,
								document.getElementById("79s").innerHTML,
								document.getElementById("80s").innerHTML,
								document.getElementById("81s").innerHTML,
								document.getElementById("82s").innerHTML,
								document.getElementById("83s").innerHTML,
								document.getElementById("84s").innerHTML,
								document.getElementById("85s").innerHTML,
								document.getElementById("86s").innerHTML,
								document.getElementById("87s").innerHTML,
								document.getElementById("88s").innerHTML,
								document.getElementById("89s").innerHTML,
								document.getElementById("90s").innerHTML,
								document.getElementById("91s").innerHTML,
								document.getElementById("92s").innerHTML,
								document.getElementById("93s").innerHTML,
								document.getElementById("94s").innerHTML,
								document.getElementById("95s").innerHTML,
								document.getElementById("96s").innerHTML,
								document.getElementById("97s").innerHTML,
								document.getElementById("98s").innerHTML,
								document.getElementById("99s").innerHTML,
								document.getElementById("100s").innerHTML,
								document.getElementById("101s").innerHTML,
								document.getElementById("102s").innerHTML,
								document.getElementById("103s").innerHTML,
								document.getElementById("104s").innerHTML,
								document.getElementById("105s").innerHTML,
								document.getElementById("106s").innerHTML,
								document.getElementById("107s").innerHTML,
								document.getElementById("108s").innerHTML,
								document.getElementById("109s").innerHTML,
								document.getElementById("110s").innerHTML,
								document.getElementById("111s").innerHTML,
								document.getElementById("112s").innerHTML,
								document.getElementById("113s").innerHTML,
								document.getElementById("114s").innerHTML,
								document.getElementById("115s").innerHTML,
								document.getElementById("116s").innerHTML,
								document.getElementById("117s").innerHTML,
								document.getElementById("118s").innerHTML,
								document.getElementById("119s").innerHTML,
								document.getElementById("120s").innerHTML,
								document.getElementById("121s").innerHTML,
								document.getElementById("122s").innerHTML,
								document.getElementById("123s").innerHTML,
								document.getElementById("124s").innerHTML,
								document.getElementById("125s").innerHTML,
								document.getElementById("126s").innerHTML,
								document.getElementById("127s").innerHTML,
								document.getElementById("128s").innerHTML,
								document.getElementById("129s").innerHTML,
								document.getElementById("130s").innerHTML,
								document.getElementById("131s").innerHTML,
								document.getElementById("132s").innerHTML,
								document.getElementById("133s").innerHTML,
								document.getElementById("134s").innerHTML,
								document.getElementById("135s").innerHTML,
								document.getElementById("136s").innerHTML,
								document.getElementById("137s").innerHTML,
								document.getElementById("138s").innerHTML,
								document.getElementById("139s").innerHTML,
								document.getElementById("140s").innerHTML,
								document.getElementById("141s").innerHTML,
								document.getElementById("142s").innerHTML,
								document.getElementById("143s").innerHTML,
								document.getElementById("144s").innerHTML,
								document.getElementById("145s").innerHTML,
								document.getElementById("146s").innerHTML,
								document.getElementById("147s").innerHTML,
								document.getElementById("148s").innerHTML,
								document.getElementById("149s").innerHTML,
								document.getElementById("150s").innerHTML,
								document.getElementById("151s").innerHTML,
								document.getElementById("152s").innerHTML,
								document.getElementById("153s").innerHTML,
								document.getElementById("154s").innerHTML,
								document.getElementById("155s").innerHTML,
								document.getElementById("156s").innerHTML,
								document.getElementById("157s").innerHTML,
								document.getElementById("158s").innerHTML,
								document.getElementById("159s").innerHTML,
								document.getElementById("160s").innerHTML,
								document.getElementById("161s").innerHTML,
								document.getElementById("162s").innerHTML,
								document.getElementById("163s").innerHTML,
								document.getElementById("164s").innerHTML,
								document.getElementById("165s").innerHTML,
								document.getElementById("166s").innerHTML,
								document.getElementById("167s").innerHTML,
								document.getElementById("168s").innerHTML,
								document.getElementById("169s").innerHTML,
								document.getElementById("170s").innerHTML,
								document.getElementById("171s").innerHTML,
								document.getElementById("172s").innerHTML,
								document.getElementById("173s").innerHTML,
								document.getElementById("174s").innerHTML,
								document.getElementById("175s").innerHTML,
								document.getElementById("176s").innerHTML,
								document.getElementById("177s").innerHTML,
								document.getElementById("178s").innerHTML,
								document.getElementById("179s").innerHTML,
								document.getElementById("180s").innerHTML,
								document.getElementById("181s").innerHTML,
								document.getElementById("182s").innerHTML,
								document.getElementById("183s").innerHTML,
								document.getElementById("184s").innerHTML,
								document.getElementById("185s").innerHTML,
								document.getElementById("186s").innerHTML,
								document.getElementById("187s").innerHTML,
								document.getElementById("188s").innerHTML,
								document.getElementById("189s").innerHTML,
								document.getElementById("190s").innerHTML,
								document.getElementById("191s").innerHTML,
								document.getElementById("192s").innerHTML,
								document.getElementById("193s").innerHTML,
								document.getElementById("194s").innerHTML,
								document.getElementById("195s").innerHTML,
								document.getElementById("196s").innerHTML,
								document.getElementById("197s").innerHTML,
								document.getElementById("198s").innerHTML,
								document.getElementById("199s").innerHTML,
								document.getElementById("200s").innerHTML,
								document.getElementById("201s").innerHTML,
								document.getElementById("202s").innerHTML,
								document.getElementById("203s").innerHTML,
								document.getElementById("204s").innerHTML,
								document.getElementById("205s").innerHTML,
								document.getElementById("206s").innerHTML,
								document.getElementById("207s").innerHTML,
								document.getElementById("208s").innerHTML,
								document.getElementById("209s").innerHTML,
								document.getElementById("210s").innerHTML,
								document.getElementById("211s").innerHTML,
								document.getElementById("212s").innerHTML,
								document.getElementById("213s").innerHTML,
								document.getElementById("214s").innerHTML,
								document.getElementById("215s").innerHTML,
								document.getElementById("216s").innerHTML,
								document.getElementById("217s").innerHTML,
								document.getElementById("218s").innerHTML,
								document.getElementById("219s").innerHTML,
								document.getElementById("220s").innerHTML,
								document.getElementById("221s").innerHTML,
								document.getElementById("222s").innerHTML,
								document.getElementById("223s").innerHTML,
								document.getElementById("224s").innerHTML,
								document.getElementById("225s").innerHTML,
								document.getElementById("226s").innerHTML,
								document.getElementById("227s").innerHTML,
								document.getElementById("228s").innerHTML,
								document.getElementById("229s").innerHTML,
								document.getElementById("230s").innerHTML,
								document.getElementById("231s").innerHTML,
								document.getElementById("232s").innerHTML,
								document.getElementById("233s").innerHTML,
								document.getElementById("234s").innerHTML,
								document.getElementById("235s").innerHTML,
								document.getElementById("236s").innerHTML,
								document.getElementById("237s").innerHTML,
								document.getElementById("238s").innerHTML,
								document.getElementById("239s").innerHTML,
								document.getElementById("240s").innerHTML,
								document.getElementById("241s").innerHTML,
								document.getElementById("242s").innerHTML, ]
					} ]

		}

		window.onload = function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			window.myLine = new Chart(ctx).Line(lineChartData, {
				responsive : true
			});
		}
	</script>
	<%
		new DataBaseConnection().close();
	%>
</body>
</html>


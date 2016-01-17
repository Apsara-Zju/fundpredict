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
		int secondid = 0+242;
	%>



	<table border="2" width="60%" id="mytable" style="display:none;">

		<!-- 比较股票在2015-10-12,1和2015-10-13,2这两个不同时间段的行情指数 -->

		<tr>
			<td width="100" id="1"><%=pds.gettrue(secondid + 1)%></td>
			<td width="100" id="2"><%=pds.gettrue(secondid + 2)%></td>
			<td width="100" id="3"><%=pds.gettrue(secondid + 3)%></td>
			<td width="100" id="4"><%=pds.gettrue(secondid + 4)%></td>
			<td width="100" id="5"><%=pds.gettrue(secondid + 5)%></td>
			<td width="100" id="6"><%=pds.gettrue(secondid + 6)%></td>
			<td width="100" id="7"><%=pds.gettrue(secondid + 7)%></td>
			<td width="100" id="8"><%=pds.gettrue(secondid + 8)%></td>
			<td width="100" id="9"><%=pds.gettrue(secondid + 9)%></td>
			<td width="100" id="10"><%=pds.gettrue(secondid + 10)%></td>
			<td width="100" id="11"><%=pds.gettrue(secondid + 11)%></td>
			<td width="100" id="12"><%=pds.gettrue(secondid + 12)%></td>
			<td width="100" id="13"><%=pds.gettrue(secondid + 13)%></td>
			<td width="100" id="14"><%=pds.gettrue(secondid + 14)%></td>
			<td width="100" id="15"><%=pds.gettrue(secondid + 15)%></td>
			<td width="100" id="16"><%=pds.gettrue(secondid + 16)%></td>
			<td width="100" id="17"><%=pds.gettrue(secondid + 17)%></td>
			<td width="100" id="18"><%=pds.gettrue(secondid + 18)%></td>
			<td width="100" id="19"><%=pds.gettrue(secondid + 19)%></td>
			<td width="100" id="20"><%=pds.gettrue(secondid + 20)%></td>
			<td width="100" id="21"><%=pds.gettrue(secondid + 21)%></td>
			<td width="100" id="22"><%=pds.gettrue(secondid + 22)%></td>
			<td width="100" id="23"><%=pds.gettrue(secondid + 23)%></td>
			<td width="100" id="24"><%=pds.gettrue(secondid + 24)%></td>
			<td width="100" id="25"><%=pds.gettrue(secondid + 25)%></td>
			<td width="100" id="26"><%=pds.gettrue(secondid + 26)%></td>
			<td width="100" id="27"><%=pds.gettrue(secondid + 27)%></td>
			<td width="100" id="28"><%=pds.gettrue(secondid + 28)%></td>
			<td width="100" id="29"><%=pds.gettrue(secondid + 29)%></td>
			<td width="100" id="30"><%=pds.gettrue(secondid + 30)%></td>
			<td width="100" id="31"><%=pds.gettrue(secondid + 31)%></td>
			<td width="100" id="32"><%=pds.gettrue(secondid + 32)%></td>
			<td width="100" id="33"><%=pds.gettrue(secondid + 33)%></td>
			<td width="100" id="34"><%=pds.gettrue(secondid + 34)%></td>
			<td width="100" id="35"><%=pds.gettrue(secondid + 35)%></td>
			<td width="100" id="36"><%=pds.gettrue(secondid + 36)%></td>
			<td width="100" id="37"><%=pds.gettrue(secondid + 37)%></td>
			<td width="100" id="38"><%=pds.gettrue(secondid + 38)%></td>
			<td width="100" id="39"><%=pds.gettrue(secondid + 39)%></td>
			<td width="100" id="40"><%=pds.gettrue(secondid + 40)%></td>
			<td width="100" id="41"><%=pds.gettrue(secondid + 41)%></td>
			<td width="100" id="42"><%=pds.gettrue(secondid + 42)%></td>
			<td width="100" id="43"><%=pds.gettrue(secondid + 43)%></td>
			<td width="100" id="44"><%=pds.gettrue(secondid + 44)%></td>
			<td width="100" id="45"><%=pds.gettrue(secondid + 45)%></td>
			<td width="100" id="46"><%=pds.gettrue(secondid + 46)%></td>
			<td width="100" id="47"><%=pds.gettrue(secondid + 47)%></td>
			<td width="100" id="48"><%=pds.gettrue(secondid + 48)%></td>
			<td width="100" id="49"><%=pds.gettrue(secondid + 49)%></td>
			<td width="100" id="50"><%=pds.gettrue(secondid + 50)%></td>
			<td width="100" id="51"><%=pds.gettrue(secondid + 51)%></td>
			<td width="100" id="52"><%=pds.gettrue(secondid + 52)%></td>
			<td width="100" id="53"><%=pds.gettrue(secondid + 53)%></td>
			<td width="100" id="54"><%=pds.gettrue(secondid + 54)%></td>
			<td width="100" id="55"><%=pds.gettrue(secondid + 55)%></td>
			<td width="100" id="56"><%=pds.gettrue(secondid + 56)%></td>
			<td width="100" id="57"><%=pds.gettrue(secondid + 57)%></td>
			<td width="100" id="58"><%=pds.gettrue(secondid + 58)%></td>
			<td width="100" id="59"><%=pds.gettrue(secondid + 59)%></td>
			<td width="100" id="60"><%=pds.gettrue(secondid + 60)%></td>
			<td width="100" id="61"><%=pds.gettrue(secondid + 61)%></td>
			<td width="100" id="62"><%=pds.gettrue(secondid + 62)%></td>
			<td width="100" id="63"><%=pds.gettrue(secondid + 63)%></td>
			<td width="100" id="64"><%=pds.gettrue(secondid + 64)%></td>
			<td width="100" id="65"><%=pds.gettrue(secondid + 65)%></td>
			<td width="100" id="66"><%=pds.gettrue(secondid + 66)%></td>
			<td width="100" id="67"><%=pds.gettrue(secondid + 67)%></td>
			<td width="100" id="68"><%=pds.gettrue(secondid + 68)%></td>
			<td width="100" id="69"><%=pds.gettrue(secondid + 69)%></td>
			<td width="100" id="70"><%=pds.gettrue(secondid + 70)%></td>
			<td width="100" id="71"><%=pds.gettrue(secondid + 71)%></td>
			<td width="100" id="72"><%=pds.gettrue(secondid + 72)%></td>
			<td width="100" id="73"><%=pds.gettrue(secondid + 73)%></td>
			<td width="100" id="74"><%=pds.gettrue(secondid + 74)%></td>
			<td width="100" id="75"><%=pds.gettrue(secondid + 75)%></td>
			<td width="100" id="76"><%=pds.gettrue(secondid + 76)%></td>
			<td width="100" id="77"><%=pds.gettrue(secondid + 77)%></td>
			<td width="100" id="78"><%=pds.gettrue(secondid + 78)%></td>
			<td width="100" id="79"><%=pds.gettrue(secondid + 79)%></td>
			<td width="100" id="80"><%=pds.gettrue(secondid + 80)%></td>
			<td width="100" id="81"><%=pds.gettrue(secondid + 81)%></td>
			<td width="100" id="82"><%=pds.gettrue(secondid + 82)%></td>
			<td width="100" id="83"><%=pds.gettrue(secondid + 83)%></td>
			<td width="100" id="84"><%=pds.gettrue(secondid + 84)%></td>
			<td width="100" id="85"><%=pds.gettrue(secondid + 85)%></td>
			<td width="100" id="86"><%=pds.gettrue(secondid + 86)%></td>
			<td width="100" id="87"><%=pds.gettrue(secondid + 87)%></td>
			<td width="100" id="88"><%=pds.gettrue(secondid + 88)%></td>
			<td width="100" id="89"><%=pds.gettrue(secondid + 89)%></td>
			<td width="100" id="90"><%=pds.gettrue(secondid + 90)%></td>
			<td width="100" id="91"><%=pds.gettrue(secondid + 91)%></td>
			<td width="100" id="92"><%=pds.gettrue(secondid + 92)%></td>
			<td width="100" id="93"><%=pds.gettrue(secondid + 93)%></td>
			<td width="100" id="94"><%=pds.gettrue(secondid + 94)%></td>
			<td width="100" id="95"><%=pds.gettrue(secondid + 95)%></td>
			<td width="100" id="96"><%=pds.gettrue(secondid + 96)%></td>
			<td width="100" id="97"><%=pds.gettrue(secondid + 97)%></td>
			<td width="100" id="98"><%=pds.gettrue(secondid + 98)%></td>
			<td width="100" id="99"><%=pds.gettrue(secondid + 99)%></td>
			<td width="100" id="100"><%=pds.gettrue(secondid + 100)%></td>
			<td width="100" id="101"><%=pds.gettrue(secondid + 101)%></td>
			<td width="100" id="102"><%=pds.gettrue(secondid + 102)%></td>
			<td width="100" id="103"><%=pds.gettrue(secondid + 103)%></td>
			<td width="100" id="104"><%=pds.gettrue(secondid + 104)%></td>
			<td width="100" id="105"><%=pds.gettrue(secondid + 105)%></td>
			<td width="100" id="106"><%=pds.gettrue(secondid + 106)%></td>
			<td width="100" id="107"><%=pds.gettrue(secondid + 107)%></td>
			<td width="100" id="108"><%=pds.gettrue(secondid + 108)%></td>
			<td width="100" id="109"><%=pds.gettrue(secondid + 109)%></td>
			<td width="100" id="110"><%=pds.gettrue(secondid + 110)%></td>
			<td width="100" id="111"><%=pds.gettrue(secondid + 111)%></td>
			<td width="100" id="112"><%=pds.gettrue(secondid + 112)%></td>
			<td width="100" id="113"><%=pds.gettrue(secondid + 113)%></td>
			<td width="100" id="114"><%=pds.gettrue(secondid + 114)%></td>
			<td width="100" id="115"><%=pds.gettrue(secondid + 115)%></td>
			<td width="100" id="116"><%=pds.gettrue(secondid + 116)%></td>
			<td width="100" id="117"><%=pds.gettrue(secondid + 117)%></td>
			<td width="100" id="118"><%=pds.gettrue(secondid + 118)%></td>
			<td width="100" id="119"><%=pds.gettrue(secondid + 119)%></td>
			<td width="100" id="120"><%=pds.gettrue(secondid + 120)%></td>
			<td width="100" id="121"><%=pds.gettrue(secondid + 121)%></td>
			<td width="100" id="122"><%=pds.gettrue(secondid + 122)%></td>
			<td width="100" id="123"><%=pds.gettrue(secondid + 123)%></td>
			<td width="100" id="124"><%=pds.gettrue(secondid + 124)%></td>
			<td width="100" id="125"><%=pds.gettrue(secondid + 125)%></td>
			<td width="100" id="126"><%=pds.gettrue(secondid + 126)%></td>
			<td width="100" id="127"><%=pds.gettrue(secondid + 127)%></td>
			<td width="100" id="128"><%=pds.gettrue(secondid + 128)%></td>
			<td width="100" id="129"><%=pds.gettrue(secondid + 129)%></td>
			<td width="100" id="130"><%=pds.gettrue(secondid + 130)%></td>
			<td width="100" id="131"><%=pds.gettrue(secondid + 131)%></td>
			<td width="100" id="132"><%=pds.gettrue(secondid + 132)%></td>
			<td width="100" id="133"><%=pds.gettrue(secondid + 133)%></td>
			<td width="100" id="134"><%=pds.gettrue(secondid + 134)%></td>
			<td width="100" id="135"><%=pds.gettrue(secondid + 135)%></td>
			<td width="100" id="136"><%=pds.gettrue(secondid + 136)%></td>
			<td width="100" id="137"><%=pds.gettrue(secondid + 137)%></td>
			<td width="100" id="138"><%=pds.gettrue(secondid + 138)%></td>
			<td width="100" id="139"><%=pds.gettrue(secondid + 139)%></td>
			<td width="100" id="140"><%=pds.gettrue(secondid + 140)%></td>
			<td width="100" id="141"><%=pds.gettrue(secondid + 141)%></td>
			<td width="100" id="142"><%=pds.gettrue(secondid + 142)%></td>
			<td width="100" id="143"><%=pds.gettrue(secondid + 143)%></td>
			<td width="100" id="144"><%=pds.gettrue(secondid + 144)%></td>
			<td width="100" id="145"><%=pds.gettrue(secondid + 145)%></td>
			<td width="100" id="146"><%=pds.gettrue(secondid + 146)%></td>
			<td width="100" id="147"><%=pds.gettrue(secondid + 147)%></td>
			<td width="100" id="148"><%=pds.gettrue(secondid + 148)%></td>
			<td width="100" id="149"><%=pds.gettrue(secondid + 149)%></td>
			<td width="100" id="150"><%=pds.gettrue(secondid + 150)%></td>
			<td width="100" id="151"><%=pds.gettrue(secondid + 151)%></td>
			<td width="100" id="152"><%=pds.gettrue(secondid + 152)%></td>
			<td width="100" id="153"><%=pds.gettrue(secondid + 153)%></td>
			<td width="100" id="154"><%=pds.gettrue(secondid + 154)%></td>
			<td width="100" id="155"><%=pds.gettrue(secondid + 155)%></td>
			<td width="100" id="156"><%=pds.gettrue(secondid + 156)%></td>
			<td width="100" id="157"><%=pds.gettrue(secondid + 157)%></td>
			<td width="100" id="158"><%=pds.gettrue(secondid + 158)%></td>
			<td width="100" id="159"><%=pds.gettrue(secondid + 159)%></td>
			<td width="100" id="160"><%=pds.gettrue(secondid + 160)%></td>
			<td width="100" id="161"><%=pds.gettrue(secondid + 161)%></td>
			<td width="100" id="162"><%=pds.gettrue(secondid + 162)%></td>
			<td width="100" id="163"><%=pds.gettrue(secondid + 163)%></td>
			<td width="100" id="164"><%=pds.gettrue(secondid + 164)%></td>
			<td width="100" id="165"><%=pds.gettrue(secondid + 165)%></td>
			<td width="100" id="166"><%=pds.gettrue(secondid + 166)%></td>
			<td width="100" id="167"><%=pds.gettrue(secondid + 167)%></td>
			<td width="100" id="168"><%=pds.gettrue(secondid + 168)%></td>
			<td width="100" id="169"><%=pds.gettrue(secondid + 169)%></td>
			<td width="100" id="170"><%=pds.gettrue(secondid + 170)%></td>
			<td width="100" id="171"><%=pds.gettrue(secondid + 171)%></td>
			<td width="100" id="172"><%=pds.gettrue(secondid + 172)%></td>
			<td width="100" id="173"><%=pds.gettrue(secondid + 173)%></td>
			<td width="100" id="174"><%=pds.gettrue(secondid + 174)%></td>
			<td width="100" id="175"><%=pds.gettrue(secondid + 175)%></td>
			<td width="100" id="176"><%=pds.gettrue(secondid + 176)%></td>
			<td width="100" id="177"><%=pds.gettrue(secondid + 177)%></td>
			<td width="100" id="178"><%=pds.gettrue(secondid + 178)%></td>
			<td width="100" id="179"><%=pds.gettrue(secondid + 179)%></td>
			<td width="100" id="180"><%=pds.gettrue(secondid + 180)%></td>
			<td width="100" id="181"><%=pds.gettrue(secondid + 181)%></td>
			<td width="100" id="182"><%=pds.gettrue(secondid + 182)%></td>
			<td width="100" id="183"><%=pds.gettrue(secondid + 183)%></td>
			<td width="100" id="184"><%=pds.gettrue(secondid + 184)%></td>
			<td width="100" id="185"><%=pds.gettrue(secondid + 185)%></td>
			<td width="100" id="186"><%=pds.gettrue(secondid + 186)%></td>
			<td width="100" id="187"><%=pds.gettrue(secondid + 187)%></td>
			<td width="100" id="188"><%=pds.gettrue(secondid + 188)%></td>
			<td width="100" id="189"><%=pds.gettrue(secondid + 189)%></td>
			<td width="100" id="190"><%=pds.gettrue(secondid + 190)%></td>
			<td width="100" id="191"><%=pds.gettrue(secondid + 191)%></td>
			<td width="100" id="192"><%=pds.gettrue(secondid + 192)%></td>
			<td width="100" id="193"><%=pds.gettrue(secondid + 193)%></td>
			<td width="100" id="194"><%=pds.gettrue(secondid + 194)%></td>
			<td width="100" id="195"><%=pds.gettrue(secondid + 195)%></td>
			<td width="100" id="196"><%=pds.gettrue(secondid + 196)%></td>
			<td width="100" id="197"><%=pds.gettrue(secondid + 197)%></td>
			<td width="100" id="198"><%=pds.gettrue(secondid + 198)%></td>
			<td width="100" id="199"><%=pds.gettrue(secondid + 199)%></td>
			<td width="100" id="200"><%=pds.gettrue(secondid + 200)%></td>
			<td width="100" id="201"><%=pds.gettrue(secondid + 201)%></td>
			<td width="100" id="202"><%=pds.gettrue(secondid + 202)%></td>
			<td width="100" id="203"><%=pds.gettrue(secondid + 203)%></td>
			<td width="100" id="204"><%=pds.gettrue(secondid + 204)%></td>
			<td width="100" id="205"><%=pds.gettrue(secondid + 205)%></td>
			<td width="100" id="206"><%=pds.gettrue(secondid + 206)%></td>
			<td width="100" id="207"><%=pds.gettrue(secondid + 207)%></td>
			<td width="100" id="208"><%=pds.gettrue(secondid + 208)%></td>
			<td width="100" id="209"><%=pds.gettrue(secondid + 209)%></td>
			<td width="100" id="210"><%=pds.gettrue(secondid + 210)%></td>
			<td width="100" id="211"><%=pds.gettrue(secondid + 211)%></td>
			<td width="100" id="212"><%=pds.gettrue(secondid + 212)%></td>
			<td width="100" id="213"><%=pds.gettrue(secondid + 213)%></td>
			<td width="100" id="214"><%=pds.gettrue(secondid + 214)%></td>
			<td width="100" id="215"><%=pds.gettrue(secondid + 215)%></td>
			<td width="100" id="216"><%=pds.gettrue(secondid + 216)%></td>
			<td width="100" id="217"><%=pds.gettrue(secondid + 217)%></td>
			<td width="100" id="218"><%=pds.gettrue(secondid + 218)%></td>
			<td width="100" id="219"><%=pds.gettrue(secondid + 219)%></td>
			<td width="100" id="220"><%=pds.gettrue(secondid + 220)%></td>
			<td width="100" id="221"><%=pds.gettrue(secondid + 221)%></td>
			<td width="100" id="222"><%=pds.gettrue(secondid + 222)%></td>
			<td width="100" id="223"><%=pds.gettrue(secondid + 223)%></td>
			<td width="100" id="224"><%=pds.gettrue(secondid + 224)%></td>
			<td width="100" id="225"><%=pds.gettrue(secondid + 225)%></td>
			<td width="100" id="226"><%=pds.gettrue(secondid + 226)%></td>
			<td width="100" id="227"><%=pds.gettrue(secondid + 227)%></td>
			<td width="100" id="228"><%=pds.gettrue(secondid + 228)%></td>
			<td width="100" id="229"><%=pds.gettrue(secondid + 229)%></td>
			<td width="100" id="230"><%=pds.gettrue(secondid + 230)%></td>
			<td width="100" id="231"><%=pds.gettrue(secondid + 231)%></td>
			<td width="100" id="232"><%=pds.gettrue(secondid + 232)%></td>
			<td width="100" id="233"><%=pds.gettrue(secondid + 233)%></td>
			<td width="100" id="234"><%=pds.gettrue(secondid + 234)%></td>
			<td width="100" id="235"><%=pds.gettrue(secondid + 235)%></td>
			<td width="100" id="236"><%=pds.gettrue(secondid + 236)%></td>
			<td width="100" id="237"><%=pds.gettrue(secondid + 237)%></td>
			<td width="100" id="238"><%=pds.gettrue(secondid + 238)%></td>
			<td width="100" id="239"><%=pds.gettrue(secondid + 239)%></td>
			<td width="100" id="240"><%=pds.gettrue(secondid + 240)%></td>
			<td width="100" id="241"><%=pds.gettrue(secondid + 241)%></td>
			<td width="100" id="242"><%=pds.gettrue(secondid + 242)%></td>

		</tr>


		<tr>
			<td width="100" id="1s"><%=pds.getpredict(secondid + 1)%></td>
			<td width="100" id="2s"><%=pds.getpredict(secondid + 2)%></td>
			<td width="100" id="3s"><%=pds.getpredict(secondid + 3)%></td>
			<td width="100" id="4s"><%=pds.getpredict(secondid + 4)%></td>
			<td width="100" id="5s"><%=pds.getpredict(secondid + 5)%></td>
			<td width="100" id="6s"><%=pds.getpredict(secondid + 6)%></td>
			<td width="100" id="7s"><%=pds.getpredict(secondid + 7)%></td>
			<td width="100" id="8s"><%=pds.getpredict(secondid + 8)%></td>
			<td width="100" id="9s"><%=pds.getpredict(secondid + 9)%></td>
			<td width="100" id="10s"><%=pds.getpredict(secondid + 10)%></td>
			<td width="100" id="11s"><%=pds.getpredict(secondid + 11)%></td>
			<td width="100" id="12s"><%=pds.getpredict(secondid + 12)%></td>
			<td width="100" id="13s"><%=pds.getpredict(secondid + 13)%></td>
			<td width="100" id="14s"><%=pds.getpredict(secondid + 14)%></td>
			<td width="100" id="15s"><%=pds.getpredict(secondid + 15)%></td>
			<td width="100" id="16s"><%=pds.getpredict(secondid + 16)%></td>
			<td width="100" id="17s"><%=pds.getpredict(secondid + 17)%></td>
			<td width="100" id="18s"><%=pds.getpredict(secondid + 18)%></td>
			<td width="100" id="19s"><%=pds.getpredict(secondid + 19)%></td>
			<td width="100" id="20s"><%=pds.getpredict(secondid + 20)%></td>
			<td width="100" id="21s"><%=pds.getpredict(secondid + 21)%></td>
			<td width="100" id="22s"><%=pds.getpredict(secondid + 22)%></td>
			<td width="100" id="23s"><%=pds.getpredict(secondid + 23)%></td>
			<td width="100" id="24s"><%=pds.getpredict(secondid + 24)%></td>
			<td width="100" id="25s"><%=pds.getpredict(secondid + 25)%></td>
			<td width="100" id="26s"><%=pds.getpredict(secondid + 26)%></td>
			<td width="100" id="27s"><%=pds.getpredict(secondid + 27)%></td>
			<td width="100" id="28s"><%=pds.getpredict(secondid + 28)%></td>
			<td width="100" id="29s"><%=pds.getpredict(secondid + 29)%></td>
			<td width="100" id="30s"><%=pds.getpredict(secondid + 30)%></td>
			<td width="100" id="31s"><%=pds.getpredict(secondid + 31)%></td>
			<td width="100" id="32s"><%=pds.getpredict(secondid + 32)%></td>
			<td width="100" id="33s"><%=pds.getpredict(secondid + 33)%></td>
			<td width="100" id="34s"><%=pds.getpredict(secondid + 34)%></td>
			<td width="100" id="35s"><%=pds.getpredict(secondid + 35)%></td>
			<td width="100" id="36s"><%=pds.getpredict(secondid + 36)%></td>
			<td width="100" id="37s"><%=pds.getpredict(secondid + 37)%></td>
			<td width="100" id="38s"><%=pds.getpredict(secondid + 38)%></td>
			<td width="100" id="39s"><%=pds.getpredict(secondid + 39)%></td>
			<td width="100" id="40s"><%=pds.getpredict(secondid + 40)%></td>
			<td width="100" id="41s"><%=pds.getpredict(secondid + 41)%></td>
			<td width="100" id="42s"><%=pds.getpredict(secondid + 42)%></td>
			<td width="100" id="43s"><%=pds.getpredict(secondid + 43)%></td>
			<td width="100" id="44s"><%=pds.getpredict(secondid + 44)%></td>
			<td width="100" id="45s"><%=pds.getpredict(secondid + 45)%></td>
			<td width="100" id="46s"><%=pds.getpredict(secondid + 46)%></td>
			<td width="100" id="47s"><%=pds.getpredict(secondid + 47)%></td>
			<td width="100" id="48s"><%=pds.getpredict(secondid + 48)%></td>
			<td width="100" id="49s"><%=pds.getpredict(secondid + 49)%></td>
			<td width="100" id="50s"><%=pds.getpredict(secondid + 50)%></td>
			<td width="100" id="51s"><%=pds.getpredict(secondid + 51)%></td>
			<td width="100" id="52s"><%=pds.getpredict(secondid + 52)%></td>
			<td width="100" id="53s"><%=pds.getpredict(secondid + 53)%></td>
			<td width="100" id="54s"><%=pds.getpredict(secondid + 54)%></td>
			<td width="100" id="55s"><%=pds.getpredict(secondid + 55)%></td>
			<td width="100" id="56s"><%=pds.getpredict(secondid + 56)%></td>
			<td width="100" id="57s"><%=pds.getpredict(secondid + 57)%></td>
			<td width="100" id="58s"><%=pds.getpredict(secondid + 58)%></td>
			<td width="100" id="59s"><%=pds.getpredict(secondid + 59)%></td>
			<td width="100" id="60s"><%=pds.getpredict(secondid + 60)%></td>
			<td width="100" id="61s"><%=pds.getpredict(secondid + 61)%></td>
			<td width="100" id="62s"><%=pds.getpredict(secondid + 62)%></td>
			<td width="100" id="63s"><%=pds.getpredict(secondid + 63)%></td>
			<td width="100" id="64s"><%=pds.getpredict(secondid + 64)%></td>
			<td width="100" id="65s"><%=pds.getpredict(secondid + 65)%></td>
			<td width="100" id="66s"><%=pds.getpredict(secondid + 66)%></td>
			<td width="100" id="67s"><%=pds.getpredict(secondid + 67)%></td>
			<td width="100" id="68s"><%=pds.getpredict(secondid + 68)%></td>
			<td width="100" id="69s"><%=pds.getpredict(secondid + 69)%></td>
			<td width="100" id="70s"><%=pds.getpredict(secondid + 70)%></td>
			<td width="100" id="71s"><%=pds.getpredict(secondid + 71)%></td>
			<td width="100" id="72s"><%=pds.getpredict(secondid + 72)%></td>
			<td width="100" id="73s"><%=pds.getpredict(secondid + 73)%></td>
			<td width="100" id="74s"><%=pds.getpredict(secondid + 74)%></td>
			<td width="100" id="75s"><%=pds.getpredict(secondid + 75)%></td>
			<td width="100" id="76s"><%=pds.getpredict(secondid + 76)%></td>
			<td width="100" id="77s"><%=pds.getpredict(secondid + 77)%></td>
			<td width="100" id="78s"><%=pds.getpredict(secondid + 78)%></td>
			<td width="100" id="79s"><%=pds.getpredict(secondid + 79)%></td>
			<td width="100" id="80s"><%=pds.getpredict(secondid + 80)%></td>
			<td width="100" id="81s"><%=pds.getpredict(secondid + 81)%></td>
			<td width="100" id="82s"><%=pds.getpredict(secondid + 82)%></td>
			<td width="100" id="83s"><%=pds.getpredict(secondid + 83)%></td>
			<td width="100" id="84s"><%=pds.getpredict(secondid + 84)%></td>
			<td width="100" id="85s"><%=pds.getpredict(secondid + 85)%></td>
			<td width="100" id="86s"><%=pds.getpredict(secondid + 86)%></td>
			<td width="100" id="87s"><%=pds.getpredict(secondid + 87)%></td>
			<td width="100" id="88s"><%=pds.getpredict(secondid + 88)%></td>
			<td width="100" id="89s"><%=pds.getpredict(secondid + 89)%></td>
			<td width="100" id="90s"><%=pds.getpredict(secondid + 90)%></td>
			<td width="100" id="91s"><%=pds.getpredict(secondid + 91)%></td>
			<td width="100" id="92s"><%=pds.getpredict(secondid + 92)%></td>
			<td width="100" id="93s"><%=pds.getpredict(secondid + 93)%></td>
			<td width="100" id="94s"><%=pds.getpredict(secondid + 94)%></td>
			<td width="100" id="95s"><%=pds.getpredict(secondid + 95)%></td>
			<td width="100" id="96s"><%=pds.getpredict(secondid + 96)%></td>
			<td width="100" id="97s"><%=pds.getpredict(secondid + 97)%></td>
			<td width="100" id="98s"><%=pds.getpredict(secondid + 98)%></td>
			<td width="100" id="99s"><%=pds.getpredict(secondid + 99)%></td>
			<td width="100" id="100s"><%=pds.getpredict(secondid + 100)%></td>
			<td width="100" id="101s"><%=pds.getpredict(secondid + 101)%></td>
			<td width="100" id="102s"><%=pds.getpredict(secondid + 102)%></td>
			<td width="100" id="103s"><%=pds.getpredict(secondid + 103)%></td>
			<td width="100" id="104s"><%=pds.getpredict(secondid + 104)%></td>
			<td width="100" id="105s"><%=pds.getpredict(secondid + 105)%></td>
			<td width="100" id="106s"><%=pds.getpredict(secondid + 106)%></td>
			<td width="100" id="107s"><%=pds.getpredict(secondid + 107)%></td>
			<td width="100" id="108s"><%=pds.getpredict(secondid + 108)%></td>
			<td width="100" id="109s"><%=pds.getpredict(secondid + 109)%></td>
			<td width="100" id="110s"><%=pds.getpredict(secondid + 110)%></td>
			<td width="100" id="111s"><%=pds.getpredict(secondid + 111)%></td>
			<td width="100" id="112s"><%=pds.getpredict(secondid + 112)%></td>
			<td width="100" id="113s"><%=pds.getpredict(secondid + 113)%></td>
			<td width="100" id="114s"><%=pds.getpredict(secondid + 114)%></td>
			<td width="100" id="115s"><%=pds.getpredict(secondid + 115)%></td>
			<td width="100" id="116s"><%=pds.getpredict(secondid + 116)%></td>
			<td width="100" id="117s"><%=pds.getpredict(secondid + 117)%></td>
			<td width="100" id="118s"><%=pds.getpredict(secondid + 118)%></td>
			<td width="100" id="119s"><%=pds.getpredict(secondid + 119)%></td>
			<td width="100" id="120s"><%=pds.getpredict(secondid + 120)%></td>
			<td width="100" id="121s"><%=pds.getpredict(secondid + 121)%></td>
			<td width="100" id="122s"><%=pds.getpredict(secondid + 122)%></td>
			<td width="100" id="123s"><%=pds.getpredict(secondid + 123)%></td>
			<td width="100" id="124s"><%=pds.getpredict(secondid + 124)%></td>
			<td width="100" id="125s"><%=pds.getpredict(secondid + 125)%></td>
			<td width="100" id="126s"><%=pds.getpredict(secondid + 126)%></td>
			<td width="100" id="127s"><%=pds.getpredict(secondid + 127)%></td>
			<td width="100" id="128s"><%=pds.getpredict(secondid + 128)%></td>
			<td width="100" id="129s"><%=pds.getpredict(secondid + 129)%></td>
			<td width="100" id="130s"><%=pds.getpredict(secondid + 130)%></td>
			<td width="100" id="131s"><%=pds.getpredict(secondid + 131)%></td>
			<td width="100" id="132s"><%=pds.getpredict(secondid + 132)%></td>
			<td width="100" id="133s"><%=pds.getpredict(secondid + 133)%></td>
			<td width="100" id="134s"><%=pds.getpredict(secondid + 134)%></td>
			<td width="100" id="135s"><%=pds.getpredict(secondid + 135)%></td>
			<td width="100" id="136s"><%=pds.getpredict(secondid + 136)%></td>
			<td width="100" id="137s"><%=pds.getpredict(secondid + 137)%></td>
			<td width="100" id="138s"><%=pds.getpredict(secondid + 138)%></td>
			<td width="100" id="139s"><%=pds.getpredict(secondid + 139)%></td>
			<td width="100" id="140s"><%=pds.getpredict(secondid + 140)%></td>
			<td width="100" id="141s"><%=pds.getpredict(secondid + 141)%></td>
			<td width="100" id="142s"><%=pds.getpredict(secondid + 142)%></td>
			<td width="100" id="143s"><%=pds.getpredict(secondid + 143)%></td>
			<td width="100" id="144s"><%=pds.getpredict(secondid + 144)%></td>
			<td width="100" id="145s"><%=pds.getpredict(secondid + 145)%></td>
			<td width="100" id="146s"><%=pds.getpredict(secondid + 146)%></td>
			<td width="100" id="147s"><%=pds.getpredict(secondid + 147)%></td>
			<td width="100" id="148s"><%=pds.getpredict(secondid + 148)%></td>
			<td width="100" id="149s"><%=pds.getpredict(secondid + 149)%></td>
			<td width="100" id="150s"><%=pds.getpredict(secondid + 150)%></td>
			<td width="100" id="151s"><%=pds.getpredict(secondid + 151)%></td>
			<td width="100" id="152s"><%=pds.getpredict(secondid + 152)%></td>
			<td width="100" id="153s"><%=pds.getpredict(secondid + 153)%></td>
			<td width="100" id="154s"><%=pds.getpredict(secondid + 154)%></td>
			<td width="100" id="155s"><%=pds.getpredict(secondid + 155)%></td>
			<td width="100" id="156s"><%=pds.getpredict(secondid + 156)%></td>
			<td width="100" id="157s"><%=pds.getpredict(secondid + 157)%></td>
			<td width="100" id="158s"><%=pds.getpredict(secondid + 158)%></td>
			<td width="100" id="159s"><%=pds.getpredict(secondid + 159)%></td>
			<td width="100" id="160s"><%=pds.getpredict(secondid + 160)%></td>
			<td width="100" id="161s"><%=pds.getpredict(secondid + 161)%></td>
			<td width="100" id="162s"><%=pds.getpredict(secondid + 162)%></td>
			<td width="100" id="163s"><%=pds.getpredict(secondid + 163)%></td>
			<td width="100" id="164s"><%=pds.getpredict(secondid + 164)%></td>
			<td width="100" id="165s"><%=pds.getpredict(secondid + 165)%></td>
			<td width="100" id="166s"><%=pds.getpredict(secondid + 166)%></td>
			<td width="100" id="167s"><%=pds.getpredict(secondid + 167)%></td>
			<td width="100" id="168s"><%=pds.getpredict(secondid + 168)%></td>
			<td width="100" id="169s"><%=pds.getpredict(secondid + 169)%></td>
			<td width="100" id="170s"><%=pds.getpredict(secondid + 170)%></td>
			<td width="100" id="171s"><%=pds.getpredict(secondid + 171)%></td>
			<td width="100" id="172s"><%=pds.getpredict(secondid + 172)%></td>
			<td width="100" id="173s"><%=pds.getpredict(secondid + 173)%></td>
			<td width="100" id="174s"><%=pds.getpredict(secondid + 174)%></td>
			<td width="100" id="175s"><%=pds.getpredict(secondid + 175)%></td>
			<td width="100" id="176s"><%=pds.getpredict(secondid + 176)%></td>
			<td width="100" id="177s"><%=pds.getpredict(secondid + 177)%></td>
			<td width="100" id="178s"><%=pds.getpredict(secondid + 178)%></td>
			<td width="100" id="179s"><%=pds.getpredict(secondid + 179)%></td>
			<td width="100" id="180s"><%=pds.getpredict(secondid + 180)%></td>
			<td width="100" id="181s"><%=pds.getpredict(secondid + 181)%></td>
			<td width="100" id="182s"><%=pds.getpredict(secondid + 182)%></td>
			<td width="100" id="183s"><%=pds.getpredict(secondid + 183)%></td>
			<td width="100" id="184s"><%=pds.getpredict(secondid + 184)%></td>
			<td width="100" id="185s"><%=pds.getpredict(secondid + 185)%></td>
			<td width="100" id="186s"><%=pds.getpredict(secondid + 186)%></td>
			<td width="100" id="187s"><%=pds.getpredict(secondid + 187)%></td>
			<td width="100" id="188s"><%=pds.getpredict(secondid + 188)%></td>
			<td width="100" id="189s"><%=pds.getpredict(secondid + 189)%></td>
			<td width="100" id="190s"><%=pds.getpredict(secondid + 190)%></td>
			<td width="100" id="191s"><%=pds.getpredict(secondid + 191)%></td>
			<td width="100" id="192s"><%=pds.getpredict(secondid + 192)%></td>
			<td width="100" id="193s"><%=pds.getpredict(secondid + 193)%></td>
			<td width="100" id="194s"><%=pds.getpredict(secondid + 194)%></td>
			<td width="100" id="195s"><%=pds.getpredict(secondid + 195)%></td>
			<td width="100" id="196s"><%=pds.getpredict(secondid + 196)%></td>
			<td width="100" id="197s"><%=pds.getpredict(secondid + 197)%></td>
			<td width="100" id="198s"><%=pds.getpredict(secondid + 198)%></td>
			<td width="100" id="199s"><%=pds.getpredict(secondid + 199)%></td>
			<td width="100" id="200s"><%=pds.getpredict(secondid + 200)%></td>
			<td width="100" id="201s"><%=pds.getpredict(secondid + 201)%></td>
			<td width="100" id="202s"><%=pds.getpredict(secondid + 202)%></td>
			<td width="100" id="203s"><%=pds.getpredict(secondid + 203)%></td>
			<td width="100" id="204s"><%=pds.getpredict(secondid + 204)%></td>
			<td width="100" id="205s"><%=pds.getpredict(secondid + 205)%></td>
			<td width="100" id="206s"><%=pds.getpredict(secondid + 206)%></td>
			<td width="100" id="207s"><%=pds.getpredict(secondid + 207)%></td>
			<td width="100" id="208s"><%=pds.getpredict(secondid + 208)%></td>
			<td width="100" id="209s"><%=pds.getpredict(secondid + 209)%></td>
			<td width="100" id="210s"><%=pds.getpredict(secondid + 210)%></td>
			<td width="100" id="211s"><%=pds.getpredict(secondid + 211)%></td>
			<td width="100" id="212s"><%=pds.getpredict(secondid + 212)%></td>
			<td width="100" id="213s"><%=pds.getpredict(secondid + 213)%></td>
			<td width="100" id="214s"><%=pds.getpredict(secondid + 214)%></td>
			<td width="100" id="215s"><%=pds.getpredict(secondid + 215)%></td>
			<td width="100" id="216s"><%=pds.getpredict(secondid + 216)%></td>
			<td width="100" id="217s"><%=pds.getpredict(secondid + 217)%></td>
			<td width="100" id="218s"><%=pds.getpredict(secondid + 218)%></td>
			<td width="100" id="219s"><%=pds.getpredict(secondid + 219)%></td>
			<td width="100" id="220s"><%=pds.getpredict(secondid + 220)%></td>
			<td width="100" id="221s"><%=pds.getpredict(secondid + 221)%></td>
			<td width="100" id="222s"><%=pds.getpredict(secondid + 222)%></td>
			<td width="100" id="223s"><%=pds.getpredict(secondid + 223)%></td>
			<td width="100" id="224s"><%=pds.getpredict(secondid + 224)%></td>
			<td width="100" id="225s"><%=pds.getpredict(secondid + 225)%></td>
			<td width="100" id="226s"><%=pds.getpredict(secondid + 226)%></td>
			<td width="100" id="227s"><%=pds.getpredict(secondid + 227)%></td>
			<td width="100" id="228s"><%=pds.getpredict(secondid + 228)%></td>
			<td width="100" id="229s"><%=pds.getpredict(secondid + 229)%></td>
			<td width="100" id="230s"><%=pds.getpredict(secondid + 230)%></td>
			<td width="100" id="231s"><%=pds.getpredict(secondid + 231)%></td>
			<td width="100" id="232s"><%=pds.getpredict(secondid + 232)%></td>
			<td width="100" id="233s"><%=pds.getpredict(secondid + 233)%></td>
			<td width="100" id="234s"><%=pds.getpredict(secondid + 234)%></td>
			<td width="100" id="235s"><%=pds.getpredict(secondid + 235)%></td>
			<td width="100" id="236s"><%=pds.getpredict(secondid + 236)%></td>
			<td width="100" id="237s"><%=pds.getpredict(secondid + 237)%></td>
			<td width="100" id="238s"><%=pds.getpredict(secondid + 238)%></td>
			<td width="100" id="239s"><%=pds.getpredict(secondid + 239)%></td>
			<td width="100" id="240s"><%=pds.getpredict(secondid + 240)%></td>
			<td width="100" id="241s"><%=pds.getpredict(secondid + 241)%></td>
			<td width="100" id="242s"><%=pds.getpredict(secondid + 242)%></td>

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


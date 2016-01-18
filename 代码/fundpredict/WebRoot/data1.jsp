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

	<div style="width:50%">
		<div>
			<canvas id="canvas" height="1024" width="1024"></canvas>
		</div>
	</div>


	<%
		PredictStokcdataDao pds = new PredictStokcdataDao();
		int firstid = 0;
	%>



	<table border="2" width="60%" id="mytable" style="display:none;">

		<!-- 比较股票在2015-10-12,1和2015-10-13,2这两个不同时间段的行情指数 -->

		<tr>
			<td width="100" id="1"><%=pds.gettrue(firstid + 1)%></td>
			<td width="100" id="2"><%=pds.gettrue(firstid + 2)%></td>
			<td width="100" id="3"><%=pds.gettrue(firstid + 3)%></td>
			<td width="100" id="4"><%=pds.gettrue(firstid + 4)%></td>
			<td width="100" id="5"><%=pds.gettrue(firstid + 5)%></td>
			<td width="100" id="6"><%=pds.gettrue(firstid + 6)%></td>
			<td width="100" id="7"><%=pds.gettrue(firstid + 7)%></td>
			<td width="100" id="8"><%=pds.gettrue(firstid + 8)%></td>
			<td width="100" id="9"><%=pds.gettrue(firstid + 9)%></td>
			<td width="100" id="10"><%=pds.gettrue(firstid + 10)%></td>
			<td width="100" id="11"><%=pds.gettrue(firstid + 11)%></td>
			<td width="100" id="12"><%=pds.gettrue(firstid + 12)%></td>
			<td width="100" id="13"><%=pds.gettrue(firstid + 13)%></td>
			<td width="100" id="14"><%=pds.gettrue(firstid + 14)%></td>
			<td width="100" id="15"><%=pds.gettrue(firstid + 15)%></td>
			<td width="100" id="16"><%=pds.gettrue(firstid + 16)%></td>
			<td width="100" id="17"><%=pds.gettrue(firstid + 17)%></td>
			<td width="100" id="18"><%=pds.gettrue(firstid + 18)%></td>
			<td width="100" id="19"><%=pds.gettrue(firstid + 19)%></td>
			<td width="100" id="20"><%=pds.gettrue(firstid + 20)%></td>
			<td width="100" id="21"><%=pds.gettrue(firstid + 21)%></td>
			<td width="100" id="22"><%=pds.gettrue(firstid + 22)%></td>
			<td width="100" id="23"><%=pds.gettrue(firstid + 23)%></td>
			<td width="100" id="24"><%=pds.gettrue(firstid + 24)%></td>
			<td width="100" id="25"><%=pds.gettrue(firstid + 25)%></td>
			<td width="100" id="26"><%=pds.gettrue(firstid + 26)%></td>
			<td width="100" id="27"><%=pds.gettrue(firstid + 27)%></td>
			<td width="100" id="28"><%=pds.gettrue(firstid + 28)%></td>
			<td width="100" id="29"><%=pds.gettrue(firstid + 29)%></td>
			<td width="100" id="30"><%=pds.gettrue(firstid + 30)%></td>
			<td width="100" id="31"><%=pds.gettrue(firstid + 31)%></td>
			<td width="100" id="32"><%=pds.gettrue(firstid + 32)%></td>
			<td width="100" id="33"><%=pds.gettrue(firstid + 33)%></td>
			<td width="100" id="34"><%=pds.gettrue(firstid + 34)%></td>
			<td width="100" id="35"><%=pds.gettrue(firstid + 35)%></td>
			<td width="100" id="36"><%=pds.gettrue(firstid + 36)%></td>
			<td width="100" id="37"><%=pds.gettrue(firstid + 37)%></td>
			<td width="100" id="38"><%=pds.gettrue(firstid + 38)%></td>
			<td width="100" id="39"><%=pds.gettrue(firstid + 39)%></td>
			<td width="100" id="40"><%=pds.gettrue(firstid + 40)%></td>
			<td width="100" id="41"><%=pds.gettrue(firstid + 41)%></td>
			<td width="100" id="42"><%=pds.gettrue(firstid + 42)%></td>
			<td width="100" id="43"><%=pds.gettrue(firstid + 43)%></td>
			<td width="100" id="44"><%=pds.gettrue(firstid + 44)%></td>
			<td width="100" id="45"><%=pds.gettrue(firstid + 45)%></td>
			<td width="100" id="46"><%=pds.gettrue(firstid + 46)%></td>
			<td width="100" id="47"><%=pds.gettrue(firstid + 47)%></td>
			<td width="100" id="48"><%=pds.gettrue(firstid + 48)%></td>
			<td width="100" id="49"><%=pds.gettrue(firstid + 49)%></td>
			<td width="100" id="50"><%=pds.gettrue(firstid + 50)%></td>
			<td width="100" id="51"><%=pds.gettrue(firstid + 51)%></td>
			<td width="100" id="52"><%=pds.gettrue(firstid + 52)%></td>
			<td width="100" id="53"><%=pds.gettrue(firstid + 53)%></td>
			<td width="100" id="54"><%=pds.gettrue(firstid + 54)%></td>
			<td width="100" id="55"><%=pds.gettrue(firstid + 55)%></td>
			<td width="100" id="56"><%=pds.gettrue(firstid + 56)%></td>
			<td width="100" id="57"><%=pds.gettrue(firstid + 57)%></td>
			<td width="100" id="58"><%=pds.gettrue(firstid + 58)%></td>
			<td width="100" id="59"><%=pds.gettrue(firstid + 59)%></td>
			<td width="100" id="60"><%=pds.gettrue(firstid + 60)%></td>
			<td width="100" id="61"><%=pds.gettrue(firstid + 61)%></td>
			<td width="100" id="62"><%=pds.gettrue(firstid + 62)%></td>
			<td width="100" id="63"><%=pds.gettrue(firstid + 63)%></td>
			<td width="100" id="64"><%=pds.gettrue(firstid + 64)%></td>
			<td width="100" id="65"><%=pds.gettrue(firstid + 65)%></td>
			<td width="100" id="66"><%=pds.gettrue(firstid + 66)%></td>
			<td width="100" id="67"><%=pds.gettrue(firstid + 67)%></td>
			<td width="100" id="68"><%=pds.gettrue(firstid + 68)%></td>
			<td width="100" id="69"><%=pds.gettrue(firstid + 69)%></td>
			<td width="100" id="70"><%=pds.gettrue(firstid + 70)%></td>
			<td width="100" id="71"><%=pds.gettrue(firstid + 71)%></td>
			<td width="100" id="72"><%=pds.gettrue(firstid + 72)%></td>
			<td width="100" id="73"><%=pds.gettrue(firstid + 73)%></td>
			<td width="100" id="74"><%=pds.gettrue(firstid + 74)%></td>
			<td width="100" id="75"><%=pds.gettrue(firstid + 75)%></td>
			<td width="100" id="76"><%=pds.gettrue(firstid + 76)%></td>
			<td width="100" id="77"><%=pds.gettrue(firstid + 77)%></td>
			<td width="100" id="78"><%=pds.gettrue(firstid + 78)%></td>
			<td width="100" id="79"><%=pds.gettrue(firstid + 79)%></td>
			<td width="100" id="80"><%=pds.gettrue(firstid + 80)%></td>
			<td width="100" id="81"><%=pds.gettrue(firstid + 81)%></td>
			<td width="100" id="82"><%=pds.gettrue(firstid + 82)%></td>
			<td width="100" id="83"><%=pds.gettrue(firstid + 83)%></td>
			<td width="100" id="84"><%=pds.gettrue(firstid + 84)%></td>
			<td width="100" id="85"><%=pds.gettrue(firstid + 85)%></td>
			<td width="100" id="86"><%=pds.gettrue(firstid + 86)%></td>
			<td width="100" id="87"><%=pds.gettrue(firstid + 87)%></td>
			<td width="100" id="88"><%=pds.gettrue(firstid + 88)%></td>
			<td width="100" id="89"><%=pds.gettrue(firstid + 89)%></td>
			<td width="100" id="90"><%=pds.gettrue(firstid + 90)%></td>
			<td width="100" id="91"><%=pds.gettrue(firstid + 91)%></td>
			<td width="100" id="92"><%=pds.gettrue(firstid + 92)%></td>
			<td width="100" id="93"><%=pds.gettrue(firstid + 93)%></td>
			<td width="100" id="94"><%=pds.gettrue(firstid + 94)%></td>
			<td width="100" id="95"><%=pds.gettrue(firstid + 95)%></td>
			<td width="100" id="96"><%=pds.gettrue(firstid + 96)%></td>
			<td width="100" id="97"><%=pds.gettrue(firstid + 97)%></td>
			<td width="100" id="98"><%=pds.gettrue(firstid + 98)%></td>
			<td width="100" id="99"><%=pds.gettrue(firstid + 99)%></td>
			<td width="100" id="100"><%=pds.gettrue(firstid + 100)%></td>
			<td width="100" id="101"><%=pds.gettrue(firstid + 101)%></td>
			<td width="100" id="102"><%=pds.gettrue(firstid + 102)%></td>
			<td width="100" id="103"><%=pds.gettrue(firstid + 103)%></td>
			<td width="100" id="104"><%=pds.gettrue(firstid + 104)%></td>
			<td width="100" id="105"><%=pds.gettrue(firstid + 105)%></td>
			<td width="100" id="106"><%=pds.gettrue(firstid + 106)%></td>
			<td width="100" id="107"><%=pds.gettrue(firstid + 107)%></td>
			<td width="100" id="108"><%=pds.gettrue(firstid + 108)%></td>
			<td width="100" id="109"><%=pds.gettrue(firstid + 109)%></td>
			<td width="100" id="110"><%=pds.gettrue(firstid + 110)%></td>
			<td width="100" id="111"><%=pds.gettrue(firstid + 111)%></td>
			<td width="100" id="112"><%=pds.gettrue(firstid + 112)%></td>
			<td width="100" id="113"><%=pds.gettrue(firstid + 113)%></td>
			<td width="100" id="114"><%=pds.gettrue(firstid + 114)%></td>
			<td width="100" id="115"><%=pds.gettrue(firstid + 115)%></td>
			<td width="100" id="116"><%=pds.gettrue(firstid + 116)%></td>
			<td width="100" id="117"><%=pds.gettrue(firstid + 117)%></td>
			<td width="100" id="118"><%=pds.gettrue(firstid + 118)%></td>
			<td width="100" id="119"><%=pds.gettrue(firstid + 119)%></td>
			<td width="100" id="120"><%=pds.gettrue(firstid + 120)%></td>
			<td width="100" id="121"><%=pds.gettrue(firstid + 121)%></td>
			<td width="100" id="122"><%=pds.gettrue(firstid + 122)%></td>
			<td width="100" id="123"><%=pds.gettrue(firstid + 123)%></td>
			<td width="100" id="124"><%=pds.gettrue(firstid + 124)%></td>
			<td width="100" id="125"><%=pds.gettrue(firstid + 125)%></td>
			<td width="100" id="126"><%=pds.gettrue(firstid + 126)%></td>
			<td width="100" id="127"><%=pds.gettrue(firstid + 127)%></td>
			<td width="100" id="128"><%=pds.gettrue(firstid + 128)%></td>
			<td width="100" id="129"><%=pds.gettrue(firstid + 129)%></td>
			<td width="100" id="130"><%=pds.gettrue(firstid + 130)%></td>
			<td width="100" id="131"><%=pds.gettrue(firstid + 131)%></td>
			<td width="100" id="132"><%=pds.gettrue(firstid + 132)%></td>
			<td width="100" id="133"><%=pds.gettrue(firstid + 133)%></td>
			<td width="100" id="134"><%=pds.gettrue(firstid + 134)%></td>
			<td width="100" id="135"><%=pds.gettrue(firstid + 135)%></td>
			<td width="100" id="136"><%=pds.gettrue(firstid + 136)%></td>
			<td width="100" id="137"><%=pds.gettrue(firstid + 137)%></td>
			<td width="100" id="138"><%=pds.gettrue(firstid + 138)%></td>
			<td width="100" id="139"><%=pds.gettrue(firstid + 139)%></td>
			<td width="100" id="140"><%=pds.gettrue(firstid + 140)%></td>
			<td width="100" id="141"><%=pds.gettrue(firstid + 141)%></td>
			<td width="100" id="142"><%=pds.gettrue(firstid + 142)%></td>
			<td width="100" id="143"><%=pds.gettrue(firstid + 143)%></td>
			<td width="100" id="144"><%=pds.gettrue(firstid + 144)%></td>
			<td width="100" id="145"><%=pds.gettrue(firstid + 145)%></td>
			<td width="100" id="146"><%=pds.gettrue(firstid + 146)%></td>
			<td width="100" id="147"><%=pds.gettrue(firstid + 147)%></td>
			<td width="100" id="148"><%=pds.gettrue(firstid + 148)%></td>
			<td width="100" id="149"><%=pds.gettrue(firstid + 149)%></td>
			<td width="100" id="150"><%=pds.gettrue(firstid + 150)%></td>
			<td width="100" id="151"><%=pds.gettrue(firstid + 151)%></td>
			<td width="100" id="152"><%=pds.gettrue(firstid + 152)%></td>
			<td width="100" id="153"><%=pds.gettrue(firstid + 153)%></td>
			<td width="100" id="154"><%=pds.gettrue(firstid + 154)%></td>
			<td width="100" id="155"><%=pds.gettrue(firstid + 155)%></td>
			<td width="100" id="156"><%=pds.gettrue(firstid + 156)%></td>
			<td width="100" id="157"><%=pds.gettrue(firstid + 157)%></td>
			<td width="100" id="158"><%=pds.gettrue(firstid + 158)%></td>
			<td width="100" id="159"><%=pds.gettrue(firstid + 159)%></td>
			<td width="100" id="160"><%=pds.gettrue(firstid + 160)%></td>
			<td width="100" id="161"><%=pds.gettrue(firstid + 161)%></td>
			<td width="100" id="162"><%=pds.gettrue(firstid + 162)%></td>
			<td width="100" id="163"><%=pds.gettrue(firstid + 163)%></td>
			<td width="100" id="164"><%=pds.gettrue(firstid + 164)%></td>
			<td width="100" id="165"><%=pds.gettrue(firstid + 165)%></td>
			<td width="100" id="166"><%=pds.gettrue(firstid + 166)%></td>
			<td width="100" id="167"><%=pds.gettrue(firstid + 167)%></td>
			<td width="100" id="168"><%=pds.gettrue(firstid + 168)%></td>
			<td width="100" id="169"><%=pds.gettrue(firstid + 169)%></td>
			<td width="100" id="170"><%=pds.gettrue(firstid + 170)%></td>
			<td width="100" id="171"><%=pds.gettrue(firstid + 171)%></td>
			<td width="100" id="172"><%=pds.gettrue(firstid + 172)%></td>
			<td width="100" id="173"><%=pds.gettrue(firstid + 173)%></td>
			<td width="100" id="174"><%=pds.gettrue(firstid + 174)%></td>
			<td width="100" id="175"><%=pds.gettrue(firstid + 175)%></td>
			<td width="100" id="176"><%=pds.gettrue(firstid + 176)%></td>
			<td width="100" id="177"><%=pds.gettrue(firstid + 177)%></td>
			<td width="100" id="178"><%=pds.gettrue(firstid + 178)%></td>
			<td width="100" id="179"><%=pds.gettrue(firstid + 179)%></td>
			<td width="100" id="180"><%=pds.gettrue(firstid + 180)%></td>
			<td width="100" id="181"><%=pds.gettrue(firstid + 181)%></td>
			<td width="100" id="182"><%=pds.gettrue(firstid + 182)%></td>
			<td width="100" id="183"><%=pds.gettrue(firstid + 183)%></td>
			<td width="100" id="184"><%=pds.gettrue(firstid + 184)%></td>
			<td width="100" id="185"><%=pds.gettrue(firstid + 185)%></td>
			<td width="100" id="186"><%=pds.gettrue(firstid + 186)%></td>
			<td width="100" id="187"><%=pds.gettrue(firstid + 187)%></td>
			<td width="100" id="188"><%=pds.gettrue(firstid + 188)%></td>
			<td width="100" id="189"><%=pds.gettrue(firstid + 189)%></td>
			<td width="100" id="190"><%=pds.gettrue(firstid + 190)%></td>
			<td width="100" id="191"><%=pds.gettrue(firstid + 191)%></td>
			<td width="100" id="192"><%=pds.gettrue(firstid + 192)%></td>
			<td width="100" id="193"><%=pds.gettrue(firstid + 193)%></td>
			<td width="100" id="194"><%=pds.gettrue(firstid + 194)%></td>
			<td width="100" id="195"><%=pds.gettrue(firstid + 195)%></td>
			<td width="100" id="196"><%=pds.gettrue(firstid + 196)%></td>
			<td width="100" id="197"><%=pds.gettrue(firstid + 197)%></td>
			<td width="100" id="198"><%=pds.gettrue(firstid + 198)%></td>
			<td width="100" id="199"><%=pds.gettrue(firstid + 199)%></td>
			<td width="100" id="200"><%=pds.gettrue(firstid + 200)%></td>
			<td width="100" id="201"><%=pds.gettrue(firstid + 201)%></td>
			<td width="100" id="202"><%=pds.gettrue(firstid + 202)%></td>
			<td width="100" id="203"><%=pds.gettrue(firstid + 203)%></td>
			<td width="100" id="204"><%=pds.gettrue(firstid + 204)%></td>
			<td width="100" id="205"><%=pds.gettrue(firstid + 205)%></td>
			<td width="100" id="206"><%=pds.gettrue(firstid + 206)%></td>
			<td width="100" id="207"><%=pds.gettrue(firstid + 207)%></td>
			<td width="100" id="208"><%=pds.gettrue(firstid + 208)%></td>
			<td width="100" id="209"><%=pds.gettrue(firstid + 209)%></td>
			<td width="100" id="210"><%=pds.gettrue(firstid + 210)%></td>
			<td width="100" id="211"><%=pds.gettrue(firstid + 211)%></td>
			<td width="100" id="212"><%=pds.gettrue(firstid + 212)%></td>
			<td width="100" id="213"><%=pds.gettrue(firstid + 213)%></td>
			<td width="100" id="214"><%=pds.gettrue(firstid + 214)%></td>
			<td width="100" id="215"><%=pds.gettrue(firstid + 215)%></td>
			<td width="100" id="216"><%=pds.gettrue(firstid + 216)%></td>
			<td width="100" id="217"><%=pds.gettrue(firstid + 217)%></td>
			<td width="100" id="218"><%=pds.gettrue(firstid + 218)%></td>
			<td width="100" id="219"><%=pds.gettrue(firstid + 219)%></td>
			<td width="100" id="220"><%=pds.gettrue(firstid + 220)%></td>
			<td width="100" id="221"><%=pds.gettrue(firstid + 221)%></td>
			<td width="100" id="222"><%=pds.gettrue(firstid + 222)%></td>
			<td width="100" id="223"><%=pds.gettrue(firstid + 223)%></td>
			<td width="100" id="224"><%=pds.gettrue(firstid + 224)%></td>
			<td width="100" id="225"><%=pds.gettrue(firstid + 225)%></td>
			<td width="100" id="226"><%=pds.gettrue(firstid + 226)%></td>
			<td width="100" id="227"><%=pds.gettrue(firstid + 227)%></td>
			<td width="100" id="228"><%=pds.gettrue(firstid + 228)%></td>
			<td width="100" id="229"><%=pds.gettrue(firstid + 229)%></td>
			<td width="100" id="230"><%=pds.gettrue(firstid + 230)%></td>
			<td width="100" id="231"><%=pds.gettrue(firstid + 231)%></td>
			<td width="100" id="232"><%=pds.gettrue(firstid + 232)%></td>
			<td width="100" id="233"><%=pds.gettrue(firstid + 233)%></td>
			<td width="100" id="234"><%=pds.gettrue(firstid + 234)%></td>
			<td width="100" id="235"><%=pds.gettrue(firstid + 235)%></td>
			<td width="100" id="236"><%=pds.gettrue(firstid + 236)%></td>
			<td width="100" id="237"><%=pds.gettrue(firstid + 237)%></td>
			<td width="100" id="238"><%=pds.gettrue(firstid + 238)%></td>
			<td width="100" id="239"><%=pds.gettrue(firstid + 239)%></td>
			<td width="100" id="240"><%=pds.gettrue(firstid + 240)%></td>
			<td width="100" id="241"><%=pds.gettrue(firstid + 241)%></td>
			<td width="100" id="242"><%=pds.gettrue(firstid + 242)%></td>

		</tr>


		<tr>
			<td width="100" id="1s"><%=pds.getpredict(firstid + 1)%></td>
			<td width="100" id="2s"><%=pds.getpredict(firstid + 2)%></td>
			<td width="100" id="3s"><%=pds.getpredict(firstid + 3)%></td>
			<td width="100" id="4s"><%=pds.getpredict(firstid + 4)%></td>
			<td width="100" id="5s"><%=pds.getpredict(firstid + 5)%></td>
			<td width="100" id="6s"><%=pds.getpredict(firstid + 6)%></td>
			<td width="100" id="7s"><%=pds.getpredict(firstid + 7)%></td>
			<td width="100" id="8s"><%=pds.getpredict(firstid + 8)%></td>
			<td width="100" id="9s"><%=pds.getpredict(firstid + 9)%></td>
			<td width="100" id="10s"><%=pds.getpredict(firstid + 10)%></td>
			<td width="100" id="11s"><%=pds.getpredict(firstid + 11)%></td>
			<td width="100" id="12s"><%=pds.getpredict(firstid + 12)%></td>
			<td width="100" id="13s"><%=pds.getpredict(firstid + 13)%></td>
			<td width="100" id="14s"><%=pds.getpredict(firstid + 14)%></td>
			<td width="100" id="15s"><%=pds.getpredict(firstid + 15)%></td>
			<td width="100" id="16s"><%=pds.getpredict(firstid + 16)%></td>
			<td width="100" id="17s"><%=pds.getpredict(firstid + 17)%></td>
			<td width="100" id="18s"><%=pds.getpredict(firstid + 18)%></td>
			<td width="100" id="19s"><%=pds.getpredict(firstid + 19)%></td>
			<td width="100" id="20s"><%=pds.getpredict(firstid + 20)%></td>
			<td width="100" id="21s"><%=pds.getpredict(firstid + 21)%></td>
			<td width="100" id="22s"><%=pds.getpredict(firstid + 22)%></td>
			<td width="100" id="23s"><%=pds.getpredict(firstid + 23)%></td>
			<td width="100" id="24s"><%=pds.getpredict(firstid + 24)%></td>
			<td width="100" id="25s"><%=pds.getpredict(firstid + 25)%></td>
			<td width="100" id="26s"><%=pds.getpredict(firstid + 26)%></td>
			<td width="100" id="27s"><%=pds.getpredict(firstid + 27)%></td>
			<td width="100" id="28s"><%=pds.getpredict(firstid + 28)%></td>
			<td width="100" id="29s"><%=pds.getpredict(firstid + 29)%></td>
			<td width="100" id="30s"><%=pds.getpredict(firstid + 30)%></td>
			<td width="100" id="31s"><%=pds.getpredict(firstid + 31)%></td>
			<td width="100" id="32s"><%=pds.getpredict(firstid + 32)%></td>
			<td width="100" id="33s"><%=pds.getpredict(firstid + 33)%></td>
			<td width="100" id="34s"><%=pds.getpredict(firstid + 34)%></td>
			<td width="100" id="35s"><%=pds.getpredict(firstid + 35)%></td>
			<td width="100" id="36s"><%=pds.getpredict(firstid + 36)%></td>
			<td width="100" id="37s"><%=pds.getpredict(firstid + 37)%></td>
			<td width="100" id="38s"><%=pds.getpredict(firstid + 38)%></td>
			<td width="100" id="39s"><%=pds.getpredict(firstid + 39)%></td>
			<td width="100" id="40s"><%=pds.getpredict(firstid + 40)%></td>
			<td width="100" id="41s"><%=pds.getpredict(firstid + 41)%></td>
			<td width="100" id="42s"><%=pds.getpredict(firstid + 42)%></td>
			<td width="100" id="43s"><%=pds.getpredict(firstid + 43)%></td>
			<td width="100" id="44s"><%=pds.getpredict(firstid + 44)%></td>
			<td width="100" id="45s"><%=pds.getpredict(firstid + 45)%></td>
			<td width="100" id="46s"><%=pds.getpredict(firstid + 46)%></td>
			<td width="100" id="47s"><%=pds.getpredict(firstid + 47)%></td>
			<td width="100" id="48s"><%=pds.getpredict(firstid + 48)%></td>
			<td width="100" id="49s"><%=pds.getpredict(firstid + 49)%></td>
			<td width="100" id="50s"><%=pds.getpredict(firstid + 50)%></td>
			<td width="100" id="51s"><%=pds.getpredict(firstid + 51)%></td>
			<td width="100" id="52s"><%=pds.getpredict(firstid + 52)%></td>
			<td width="100" id="53s"><%=pds.getpredict(firstid + 53)%></td>
			<td width="100" id="54s"><%=pds.getpredict(firstid + 54)%></td>
			<td width="100" id="55s"><%=pds.getpredict(firstid + 55)%></td>
			<td width="100" id="56s"><%=pds.getpredict(firstid + 56)%></td>
			<td width="100" id="57s"><%=pds.getpredict(firstid + 57)%></td>
			<td width="100" id="58s"><%=pds.getpredict(firstid + 58)%></td>
			<td width="100" id="59s"><%=pds.getpredict(firstid + 59)%></td>
			<td width="100" id="60s"><%=pds.getpredict(firstid + 60)%></td>
			<td width="100" id="61s"><%=pds.getpredict(firstid + 61)%></td>
			<td width="100" id="62s"><%=pds.getpredict(firstid + 62)%></td>
			<td width="100" id="63s"><%=pds.getpredict(firstid + 63)%></td>
			<td width="100" id="64s"><%=pds.getpredict(firstid + 64)%></td>
			<td width="100" id="65s"><%=pds.getpredict(firstid + 65)%></td>
			<td width="100" id="66s"><%=pds.getpredict(firstid + 66)%></td>
			<td width="100" id="67s"><%=pds.getpredict(firstid + 67)%></td>
			<td width="100" id="68s"><%=pds.getpredict(firstid + 68)%></td>
			<td width="100" id="69s"><%=pds.getpredict(firstid + 69)%></td>
			<td width="100" id="70s"><%=pds.getpredict(firstid + 70)%></td>
			<td width="100" id="71s"><%=pds.getpredict(firstid + 71)%></td>
			<td width="100" id="72s"><%=pds.getpredict(firstid + 72)%></td>
			<td width="100" id="73s"><%=pds.getpredict(firstid + 73)%></td>
			<td width="100" id="74s"><%=pds.getpredict(firstid + 74)%></td>
			<td width="100" id="75s"><%=pds.getpredict(firstid + 75)%></td>
			<td width="100" id="76s"><%=pds.getpredict(firstid + 76)%></td>
			<td width="100" id="77s"><%=pds.getpredict(firstid + 77)%></td>
			<td width="100" id="78s"><%=pds.getpredict(firstid + 78)%></td>
			<td width="100" id="79s"><%=pds.getpredict(firstid + 79)%></td>
			<td width="100" id="80s"><%=pds.getpredict(firstid + 80)%></td>
			<td width="100" id="81s"><%=pds.getpredict(firstid + 81)%></td>
			<td width="100" id="82s"><%=pds.getpredict(firstid + 82)%></td>
			<td width="100" id="83s"><%=pds.getpredict(firstid + 83)%></td>
			<td width="100" id="84s"><%=pds.getpredict(firstid + 84)%></td>
			<td width="100" id="85s"><%=pds.getpredict(firstid + 85)%></td>
			<td width="100" id="86s"><%=pds.getpredict(firstid + 86)%></td>
			<td width="100" id="87s"><%=pds.getpredict(firstid + 87)%></td>
			<td width="100" id="88s"><%=pds.getpredict(firstid + 88)%></td>
			<td width="100" id="89s"><%=pds.getpredict(firstid + 89)%></td>
			<td width="100" id="90s"><%=pds.getpredict(firstid + 90)%></td>
			<td width="100" id="91s"><%=pds.getpredict(firstid + 91)%></td>
			<td width="100" id="92s"><%=pds.getpredict(firstid + 92)%></td>
			<td width="100" id="93s"><%=pds.getpredict(firstid + 93)%></td>
			<td width="100" id="94s"><%=pds.getpredict(firstid + 94)%></td>
			<td width="100" id="95s"><%=pds.getpredict(firstid + 95)%></td>
			<td width="100" id="96s"><%=pds.getpredict(firstid + 96)%></td>
			<td width="100" id="97s"><%=pds.getpredict(firstid + 97)%></td>
			<td width="100" id="98s"><%=pds.getpredict(firstid + 98)%></td>
			<td width="100" id="99s"><%=pds.getpredict(firstid + 99)%></td>
			<td width="100" id="100s"><%=pds.getpredict(firstid + 100)%></td>
			<td width="100" id="101s"><%=pds.getpredict(firstid + 101)%></td>
			<td width="100" id="102s"><%=pds.getpredict(firstid + 102)%></td>
			<td width="100" id="103s"><%=pds.getpredict(firstid + 103)%></td>
			<td width="100" id="104s"><%=pds.getpredict(firstid + 104)%></td>
			<td width="100" id="105s"><%=pds.getpredict(firstid + 105)%></td>
			<td width="100" id="106s"><%=pds.getpredict(firstid + 106)%></td>
			<td width="100" id="107s"><%=pds.getpredict(firstid + 107)%></td>
			<td width="100" id="108s"><%=pds.getpredict(firstid + 108)%></td>
			<td width="100" id="109s"><%=pds.getpredict(firstid + 109)%></td>
			<td width="100" id="110s"><%=pds.getpredict(firstid + 110)%></td>
			<td width="100" id="111s"><%=pds.getpredict(firstid + 111)%></td>
			<td width="100" id="112s"><%=pds.getpredict(firstid + 112)%></td>
			<td width="100" id="113s"><%=pds.getpredict(firstid + 113)%></td>
			<td width="100" id="114s"><%=pds.getpredict(firstid + 114)%></td>
			<td width="100" id="115s"><%=pds.getpredict(firstid + 115)%></td>
			<td width="100" id="116s"><%=pds.getpredict(firstid + 116)%></td>
			<td width="100" id="117s"><%=pds.getpredict(firstid + 117)%></td>
			<td width="100" id="118s"><%=pds.getpredict(firstid + 118)%></td>
			<td width="100" id="119s"><%=pds.getpredict(firstid + 119)%></td>
			<td width="100" id="120s"><%=pds.getpredict(firstid + 120)%></td>
			<td width="100" id="121s"><%=pds.getpredict(firstid + 121)%></td>
			<td width="100" id="122s"><%=pds.getpredict(firstid + 122)%></td>
			<td width="100" id="123s"><%=pds.getpredict(firstid + 123)%></td>
			<td width="100" id="124s"><%=pds.getpredict(firstid + 124)%></td>
			<td width="100" id="125s"><%=pds.getpredict(firstid + 125)%></td>
			<td width="100" id="126s"><%=pds.getpredict(firstid + 126)%></td>
			<td width="100" id="127s"><%=pds.getpredict(firstid + 127)%></td>
			<td width="100" id="128s"><%=pds.getpredict(firstid + 128)%></td>
			<td width="100" id="129s"><%=pds.getpredict(firstid + 129)%></td>
			<td width="100" id="130s"><%=pds.getpredict(firstid + 130)%></td>
			<td width="100" id="131s"><%=pds.getpredict(firstid + 131)%></td>
			<td width="100" id="132s"><%=pds.getpredict(firstid + 132)%></td>
			<td width="100" id="133s"><%=pds.getpredict(firstid + 133)%></td>
			<td width="100" id="134s"><%=pds.getpredict(firstid + 134)%></td>
			<td width="100" id="135s"><%=pds.getpredict(firstid + 135)%></td>
			<td width="100" id="136s"><%=pds.getpredict(firstid + 136)%></td>
			<td width="100" id="137s"><%=pds.getpredict(firstid + 137)%></td>
			<td width="100" id="138s"><%=pds.getpredict(firstid + 138)%></td>
			<td width="100" id="139s"><%=pds.getpredict(firstid + 139)%></td>
			<td width="100" id="140s"><%=pds.getpredict(firstid + 140)%></td>
			<td width="100" id="141s"><%=pds.getpredict(firstid + 141)%></td>
			<td width="100" id="142s"><%=pds.getpredict(firstid + 142)%></td>
			<td width="100" id="143s"><%=pds.getpredict(firstid + 143)%></td>
			<td width="100" id="144s"><%=pds.getpredict(firstid + 144)%></td>
			<td width="100" id="145s"><%=pds.getpredict(firstid + 145)%></td>
			<td width="100" id="146s"><%=pds.getpredict(firstid + 146)%></td>
			<td width="100" id="147s"><%=pds.getpredict(firstid + 147)%></td>
			<td width="100" id="148s"><%=pds.getpredict(firstid + 148)%></td>
			<td width="100" id="149s"><%=pds.getpredict(firstid + 149)%></td>
			<td width="100" id="150s"><%=pds.getpredict(firstid + 150)%></td>
			<td width="100" id="151s"><%=pds.getpredict(firstid + 151)%></td>
			<td width="100" id="152s"><%=pds.getpredict(firstid + 152)%></td>
			<td width="100" id="153s"><%=pds.getpredict(firstid + 153)%></td>
			<td width="100" id="154s"><%=pds.getpredict(firstid + 154)%></td>
			<td width="100" id="155s"><%=pds.getpredict(firstid + 155)%></td>
			<td width="100" id="156s"><%=pds.getpredict(firstid + 156)%></td>
			<td width="100" id="157s"><%=pds.getpredict(firstid + 157)%></td>
			<td width="100" id="158s"><%=pds.getpredict(firstid + 158)%></td>
			<td width="100" id="159s"><%=pds.getpredict(firstid + 159)%></td>
			<td width="100" id="160s"><%=pds.getpredict(firstid + 160)%></td>
			<td width="100" id="161s"><%=pds.getpredict(firstid + 161)%></td>
			<td width="100" id="162s"><%=pds.getpredict(firstid + 162)%></td>
			<td width="100" id="163s"><%=pds.getpredict(firstid + 163)%></td>
			<td width="100" id="164s"><%=pds.getpredict(firstid + 164)%></td>
			<td width="100" id="165s"><%=pds.getpredict(firstid + 165)%></td>
			<td width="100" id="166s"><%=pds.getpredict(firstid + 166)%></td>
			<td width="100" id="167s"><%=pds.getpredict(firstid + 167)%></td>
			<td width="100" id="168s"><%=pds.getpredict(firstid + 168)%></td>
			<td width="100" id="169s"><%=pds.getpredict(firstid + 169)%></td>
			<td width="100" id="170s"><%=pds.getpredict(firstid + 170)%></td>
			<td width="100" id="171s"><%=pds.getpredict(firstid + 171)%></td>
			<td width="100" id="172s"><%=pds.getpredict(firstid + 172)%></td>
			<td width="100" id="173s"><%=pds.getpredict(firstid + 173)%></td>
			<td width="100" id="174s"><%=pds.getpredict(firstid + 174)%></td>
			<td width="100" id="175s"><%=pds.getpredict(firstid + 175)%></td>
			<td width="100" id="176s"><%=pds.getpredict(firstid + 176)%></td>
			<td width="100" id="177s"><%=pds.getpredict(firstid + 177)%></td>
			<td width="100" id="178s"><%=pds.getpredict(firstid + 178)%></td>
			<td width="100" id="179s"><%=pds.getpredict(firstid + 179)%></td>
			<td width="100" id="180s"><%=pds.getpredict(firstid + 180)%></td>
			<td width="100" id="181s"><%=pds.getpredict(firstid + 181)%></td>
			<td width="100" id="182s"><%=pds.getpredict(firstid + 182)%></td>
			<td width="100" id="183s"><%=pds.getpredict(firstid + 183)%></td>
			<td width="100" id="184s"><%=pds.getpredict(firstid + 184)%></td>
			<td width="100" id="185s"><%=pds.getpredict(firstid + 185)%></td>
			<td width="100" id="186s"><%=pds.getpredict(firstid + 186)%></td>
			<td width="100" id="187s"><%=pds.getpredict(firstid + 187)%></td>
			<td width="100" id="188s"><%=pds.getpredict(firstid + 188)%></td>
			<td width="100" id="189s"><%=pds.getpredict(firstid + 189)%></td>
			<td width="100" id="190s"><%=pds.getpredict(firstid + 190)%></td>
			<td width="100" id="191s"><%=pds.getpredict(firstid + 191)%></td>
			<td width="100" id="192s"><%=pds.getpredict(firstid + 192)%></td>
			<td width="100" id="193s"><%=pds.getpredict(firstid + 193)%></td>
			<td width="100" id="194s"><%=pds.getpredict(firstid + 194)%></td>
			<td width="100" id="195s"><%=pds.getpredict(firstid + 195)%></td>
			<td width="100" id="196s"><%=pds.getpredict(firstid + 196)%></td>
			<td width="100" id="197s"><%=pds.getpredict(firstid + 197)%></td>
			<td width="100" id="198s"><%=pds.getpredict(firstid + 198)%></td>
			<td width="100" id="199s"><%=pds.getpredict(firstid + 199)%></td>
			<td width="100" id="200s"><%=pds.getpredict(firstid + 200)%></td>
			<td width="100" id="201s"><%=pds.getpredict(firstid + 201)%></td>
			<td width="100" id="202s"><%=pds.getpredict(firstid + 202)%></td>
			<td width="100" id="203s"><%=pds.getpredict(firstid + 203)%></td>
			<td width="100" id="204s"><%=pds.getpredict(firstid + 204)%></td>
			<td width="100" id="205s"><%=pds.getpredict(firstid + 205)%></td>
			<td width="100" id="206s"><%=pds.getpredict(firstid + 206)%></td>
			<td width="100" id="207s"><%=pds.getpredict(firstid + 207)%></td>
			<td width="100" id="208s"><%=pds.getpredict(firstid + 208)%></td>
			<td width="100" id="209s"><%=pds.getpredict(firstid + 209)%></td>
			<td width="100" id="210s"><%=pds.getpredict(firstid + 210)%></td>
			<td width="100" id="211s"><%=pds.getpredict(firstid + 211)%></td>
			<td width="100" id="212s"><%=pds.getpredict(firstid + 212)%></td>
			<td width="100" id="213s"><%=pds.getpredict(firstid + 213)%></td>
			<td width="100" id="214s"><%=pds.getpredict(firstid + 214)%></td>
			<td width="100" id="215s"><%=pds.getpredict(firstid + 215)%></td>
			<td width="100" id="216s"><%=pds.getpredict(firstid + 216)%></td>
			<td width="100" id="217s"><%=pds.getpredict(firstid + 217)%></td>
			<td width="100" id="218s"><%=pds.getpredict(firstid + 218)%></td>
			<td width="100" id="219s"><%=pds.getpredict(firstid + 219)%></td>
			<td width="100" id="220s"><%=pds.getpredict(firstid + 220)%></td>
			<td width="100" id="221s"><%=pds.getpredict(firstid + 221)%></td>
			<td width="100" id="222s"><%=pds.getpredict(firstid + 222)%></td>
			<td width="100" id="223s"><%=pds.getpredict(firstid + 223)%></td>
			<td width="100" id="224s"><%=pds.getpredict(firstid + 224)%></td>
			<td width="100" id="225s"><%=pds.getpredict(firstid + 225)%></td>
			<td width="100" id="226s"><%=pds.getpredict(firstid + 226)%></td>
			<td width="100" id="227s"><%=pds.getpredict(firstid + 227)%></td>
			<td width="100" id="228s"><%=pds.getpredict(firstid + 228)%></td>
			<td width="100" id="229s"><%=pds.getpredict(firstid + 229)%></td>
			<td width="100" id="230s"><%=pds.getpredict(firstid + 230)%></td>
			<td width="100" id="231s"><%=pds.getpredict(firstid + 231)%></td>
			<td width="100" id="232s"><%=pds.getpredict(firstid + 232)%></td>
			<td width="100" id="233s"><%=pds.getpredict(firstid + 233)%></td>
			<td width="100" id="234s"><%=pds.getpredict(firstid + 234)%></td>
			<td width="100" id="235s"><%=pds.getpredict(firstid + 235)%></td>
			<td width="100" id="236s"><%=pds.getpredict(firstid + 236)%></td>
			<td width="100" id="237s"><%=pds.getpredict(firstid + 237)%></td>
			<td width="100" id="238s"><%=pds.getpredict(firstid + 238)%></td>
			<td width="100" id="239s"><%=pds.getpredict(firstid + 239)%></td>
			<td width="100" id="240s"><%=pds.getpredict(firstid + 240)%></td>
			<td width="100" id="241s"><%=pds.getpredict(firstid + 241)%></td>
			<td width="100" id="242s"><%=pds.getpredict(firstid + 242)%></td>

		</tr>

	</table>


	<script>
		/* var randomScalingFactor = function() {
			return Math.round(Math.random() * 100)
		}; */
		var lineChartData = {
			labels : [ "1", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
					"", "", "242", ],
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


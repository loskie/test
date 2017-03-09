<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.som.entity.Prize"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">

<title>奖品列表清单</title>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>


<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-bottom: 40px;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}

.table {
	margin-top: 20px;
}

.table th, .table td {
	text-align: center;
	height: 20px;
}
</style>
<script>
			$(function() {

				$('#addnew').click(function() {

					window.location.href = "addStu.jsp";
				});
			});

			function exchange(id) {
				if(confirm("确定兑换此奖品吗？")) {
					window.location.href = "http://192.168.191.1:8080/learning/prize/exchangePrizeById.action?id=" + id;
					alert("兑换成功！");
				}
			}

			function edit(id) {
				window.location.href = "stu/findStuById1.action?id=" + id;

			}

			function check1(form) {
				with(form) {
					if(id.value == "") {
						alert("学号不能为空！");
						return false;
					}
					return true;
				}
			}

			function check2(form) {
				with(form) {
					if(name.value == "") {
						alert("姓名不能为空！");
						return false;
					}
					return true;
				}
			}
		</script>
</head>

<body>
	 <nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://192.168.191.1:8080/luckysystem1/">抽奖管理系统</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="http://192.168.191.1:8080/luckysystem1/raffle.html">开始抽奖
							<span class="sr-only">(current)</span>
					</a></li>
					<li><a href="http://192.168.191.1:8080/luckysystem1/checkNum.html">检查号码</a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">奖品数据管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="http://192.168.191.1:8080/luckysystem1/IOPrizeData.html">数据导入</a>
							</li>
							<li role="separator" class="divider"></li>
							<li><a
								href="http://192.168.191.1:8080/luckysystem1/prize/outExcell.action">数据导出</a>
							</li>
							<li role="separator" class="divider"></li>
							<li><a
								href="http://192.168.191.1:8080/luckysystem1/prize/findAllPrizes.action">奖品列表</a>
							</li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="查找奖品">
					</div>
					<button type="submit" class="btn btn-default">查找</button>
				</form>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
		</nav>
	<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="page-header">
						<h1 class="">该号码没有中奖或者已兑奖，请核对 </h1><p id="dateSpan" class="text-center"></p>
					</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
	

</body>

</html>
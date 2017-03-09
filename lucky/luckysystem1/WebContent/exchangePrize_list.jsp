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
					window.location.href = "prize/exchangePrizeById.action?id=" + id;
					
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
		<h3 align="center">奖品兑换列表</h3>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
				<form class="form-inline definewidth m20"
					action="stu/findStuById.action" method="post"
					onsubmit="return check1(this)">
					等级： <input type="text" name="id" id="id" class="abc input-default">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span>查询
					</button>
				</form>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
				<form class="form-inline definewidth m20"
					action="stu/findStuByName.action" method="post"
					onsubmit="return check2(this)">
					奖品： <input type="text" name="name" id="name"
						class="abc input-default">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span>查询
					</button>
				</form>
			</div>

		</div>
		<div class="row addAndOut">
			<div class="col-xs-5 col-lg-3">
				<a href="stu/outExcell.action" class="btn btn-success center-block">导出excell表格</a>
			</div>
		</div>
		
		
		<div class="col-xs-12">
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>等级</th>
					<th>赞助商</th>
					<th>奖品名字</th>
					<th>余量</th>
					<th>管理操作</th>
				</tr>
			</thead>
			<%
				List<Prize> prizes = (List<Prize>) request.getAttribute("prizes");
				if (prizes == null || prizes.size() < 1) {
					out.print("没有数据！");
				} else {

					for (Prize p : prizes) {
			%>
			<tr>
				<td><%=p.getGrade()%></td>
				<td><%=p.getSponsor()%></td>
				<td><%=p.getProductname()%></td>
				<td><%=p.getCount() %></td>
				
				<td>
					<button type="button" class="btn btn-success btn-sm" id="exchange"
						onclick="exchange(<%=p.getId()%>)">
						<span class="glyphicon glyphicon-yen"></span>兑换
					</button></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		</div>
		
	</div>

</body>

</html>
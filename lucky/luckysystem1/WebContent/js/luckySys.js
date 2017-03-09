




function ajaxRequest(){
	var inputNum=$("#num").val();
		$.ajax({
			type:"post",
			url:"http://192.168.191.1:8080/learning/luckNum/checkNum.action",
			data:{
				"inputNum":inputNum,
			},
			async:true,
			success:function(data){
				window.location.href="/busasst/user/linestation";
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus);
				   }
			
			
		});
	}
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jQuery 테스트 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		div#displayArea{
		width: 200px;
		height: 200px;
		border: 5px double #6699FF;
		}
	</style>	
	<script src="https:/code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$("button").click(function() {
				$("#displayArea").html("<img src='ansi_main2s.png' border='0'/>");
			});
		});
	</script>
</head>
<body>
	<div id="display area">이곳의 내용이 변경</div>
	<button>표시</button>
</body>
</html>
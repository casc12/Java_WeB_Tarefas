<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Alterar Tarefa </h3>
	<form action="alterarTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}">
		Descrição:<br>
		<textarea name="descricao" rows="100" cols="5"><%--
		 --%>${tarefa.descricao }<%--
		  --%></textarea>
		  <br>
		  Finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : '' }><br>
		  Data de finalização : <br>
		  <input type="text" name="dataFinalizacao" value="<fmt:formateDate value="${tarefa.dataFinalizacao.time }"
		  pattern = "dd/MM/yyyy" />" />
		  <br>
		  <input type="submit" value="Alterar">
	</form>
</body>
</html>
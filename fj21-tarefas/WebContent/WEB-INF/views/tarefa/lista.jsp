<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listando</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
</head>
<body>
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id':id}, function(){
				//Selecionando o elemento HTMl através da
				//ID e alterando o HTMl dele
				$("#tarefa_"+id).html("Finalizado")
			});
		}
	</script>
	<a href="novaTarefa">Criar nova Tarefa</a>
	<br /><br />
	<table>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalizado</th>
			<th>Data de Finalização</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false }">
					<!--<td>Não finalizado</td>-->
					<td id="tarefa_${tarefa.id}">
						<a href="#" onClick="finalizaAgora(${tarefa.id})">
							Finaliza Agora!
						</a>
					</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado</td>
				</c:if>
				<td>
					<fmt:formatDate value="${tarefa.dataFinalizacao.time }" pattern="dd/MM/yyyy"/>
				</td>
				<td><a href="removeTarefa?id=${tarefa.id}">Remove</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id }" >Alterar
				</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
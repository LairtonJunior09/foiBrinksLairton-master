
<%@ page
	import="java.util.*,
br.com.lairton.foiBrinksLairton.database.ClienteDao,
br.com.lairton.foiBrinksLairton.model.Cliente"
	import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Meta tags Obrigatórias -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title> Listar clientes</title>
<style type="text/css">
body {
	background-image: url("BACKGROUND.jpg");
	margin: auto;
	background-color: #cccccc;
	background-repeat: repeat;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.html"> <img src="icon-inicio.png"
			width="30" height="30" class="d-inline-block align-top" alt="">
			FoiBrinks
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img alt="" src="produtos.svg">
						Produtos </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="adicionaProduto.jsp"> <img
							alt="" src="adcproduto.svg"> Adicionar Produto
						</a> <a class="dropdown-item" href="listaProdutos.jsp"> <img alt=""
							src="listar.svg">Listar Produtos
						</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img alt="" src="clientes.svg">
						Clientes </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="adicionaCliente.jsp"> <img
							alt="" src="adcClientes.svg">Adicionar Cliente
						</a> <a class="dropdown-item" href="listaClientes.jsp"> <img
							alt="" src="clientes.svg">Listar Clientes
						</a></li>
				<li class="nav-item"><a class="nav-link " href="sobreNos.html"
					tabindex="-1"> <img alt="" src="quemsomos.svg">Sobre nós
				</a></li>
			</ul>
		</div>
	</nav>
	<div
		style="text-align: center; margin: auto; max-width: 1500px; background-image: linear-gradient(to bottom, #e9e9e9, #ffffff);box-shadow: 6px 5px 8px rgba(0,0,0,0.5);">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nome completo</th>
					<th scope="col">Cpf</th>
					<th scope="col">Gênero</th>
					<th scope="col">Data de nascimento</th>
					<th scope="col">Rua</th>
					<th scope="col">Bairro</th>
					<th scope="col">Cidade</th>
					<th scope="col">Cep</th>
					<th scope="col">Estado</th>
					<th scope="col">Data de cadastro</th>
					<th scope="col">Opções</th>

				</tr>
			</thead>
			<%
				SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
							ClienteDao dao = new ClienteDao();
							List<Cliente> clientes = dao.getLista();
							for (Cliente cliente : clientes ) {
			%>
			<tbody class="item">
				<tr>
					<td><%=cliente.getId_cliente()%></td>
					<td><%=cliente.getNome_completo()%></td>
					<td><%=cliente.getCpf()%></td>
					<td><%=cliente.getGênero()%></td>
					<td><%=sdt.format(cliente.getDataNascimento().getTime())%></td>
					<td><%=cliente.getRua()%></td>
					<td><%=cliente.getBairro()%></td>
					<td><%=cliente.getCidade()%></td>
					<td><%=cliente.getCep()%></td>
					<td><%=cliente.getEstado()%></td>
					<td><%=sdt.format(cliente.getDataCadastro().getTime())%></td>

					<td><a
						href="alteraCliente.jsp?id=<%=cliente.getId_cliente()%>"><i
							class="fas fa-user-edit"></i>Alterar</a></td>
					<td><a
						href="excluiCliente.jsp?id=<%=cliente.getId_cliente()%>"><i
							class="fas fa-user-minus"></i>Remover</a></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>
	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	<audio autoplay loop type="audio/mp3" src="audio/espaco.mp3"></audio>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
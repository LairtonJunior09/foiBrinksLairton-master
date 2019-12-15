
<%@ page
	import="java.util.*,
br.com.lairton.foiBrinksLairton.database.ProdutoDao,
br.com.lairton.foiBrinksLairton.model.Produto"
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
		style="text-align: center; margin: auto; max-width: 1500px; background-image: linear-gradient(to bottom, #e9e9e9, #ffffff);">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nome produto</th>
					<th scope="col">Marca</th>
					<th scope="col">Faixa etária</th>
					<th scope="col">Altura</th>
					<th scope="col">Largura</th>
					<th scope="col">Profundidade</th>
					<th scope="col">Peso</th>
					<th scope="col">Preco</th>
					<th scope="col">Data de cadastro</th>
					<th scope="col">Opções</th>

				</tr>
			</thead>
			<%
				SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
							ProdutoDao dao = new ProdutoDao();
							List<Produto> produtos = dao.getLista();
							for (Produto produto : produtos ) {
			%>
			<tbody class="item">
				<tr>
					<td><%=produto.getId_produto()%></td>
					<td><%=produto.getNomeProduto()%></td>
					<td><%=produto.getMarca()%></td>
					<td><%=produto.getFaixaEtaria()%></td>
					<td><%=produto.getAltura()%></td>
					<td><%=produto.getLargura()%></td>
					<td><%=produto.getProfundidade()%></td>
					<td><%=produto.getPeso()%></td>
					<td><%=produto.getPreco()%></td>
					<td><%=sdt.format(produto.getDataCadastro().getTime())%></td>

					<td><a
						href="alteraProduto.jsp?id=<%=produto.getId_produto()%>"><i
							class="fas fa-user-edit"></i>Alterar</a></td>
					<td><a
						href="excluiProduto.jsp?id=<%=produto.getId_produto()%>"><i
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
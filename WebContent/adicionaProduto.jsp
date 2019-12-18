<!DOCTYPE html>
<html lang="pt-br">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>FoiBrinks</title>
<style type="text/css">
body {
	background-image: url("BACKGROUND.jpg");
	margin: auto;
	background-repeat: repeat;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.html"> <img
			src="icon-inicio.png" width="30" height="30"
			class="d-inline-block align-top" alt=""> FoiBrinks
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
						</a> <a class="dropdown-item" href="listaProdutos.jsp"> <img
							alt="" src="listar.svg">Listar Produtos
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
		style="text-align: center; margin: auto; max-width: 600px; background-image: linear-gradient(to bottom, #e9e9e9, #ffffff); box-shadow: 6px 5px 8px rgba(0, 0, 0, 0.5);""">
		<form action="adcProuto">
			<div class="form-row">
				<div class="form-group col-md-8">
					<label for="inputEmail4">Nome do produto</label> <input type="text"
						required class="form-control" name="nomeProduto"
						placeholder="Ex: Boneca Annabelle">
				</div>
				<div class="container col-md-4">
					<label for="inputPassword4">Marca</label> <input type="text"
						required class="form-control" name="marca"
						placeholder="Ex: Estrela">
				</div>
			</div>

			<div class="form-row">

				<div class="container col-md-4">
					<label for="altura">Alt. do produto</label> <input type="text"
						class="form-control" name="altura" placeholder="Ex: 17cm">
				</div>
				<div class="container col-md-4">
					<label for="largura">Larg. do produto</label> <input type="text"
						class="form-control" name="largura" placeholder="Ex: 28 cm">
				</div>
				<div class="form-group col-md-4 ">
					<label for="profundidade">Prof. do produto</label> <input
						type="text" class="form-control" name="profundidade"
						placeholder="Ex: 55 cm">

				</div>
			</div>


			<div class="form-row">

				<div class="form-group col-md-4">
					<label for="estado">Faixa etária</label> <select name="faixaEtaria"
						class="form-control">
						<option value="">--Selecione--</option>
						<option value="0 anos">A partir de 0 anos</option>
						<option value="2 anos">A partir de 2 anos</option>
						<option value="4 anos">A partir de 4 anos</option>
						<option value="6 anos">A partir de 6 anos</option>
						<option value="A partir de 8 anos">A partir de 8 anos</option>

					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="peso">Peso do produto</label> <input type="text"
						class="form-control" name="peso" placeholder="Ex: 300g">
				</div>

				<div class="form-group col-md-4">
					<label for="preco">Preço do produto</label> <input type="text"
						class="form-control" name="preco" placeholder="Ex: R$:37,50">
				</div>
			</div>


			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck"
						required> <label class="form-check-label" for="gridCheck">
						Declaro que TODAS as informações do produto estão corretas. </label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">
				Cadastrar um novo produto <img alt="" src="salvar.svg">
			</button>
		</form>

	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>
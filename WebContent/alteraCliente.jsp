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
	<%
		SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
		ClienteDao dao = new ClienteDao();
		Cliente cliente = dao.getClienteById(request.getParameter("id"));
	%>

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
						<a class="dropdown-item" href="adicionaClientes.jsp"> <img
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
		style="text-align: center; margin: auto; max-width: 600px; background-image: linear-gradient(to bottom, #e9e9e9, #ffffff); box-shadow: 6px 5px 8px rgba(0, 0, 0, 0.5);">

		<form action="alteraCliente">
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">ID</label> <input type="text"
						class="form-control" name="id_cliente" placeholder="Ex: Id"
						value="<%=cliente.getId_cliente()%>"> <br />
				</div>
				<div class="form-group col-md-7">
					<label for="inputEmail4">Nome Completo</label> <input type="text"
						required class="form-control" name="nome"
						value="<%=cliente.getNome_completo()%>"
						placeholder="Ex: José da Silva">
				</div>
				<div class="container col-md-3">
					<label for="inputPassword4">CPF</label> <input type="text" required
						class="form-control" name="cpf" value="<%=cliente.getCpf()%>"
						placeholder="Ex: 56737202110">

				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputPassword4">Data de nascimento</label> <input
						type="text" class="form-control" name="dataNascimento" required
						value="<%=sdt.format(cliente.getDataCadastro().getTime())%>"
						placeholder="Ex: 13/12/2011">
				</div>
				<div class="container col-md-4">
					<label for="estado">Estado civil</label> <select name="estadoCivil"
						class="form-control">
						<option value="<%=cliente.getEstadoCivil()%>"><%=cliente.getEstadoCivil()%></option>
						<option value="SOLTEIRO">Solteiro</option>
						<option value="CASADO">Casado</option>
						<option value="VIÚVO">Viúvo</option>
						<option value="DIVORCIADO">Divorciado</option>
						<option value="OUTRO">Outro/Não especificado</option>

					</select>
				</div>
				<div class="container col-md-4">
					<label for="estado">Gênero</label> <select name="genero"
						class="form-control">
						<option value="<%=cliente.getGênero()%>"><%=cliente.getGênero()%></option>
						<option value="MASCULINO">Masculino</option>
						<option value="FEMININO">Feminino</option>
						<option value="OUTRO">Outro/Não especificado</option>

					</select>
				</div>
			</div>


			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Rua</label> <input type="text"
						class="form-control" name="rua" placeholder="Ex: Rua Delta"
						value="<%=cliente.getRua()%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputCity">Bairro</label> <input type="text"
						class="form-control" name="bairro" placeholder="Ex: Centro"
						value="<%=cliente.getBairro()%>">
				</div>

			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="cidae">Cidade</label> <input type="text"
						class="form-control" name="cidade" placeholder="Ex: Baixa da égua"
						value="<%=cliente.getCidade()%>">
				</div>
				<div class="form-group col-md-4">
					<label for="estado">Estado(UF)</label> <select name="estado"
						class="form-control">
						<option value="<%=cliente.getEstado()%>"><%=cliente.getEstado()%></option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amapá</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Ceará</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Espirito Santo</option>
						<option value="GO">Goiás</option>
						<option value="MA">Maranhão</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MT">Mato Grosso</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Pará</option>
						<option value="PB">Paraíba</option>
						<option value="PR">Paraná</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piauí</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rondônia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">São Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label for="inputCity">CEP</label> <input type="text"
						class="form-control" name="cep" placeholder="Ex: 22.773-470"
						value="<%=cliente.getCep()%>">
				</div>
			</div>


			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck"
						required> <label class="form-check-label" for="gridCheck">
						Declaro que TODOS os dados informados estão corretos </label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">
				Atualizar cadastro <img alt="" src="salvar.svg"> <i
					class="fas fa-angle-left"></i></a>
			</button>
		</form>


		<script type="text/javascript" src="js/script.js"></script>

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
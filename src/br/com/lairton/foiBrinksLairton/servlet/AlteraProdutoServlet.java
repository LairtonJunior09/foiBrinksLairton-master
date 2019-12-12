package br.com.lairton.foiBrinksLairton.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.lairton.foiBrinksLairton.database.ProdutoDao;
import br.com.lairton.foiBrinksLairton.model.Produto;

public class AlteraProdutoServlet extends HttpServlet {
	

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		Long id_produto = Long.parseLong(request.getParameter("id_produto"));
		String nomeProduto = request.getParameter("nome produto");
		String marca = request.getParameter("marca");
		String faixaEtaria = request.getParameter("faixa etaria");
		double altura = Double.parseDouble(request.getParameter("altura"));
		double largura = Double.parseDouble(request.getParameter("largura"));
		double  profundidade = Double.parseDouble(request.getParameter("profundidade"));
		double peso =Double.parseDouble(request.getParameter("peso"));
		double preco = Double.parseDouble(request.getParameter("pre�o"));
		
		Calendar dataCadastro = Calendar.getInstance();


		Produto produto = new Produto();
		produto.setId_produto(id_produto);
		produto.setNomeProduto(nomeProduto);
		produto.setMarca(marca);
		produto.setFaixaEtaria(faixaEtaria);
		produto.setAltura(altura);
		produto.setLargura(largura);
		produto.setProfundidade(profundidade);
		produto.getPeso();
		produto.getPreco();
		
		produto.setDataCadastro(dataCadastro);


		// salva o contato
		ProdutoDao dao = new ProdutoDao();
		dao.addProduto(produto);

		RequestDispatcher rd = request.getRequestDispatcher("/index.html");
		rd.forward(request, response);
	}
}
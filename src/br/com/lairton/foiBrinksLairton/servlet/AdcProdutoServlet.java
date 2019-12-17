package br.com.lairton.foiBrinksLairton.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.lairton.foiBrinksLairton.database.ProdutoDao;
import br.com.lairton.foiBrinksLairton.model.Produto;

@WebServlet("/adcProuto")
public class AdcProdutoServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		String nomeProduto = request.getParameter("nomeProduto");
		String marca = request.getParameter("marca");
		String faixaEtaria = request.getParameter("faixaEtaria");
		double altura = Double.parseDouble(request.getParameter("altura"));
		double largura = Double.parseDouble(request.getParameter("largura"));
		double profundidade = Double.parseDouble(request
				.getParameter("profundidade"));
		double peso = Double.parseDouble(request.getParameter("peso"));
		double preco = Double.parseDouble(request.getParameter("preco"));

		Calendar dataCadastro = Calendar.getInstance();

		Produto produto = new Produto();
		produto.setNomeProduto(nomeProduto);
		produto.setMarca(marca);
		produto.setFaixaEtaria(faixaEtaria);
		produto.setAltura(altura);
		produto.setLargura(largura);
		produto.setProfundidade(profundidade);
		produto.setPeso(peso);
		produto.setPreco(preco);

		produto.setDataCadastro(dataCadastro);

		ProdutoDao dao = new ProdutoDao();
		dao.addProduto(produto);

		RequestDispatcher rd = request.getRequestDispatcher("/listaProdutos.jsp");
		rd.forward(request, response);
	}
}
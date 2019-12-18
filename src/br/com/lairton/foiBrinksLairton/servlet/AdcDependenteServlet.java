package br.com.lairton.foiBrinksLairton.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.lairton.foiBrinksLairton.database.DependenteDao;
import br.com.lairton.foiBrinksLairton.model.Dependente;

/**
 * Classe responsável por transformar os dados digitados no .jsp em java objects
 * 
 * @author lairton
 * 
 */
@WebServlet("/adcDependente")
public class AdcDependenteServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		Long id_cliente = Long.parseLong(request.getParameter("id_cliente"));
		String nome_completo = request.getParameter("nomeDependente");
		String genero = request.getParameter("genero");
		String dataNasc = request.getParameter("dataNascimento");
		Calendar dataNascimento = null;

		try {
			Date date = (Date) new SimpleDateFormat("dd/MM/yyyy")
					.parse(dataNasc);
			// DataNascimento
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);

		} catch (ParseException e) {
			out.println("Erro de conversão da data");
			return;
		}

		Dependente dependente = new Dependente();
		dependente.setId_cliente(id_cliente);
		dependente.setNome_completo(nome_completo);
		dependente.setGenero(genero);
		dependente.setDataNascimento(dataNascimento);

		DependenteDao dao = new DependenteDao();
		dao.addDependente(dependente);

		RequestDispatcher rd = request
				.getRequestDispatcher("/listaDependentes.jsp");
		rd.forward(request, response);
	}
}
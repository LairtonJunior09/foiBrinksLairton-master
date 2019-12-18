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
@WebServlet("/alteraDependente")
/**
 * Classe responsável por transformar os dados digitados no .jsp em java objects
 * @author lairton
 *
 */
public class AlteraDependenteServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		Long id_dependente = Long.parseLong(request.getParameter("id_dependente"));
		String nome_completo = request.getParameter("nomeDependente");
		String genero = request.getParameter("genero");

		String dataNasc = request.getParameter("dataNascimento");
		Calendar dataNascimento = null;

		Calendar dataCadastro = Calendar.getInstance();

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
		dependente.setNome_completo(nome_completo);

		dependente.setDataNascimento(dataNascimento);

		DependenteDao dao = new DependenteDao();
		dao.addDependente(dependente);

		RequestDispatcher rd = request.getRequestDispatcher("/listaDependente.jsp");
		rd.forward(request, response);
	}
}
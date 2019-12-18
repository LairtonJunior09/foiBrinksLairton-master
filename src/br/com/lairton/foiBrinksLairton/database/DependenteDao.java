package br.com.lairton.foiBrinksLairton.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.lairton.foiBrinksLairton.model.Dependente;

/**
 * Classe responsável por realizar as operações do banco de dados
 * 
 * @author lairton
 * 
 */
public class DependenteDao {
	private Connection connection;

	public DependenteDao() {
		connection = new ConnectionFactory().getConnection();

	}

	/**
	 * Método responsável por adicionar um cliente ao banco de dados
	 * 
	 * @author lairton
	 * 
	 */

	public void addDependente(Dependente dependente) {
		String bd = "INSERT INTO `dependente_cliente` (`nomeDependente`,`gênero`, "
				+ " `dataNascimento`) " + "VALUES (?,?,?)";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);

			prepState.setString(1, dependente.getNome_completo());
			prepState.setString(2, dependente.getGenero());
			prepState.setDate(3, new Date(dependente.getDataNascimento()
					.getTimeInMillis()));

			prepState.execute();
			prepState.close();

		} catch (SQLException exp) {
			throw new RuntimeException(exp);
		}
	}

	/**
	 * Método responsável por alterar as informações do cliente no banco de
	 * dados
	 * 
	 * @author lairton
	 * 
	 */
	public void updateDependente(Dependente dependente) {
		String bd = "UPDATE `dependente` SET `nome_completo`=?,"
				+ "`gênero`=?," + "`dataNascimento`=?,`WHERE `id_dependente`=?";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setString(1, dependente.getNome_completo());

			prepState.setString(2, dependente.getGenero());

			prepState.setDate(3, new Date(dependente.getDataNascimento()
					.getTimeInMillis()));

			prepState.setLong(12, dependente.getId_dependente());
			prepState.execute();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método responsável por apagar um cliente do banco de dados
	 * 
	 * @author lairton
	 * 
	 */
	public void DeletDependente(Dependente dependente) {
		String bd = "delete from clientes where id_dependente = ?";
		try {
			PreparedStatement prepState = connection.prepareStatement(bd);

			prepState.setLong(1, dependente.getId_dependente());
			prepState.execute();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método responsável por realizar a busca de um cliente pela String id no
	 * banco de dados
	 * 
	 * @author lairton
	 * 
	 */
	public Dependente getDependenteById(String id) {
		Dependente dependente = new Dependente();
		String bd = "Select * from dependentes where id_dependente = ?";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setLong(1, Long.parseLong(id));
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {
				dependente.setId_dependente(rs.getLong("id_dependente"));
				dependente.setNome_completo(rs.getString("nomeDependente"));
				dependente.setGenero(rs.getString("gênero"));
				Calendar data = Calendar.getInstance();
				dependente.setDataNascimento(data);
				data.setTime(rs.getDate("dataNascimento"));

			}
			rs.close();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return dependente;
	}

	/**
	 * Método responsável listar todos os clientes do banco de dados
	 * 
	 * @author lairton
	 * 
	 */
	public List<Dependente> getLista() {
		try {
			List<Dependente> dependentes = new ArrayList<Dependente>();
			PreparedStatement prepState = this.connection
					.prepareStatement("SELECT * FROM `dependentes` ");
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {

				Dependente dependente = new Dependente();
				dependente.setId_dependente(rs.getLong("id_dependente"));
				dependente.setNome_completo(rs.getString("nome_completo"));
				dependente.setGenero(rs.getString("gênero"));

				Calendar dataNascimento = Calendar.getInstance();

				dataNascimento.setTime(rs.getDate("dataNascimento"));

				dependente.setDataNascimento(dataNascimento);

				

				dependentes.add(dependente);
			}
			rs.close();
			prepState.close();
			return dependentes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

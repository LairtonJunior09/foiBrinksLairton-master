package br.com.lairton.foiBrinksLairton.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * Classe respons�vel por criar a conex�o com o banco de dados
 * @author lairton
 *
 */
public class ConnectionFactory {
	/**
	 * M�todo respons�vel por retornar uma conex�o ativa com o banco de dados
	 * @author lairton
	 *
	 */
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/lairtonfoibrinks", "root", "");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}

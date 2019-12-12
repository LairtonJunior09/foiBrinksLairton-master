package br.com.lairton.foiBrinksLairton.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.lairton.foiBrinksLairton.model.Produto;

public class ProdutoDao {
	private Connection connection;

	public ProdutoDao() {
		connection = new ConnectionFactory().getConnection();

	}

	public void addProduto(Produto produto) {
		String bd = "INSERT INTO `produtos`(`nomeProduto`, `marca`, `faixaEtaria`, `altura`,"
				+ " `largura`, `profundidade`, `peso`, `preco`, `dataCadastro`)"
				+ " VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setString(1, produto.getNomeProduto());
			prepState.setString(2, produto.getMarca());
			prepState.setString(3, produto.getFaixaEtaria());
			prepState.setLong(4, (long) produto.getAltura());
			prepState.setLong(5, (long) produto.getLargura());
			prepState.setLong(6, (long) produto.getProfundidade());
			prepState.setLong(7, (long) produto.getPeso());
			prepState.setLong(8, (long) produto.getPreco());
			prepState.setDate(9, new Date(produto.getDataCadastro()
					.getTimeInMillis()));

			prepState.execute();
			prepState.close();

		} catch (SQLException exp) {
		}
	}

	public void updateProduto(Produto produto) {
		String bd = "UPDATE `produtos` SET `nomeProduto`=?,`marca`=?,`faixaEtaria`=?,"
				+ "`altura`=?,`largura`=?,`profundidade`=?,`peso`=?,`preco`=?,`dataCadastro`=?"
				+ " WHERE `id_produto`=?";
		try {

			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setString(1, produto.getNomeProduto());
			prepState.setString(2, produto.getMarca());
			prepState.setString(3, produto.getFaixaEtaria());
			prepState.setLong(4, (long) produto.getAltura());
			prepState.setLong(5, (long) produto.getLargura());
			prepState.setLong(6, (long) produto.getProfundidade());
			prepState.setLong(7, (long) produto.getPeso());
			prepState.setLong(8, (long) produto.getPreco());
			prepState.setDate(9, new Date(produto.getDataCadastro()
					.getTimeInMillis()));
			prepState.setLong(11, produto.getId_produto());

			prepState.execute();
			prepState.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void DeletProduct(Produto produto) {
		String bd = "DELETE FROM `produtos` WHERE  `id_produto`=?";
		try {
			PreparedStatement prepState = connection.prepareStatement(bd);

			prepState.setLong(1, produto.getId_produto());
			prepState.execute();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto getProdutoById(String id) {
		Produto produto = new Produto();
		String bd = "SELECT FROM `produtos` WHERE  `id_produto`=?";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setLong(1, Long.parseLong(id));
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {
				produto.setId_produto(rs.getLong("Id"));
				produto.setNomeProduto(rs.getString("Nome"));
				produto.setMarca(rs.getString("Marca do Produto"));
				produto.setFaixaEtaria(rs.getString("Faixa Etária"));
				produto.setAltura(rs.getDouble("Altura"));
				produto.setLargura(rs.getDouble("Largura"));
				produto.setProfundidade(rs.getDouble("Profundidade"));
				produto.setPreco(rs.getDouble("Preço R$"));

				Calendar data = Calendar.getInstance();
				produto.setDataCadastro(data);
				data.setTime(rs.getDate("Data Cadastro"));

			}
			rs.close();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return produto;
	}

	public List<Produto> getLista() {
		try {
			List<Produto> produtos = new ArrayList<Produto>();
			PreparedStatement prepState = this.connection
					.prepareStatement("SELECT FROM `produtos` WHERE  `id_produto`=?");
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId_produto(rs.getLong("Id"));
				produto.setNomeProduto(rs.getString("Nome"));
				produto.setMarca(rs.getString("Marca do Produto"));
				produto.setFaixaEtaria(rs.getString("Faixa Etária"));
				produto.setAltura(rs.getDouble("Altura"));
				produto.setLargura(rs.getDouble("Largura"));
				produto.setProfundidade(rs.getDouble("Profundidade"));
				produto.setPreco(rs.getDouble("Preço R$"));

				Calendar data = Calendar.getInstance();
				produto.setDataCadastro(data);
				data.setTime(rs.getDate("Data Cadastro"));
				;

				produtos.add(produto);
			}
			rs.close();
			prepState.close();
			return produtos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

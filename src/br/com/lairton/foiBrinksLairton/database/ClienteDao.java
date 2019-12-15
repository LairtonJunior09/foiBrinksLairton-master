package br.com.lairton.foiBrinksLairton.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.lairton.foiBrinksLairton.model.Cliente;

public class ClienteDao {
	private Connection connection;

	public ClienteDao() {
		connection = new ConnectionFactory().getConnection();

	}

	public void addCliente(Cliente cliente) {
		String bd = "INSERT INTO `clientes`(`nome_completo`, `estadoCivil`, `gênero`, `rua`,"
				+ " `bairro`, `cep`, `estado`, `cidade`, `cpf`, `dataNascimento`, `dataCadastro`) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);

			prepState.setString(1, cliente.getNome_completo());
			prepState.setString(2, cliente.getEstadoCivil());
			prepState.setString(3, cliente.getGênero());
			prepState.setString(4, cliente.getRua());
			prepState.setString(5, cliente.getBairro());
			prepState.setString(6, cliente.getCep());
			prepState.setString(7, cliente.getEstado());
			prepState.setString(8, cliente.getCidade());
			prepState.setString(9, cliente.getCpf());
			prepState.setDate(10, new Date(cliente.getDataNascimento()
					.getTimeInMillis()));
			prepState.setDate(11, new Date(cliente.getDataCadastro()
					.getTimeInMillis()));

			prepState.execute();
			prepState.close();

		} catch (SQLException exp) {
			throw new RuntimeException(exp);
		}
	}

	public void updateCliente(Cliente cliente) {
		String bd = "UPDATE `clientes` SET `nome_completo`=?,`estadoCivil`=?,"
				+ "`gênero`=?,`rua`=?,`bairro`=?,`cep`=?,`estado`=?,`cidade`=?,`cpf`=?,"
				+ "`dataNascimento`=?,`dataCadastro`=? WHERE `id_cliente`=?";
		
		
		
		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setString(1, cliente.getNome_completo());
			prepState.setString(2, cliente.getEstadoCivil());
			prepState.setString(3, cliente.getGênero());
			prepState.setString(4, cliente.getRua());
			prepState.setString(5, cliente.getBairro());
			prepState.setString(6, cliente.getCep());
			prepState.setString(7, cliente.getEstado());
			prepState.setString(8, cliente.getCidade());
			prepState.setString(9, cliente.getCpf());

			prepState.setDate(10, new Date(cliente.getDataNascimento()
					.getTimeInMillis()));
			prepState.setDate(11, new Date(cliente.getDataCadastro()
					.getTimeInMillis()));
			prepState.setLong(12, cliente.getId_cliente());
			prepState.execute();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void DeletCliente(Cliente cliente) {
		String bd = "Delete * from clientes where id_cliente = ?";
		try {
			PreparedStatement prepState = connection.prepareStatement(bd);

			prepState.setLong(1, cliente.getId_cliente());
			prepState.execute();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Cliente getClienteById(String id) {
		Cliente cliente = new Cliente();
		String bd = "Select * from clientes where id_cliente = ?";

		try {
			PreparedStatement prepState = connection.prepareStatement(bd);
			prepState.setLong(1, Long.parseLong(id));
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {
				cliente.setId_cliente(rs.getLong("id_cliente"));
				cliente.setNome_completo(rs.getString("nome_completo"));
				cliente.setEstadoCivil(rs.getString("estadoCivil"));
				cliente.setGênero(rs.getString("gênero"));
				cliente.setRua(rs.getString("rua"));
				cliente.setBairro(rs.getString("bairro"));
				cliente.setCep(rs.getString("cep"));
				cliente.setEstado(rs.getString("estado"));
				cliente.setCpf(rs.getString("cpf"));

				Calendar data = Calendar.getInstance();
				cliente.setDataNascimento(data);
				data.setTime(rs.getDate("dataNascimento"));
				cliente.setDataCadastro(data);
				data.setTime(rs.getDate("dataCadastro"));

			}
			rs.close();
			prepState.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return cliente;
	}

	public List<Cliente> getLista() {
		try {
			List<Cliente> clientes = new ArrayList<Cliente>();
			PreparedStatement prepState = this.connection
					.prepareStatement("SELECT * FROM `clientes` ");
			ResultSet rs = prepState.executeQuery();

			while (rs.next()) {

				Cliente cliente = new Cliente();
				cliente.setId_cliente(rs.getLong("id_cliente"));
				cliente.setNome_completo(rs.getString("nome_completo"));
				cliente.setEstadoCivil(rs.getString("estadoCivil"));
				cliente.setGênero(rs.getString("gênero"));
				cliente.setRua(rs.getString("rua"));
				cliente.setBairro(rs.getString("bairro"));
				cliente.setCep(rs.getString("cep"));
				cliente.setEstado(rs.getString("estado"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setCidade(rs.getString("cidade"));
				
				Calendar dataNascimento = Calendar.getInstance();

				dataNascimento.setTime(rs.getDate("dataNascimento"));

				cliente.setDataNascimento(dataNascimento);


				Calendar dataCadastro = Calendar.getInstance();

				dataCadastro.setTime(rs.getDate("dataCadastro"));

				cliente.setDataCadastro(dataCadastro);

				clientes.add(cliente);
			}
			rs.close();
			prepState.close();
			return clientes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

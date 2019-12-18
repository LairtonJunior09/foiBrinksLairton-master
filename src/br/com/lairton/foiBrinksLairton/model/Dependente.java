package br.com.lairton.foiBrinksLairton.model;

import java.util.Calendar;

/**
 * Classe responsável por criar um modelo da entidade 'dependente' no banco de
 * dados
 * 
 * @author lairton
 * 
 */
public class Dependente {
	private long id_dependente;
	private long id_cliente;
	private String nome_completo;
	private String genero;
	private Calendar dataNascimento;

	public long getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}

	public long getId_dependente() {
		return id_dependente;
	}

	public void setId_dependente(long id_dependente) {
		this.id_dependente = id_dependente;
	}

	public String getNome_completo() {
		return nome_completo;
	}

	public void setNome_completo(String nome_completo) {
		this.nome_completo = nome_completo;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public Calendar getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Calendar dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

}

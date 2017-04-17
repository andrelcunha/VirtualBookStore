/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connectionfactory.connection;
import domain.LivroDom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author deko
 */
public class LivroDAO {
    
    public void SalvaLivro(LivroDom livro) throws SQLException, 
            ClassNotFoundException{
        String sqlstr = String.format("INSERT INTO public.livro(" +
        "nome, senha) VALUES ( '%s', '%s');",
                livro.getTitulo(),
                livro.getAutor(),
                Integer.toString(livro.getAno()),
                Double.toString(livro.getPreco()),
                livro.getFoto(),
                Integer.toString(livro.getIdEditora())
        );
        ExecutaInsert(sqlstr);
    }
    public LivroDom[] ConsultaLivroTitulo(LivroDom livro) throws SQLException, 
            ClassNotFoundException{
        String sqlstr = String.format("SELECT FROM public.livro "
                + "WHERE titulo='%s'", livro.getTitulo());
        ResultSet rs = ExecutaSelect(sqlstr);
        rs.last();
        int size = rs.getRow();
        LivroDom[] livros_encontrados = new LivroDom[size];
        rs.first();
        for(int i=0;i<size;i++)
            {
                livros_encontrados[i].setId(rs.getInt("id"));
                livros_encontrados[i].setTitulo(rs.getString("titulo"));
                livros_encontrados[i].setAutor(rs.getString("autor"));
                livros_encontrados[i].setAno(rs.getInt("ano"));
                livros_encontrados[i].setPreco(rs.getDouble("preco"));
                livros_encontrados[i].setFoto(rs.getString("foto"));
                livros_encontrados[i].setIdEditora(rs.getInt("idEditora"));
                rs.next();
            }
        return livros_encontrados;
    }
    private ResultSet ExecutaSelect(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeQuery(sqlstr);
            
    }
    private int ExecutaInsert(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeUpdate(sqlstr);
    }
}


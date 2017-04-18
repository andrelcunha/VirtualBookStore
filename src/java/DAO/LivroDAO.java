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
        ArrayList<LivroDom> array = new ArrayList<>();
        while(rs.next()){
            
            LivroDom tmp = new LivroDom();
            tmp.setId(rs.getInt("id"));
            tmp.setTitulo(rs.getString("titulo"));
            tmp.setAutor(rs.getString("autor"));
            tmp.setAno(rs.getInt("ano"));
            tmp.setPreco(rs.getDouble("preco"));
            tmp.setFoto(rs.getString("foto"));
            tmp.setIdEditora(rs.getInt("idEditora"));
            array.add(tmp);
        }
        LivroDom[] livros_encontrados = array.toArray(new LivroDom[array.size()]);
        return livros_encontrados;
    }
    private ResultSet ExecutaSelect(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeQuery(sqlstr);
            
    }
    private int ExecutaInsert(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.prepareCall(sqlstr, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                return st.executeUpdate(sqlstr);
    }
}


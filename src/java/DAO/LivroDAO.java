/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import domain.LivroDom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;
/**
 *
 * @author deko
 */
public class LivroDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public void setConnection(Connection con){
        this.con = con;
    }  
    
    public void salvaLivro(LivroDom livro){
        try{
            if (livro.getId()==0){// id = 0 means it is a new book.
                ps = con.prepareStatement("INSERT INTO public.livro("
                + " titulo,"
                + " autor,"
                + " ano,"
                + " preco,"
                + " foto,"
                + " \"idEditora\" )"
                + " VALUES ( ?, ?,?,?,?,?);");
        }else{
            ps = con.prepareStatement("UPDATE public.livro"
                + " SET titulo=?,"
                + " autor=?,"
                + " ano=?,"
                + " preco=?,"
                + " foto=?,"
                + " \"idEditora\"=?"
                + " WHERE id=?;");
            ps.setString(7,String.format("%d",livro.getId()));
        }
        ps.setString(1,livro.getTitulo());
        ps.setString(2,livro.getAutor());
        ps.setString(3,String.format("%d",livro.getAno()));
        ps.setString(4,String.format(Locale.ROOT,"%.2f",livro.getPreco()));
        ps.setString(5,livro.getFoto());
        ps.setString(6,String.format("%d",livro.getIdEditora()));
        ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public LivroDom[] ConsultaLivro(LivroDom livro) throws SQLException{
        LivroDom[] livros_encontrados;
            String sql = "SELECT * FROM public.livro ";
            if (!livro.getTitulo().equals("")){
                sql += "WHERE titulo LIKE '%%"+livro.getTitulo();
                sql += "%%' ORDER BY id ASC";
            }
            sql+=";";
            ps = con.prepareStatement(sql);
            //ps.setString(1, livro.getTitulo());
            rs = ps.executeQuery();
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
            livros_encontrados = array.toArray(new LivroDom[array.size()]);
        
        return livros_encontrados;
    }
    
    public String getNextFoto() throws SQLException, ClassNotFoundException{
        String sFoto=null;
        ps = con.prepareStatement("SELECT id from livro " +
                                    "order by id desc limit 1;");
        rs = ps.executeQuery();
        while(rs.next()){
            sFoto=String.format("%06d",rs.getInt(1)+1);
        }
        return sFoto;
    }
    
}


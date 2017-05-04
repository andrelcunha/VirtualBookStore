/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author deko
 */
import domain.UsuarioDom;
import java.sql.*;


public class UsuarioDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public void setConnection(Connection con){
        this.con = con;
    }
    public void SalvaUsuario(UsuarioDom usuario){
       try{
            ps = con.prepareStatement("INSERT INTO public.usuario(" +
            "nome, senha) VALUES ( ?, ?);");
            ps.setString(1,usuario.getNome());
            ps.setString(2,usuario.getSenha());
            rs = ps.executeQuery();
       }catch(SQLException e){
           e.printStackTrace();
       }
    }
    
    public int ConsultaUsuario(String usuario,String senha) {
        int qtde;
        try{
            ps  = con.prepareStatement("SELECT COUNT(*) as qtde "
                    + "FROM public.usuario WHERE nome=? AND senha=?");
            ps.setString(1,usuario);
            ps.setString(2,senha);
            rs = ps.executeQuery();
            rs.next();
            qtde = rs.getInt("qtde");
            
            //0 - user not found;
            //1 - user found and authenticated 
            return qtde;  
        }catch(SQLException e){
            e.printStackTrace();
            return -1;
        }
    }
}


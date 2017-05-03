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
import domain.EditoraDom;
import java.sql.*;
import java.util.ArrayList;


public class EditoraDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    public void setConection(Connection con){
        this.con = con;
    }
    public void salvaEditora(EditoraDom editora){   
        try{
            ps = con.prepareStatement("INSERT INTO public.editora(" +
                " nome, cidade)" +
                " VALUES ( ?, ?);");
            ps.setString(1,editora.getNome());
            ps.setString(2,editora.getCidade());
            rs=ps.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public EditoraDom[] listaEditora() throws SQLException, ClassNotFoundException{
        EditoraDom[] editoras_encontradas = null;
        try{
            ps = con.prepareStatement("SELECT * FROM public.editora ORDER BY id;");
            rs = ps.executeQuery();
            ArrayList <EditoraDom> array = new ArrayList<>();
            while(rs.next()){
                EditoraDom tmp = new EditoraDom();
                tmp.setId(rs.getInt("id"));
                tmp.setNome(rs.getString("nome"));
                tmp.setCidade(rs.getString("cidade"));
                array.add(tmp);
            }
            editoras_encontradas = (EditoraDom[]) array.toArray(new EditoraDom[array.size()]);
            return editoras_encontradas;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return editoras_encontradas;
    }
       


    }


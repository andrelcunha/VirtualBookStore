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
import connectionfactory.connection;
import domain.EditoraDom;
import java.sql.*;
import java.util.ArrayList;


public class EditoraDAO {
    
    public void salvaEditora(EditoraDom editora) throws SQLException, ClassNotFoundException{   
        String sqlstr = String.format("INSERT INTO public.editora(" +
        " nome, cidade)" +
        " VALUES ( '%s', '%s');",editora.getNome(),editora.getCidade());
        ExecutaInsert(sqlstr);
    }
    
    
    public EditoraDom[] listaEditora() throws SQLException, ClassNotFoundException{
        String sqlstr = "SELECT * FROM public.editora";
        ResultSet rs = ExecutaSelect(sqlstr);
        rs.last();
        int size = rs.getRow();
        EditoraDom[] editoras_encontradas = new EditoraDom[size];
        rs.first();
        for(int i=0;i<size;i++)
            {
                editoras_encontradas[i].setId(rs.getInt("id"));
                editoras_encontradas[i].setNome(rs.getString("nome"));
                editoras_encontradas[i].setCidade(rs.getString("cidade"));
            }
        return editoras_encontradas;
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


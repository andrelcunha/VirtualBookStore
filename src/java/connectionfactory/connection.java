/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package connectionfactory;

import java.sql.*;

/**
 *
 * @author deko
 */
public class connection {
///Disponibiliza conexao atraves do get.    

    Connection con;
    private static final String CONN_URL = "jdbc:postgresql://localhost/CatalogoLivros";
    private static final String CONN_USR="sa_catalogolivros";
    private static final String CONN_PWD="saciperere";
    private static final String CONN_DRIVER="org.postgresql.Driver";
    
    public boolean connect() throws SQLException{
            try{
                Class.forName(CONN_DRIVER);
                con = DriverManager.getConnection(CONN_URL,CONN_USR, CONN_PWD);
                return true;
            }catch (ClassNotFoundException e){
                e.printStackTrace();
                return false;
            }
    }
    public void close(){
        try{
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public Connection getCon() throws SQLException{
        return con;
    }
}




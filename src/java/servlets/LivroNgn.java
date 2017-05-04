/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LivroDAO;
import connectionfactory.connection;
import domain.LivroDom;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Enumeration;
import org.json.simple.JSONObject;

/**
 *
 * @author deko
 */
@WebServlet(name = "LivroNgn", urlPatterns = {"/LivroNgn"})
public class LivroNgn extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        PrintWriter out = response.getWriter( );
        response.setContentType("text/html");
        LivroDom livro;
        LivroDAO ldao;
        ldao = new LivroDAO();
        connection con = new connection();
            if (con.connect()){
                ldao.setConnection(con.getCon());
            
            livro = new LivroDom();
            livro.setId(0);
            Enumeration paramNames = request.getParameterNames();
            while(paramNames.hasMoreElements()){
                String paramName=(String)paramNames.nextElement();
                switch (paramName) {
                    case "id":
                        livro.setId(Integer.parseInt(request.getParameter("id")));
                        break;
                    case "titulo":
                        livro.setTitulo(request.getParameter("titulo"));
                        break;
                    case "autor":
                        livro.setAutor(request.getParameter("autor"));
                        break;
                    case "ano":
                        livro.setAno(Integer.parseInt(request.getParameter("ano")));
                        break;
                    case "preco":
                        String tmp=request.getParameter("preco");
                        livro.setPreco(Double.parseDouble(tmp.replace(",",".")));
                        break;
                    case "foto":
                        livro.setFoto(request.getParameter("foto"));
                        break;
                    case "editora":
                        livro.setIdEditora(Integer.parseInt(request.getParameter("editora")));
                        break;
                    default:
                        break;
                }
            }
            ldao.salvaLivro(livro);
            JSONObject json = new JSONObject();
            json.put("id", livro.getId());
            json.put("titulo", livro.getTitulo());
            json.put("autor", livro.getAutor());
            json.put("ano", livro.getAno());
            json.put("preco", livro.getPreco());
            json.put("foto", livro.getFoto());
            json.put("editora", livro.getIdEditora());
            out.print(json);
            out.flush();
            con.close();
        }else{
            System.out.println("Connection failure");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LivroNgn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LivroNgn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LivroNgn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LivroNgn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

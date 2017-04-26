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
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import DAO.LivroDAO;
import DAO.EditoraDAO;
import domain.LivroDom;
import domain.EditoraDom;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author luiscunha
 */
@WebServlet(name = "atualizaLivro", urlPatterns = {"/atualizaLivro"})
public class atualizaLivro extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException  {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            JSONArray jarr = new JSONArray();
            EditoraDAO edao1 = new EditoraDAO();
            LivroDAO ldao1 = new LivroDAO();
            EditoraDom[] editoras = edao1.listaEditora();
            LivroDom livro = new LivroDom();
            livro.setTitulo("");
            LivroDom[] livros = ldao1.ConsultaLivroTitulo(livro);
            for (LivroDom livro1 : livros) {
                JSONObject json = new JSONObject();
                json.put("id", livro1.getId());
                json.put("titulo", livro1.getTitulo());
                json.put("autor", livro1.getAutor());
                json.put("ano", livro1.getAno());
                json.put("preco", livro1.getPreco());
                json.put("editora", editoras[livro1.getIdEditora() - 1].getNome());
                json.put("foto", livro1.getFoto());
                jarr.add(json);
            }
            out.print(jarr);
            out.flush();
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(atualizaLivro.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(atualizaLivro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(atualizaLivro.class.getName()).log(Level.SEVERE, null, ex);
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

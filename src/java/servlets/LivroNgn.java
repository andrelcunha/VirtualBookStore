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
import domain.LivroDom;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;

/**
 *
 * @author deko
 */
@WebServlet(name = "LivroNgn", urlPatterns = {"/LivroNgn"})
public class LivroNgn extends HttpServlet {
    LivroDom livro;
    LivroDAO ldao;
    public void intit(){
        ldao = new LivroDAO();
        livro.setId(0);
    }
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
        response.setContentType("text/html;charset=UTF-8");
        livro = new LivroDom();
        System.out.println("aqui");
        int i=0;
        while(request.getParameterNames().hasMoreElements()){
            System.out.println("aqui--");
            String tmp=request.getParameterNames().nextElement();
            if(tmp.contentEquals("id"))
                livro.setId(Integer.parseInt(request.getParameter("id")));
            else if(tmp.contentEquals("titulo"))
                livro.setTitulo(request.getParameter("titulo"));
            else if(tmp.contentEquals("autor"))
                livro.setAutor(request.getParameter("autor"));
            else if(tmp.contentEquals("ano"))
                livro.setAno(Integer.parseInt(request.getParameter("ano")));
            else if(tmp.contentEquals("preco"))
                livro.setPreco(Double.parseDouble(request.getParameter("preco")));
            else if(tmp.contentEquals("foto"))
                livro.setFoto(request.getParameter("foto"));
            else if(tmp.contentEquals("editora"))
                livro.setIdEditora(Integer.parseInt(request.getParameter("editora")));
        }
        if (livro.getId()==0)
            ldao.salvaLivro(livro);
        else 
            ldao.atualizaLivro(livro);
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

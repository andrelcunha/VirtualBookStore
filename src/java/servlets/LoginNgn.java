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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import connectionfactory.connection;
import DAO.UsuarioDAO;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author deko
 */
@WebServlet(name = "LoginNgn", urlPatterns = {"/LoginNgn"})
public class LoginNgn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String sUsr="";
            String sPwd="";
            connection con = new connection();
            if(con.connect()){
                Enumeration e = request.getParameterNames();
                while(e.hasMoreElements()){
                    String temp=(String)e.nextElement();
                    if (temp.equals("user"))
                        sUsr=request.getParameter("user");
                    else if(temp.equals("password"))
                        sPwd=request.getParameter("password");
                }
                if (!((sUsr.equals(""))&&(sPwd.equals("")))){
                    UsuarioDAO usrDao = new UsuarioDAO();
                    usrDao.setConnection(con.getCon());
                    HttpSession session = request.getSession();

                    int test_usr=usrDao.ConsultaUsuario(sUsr, sPwd);
                    switch (test_usr) {
                        case 1:
                            {
                                session.setAttribute("user", sUsr);
                                session.setMaxInactiveInterval(30*60); //30 minuts expiration
                                Cookie userName = new Cookie("user", sUsr);
                                userName.setMaxAge(30*60);
                                userName.setPath("/");
                                response.addCookie(userName);
                                //Login ok message
                                session.setAttribute("login_ok", "true");
                                //response.sendRedirect("../LoginSuccess.jsp");
                                //Get the encoded URL string
                                String encodedURL = response.encodeURL("index.jsp");
                                response.sendRedirect(encodedURL);
                                break;
                            }
                        case 0:
                            /*User and password doesn't match*/
                            session.setAttribute("login_ok", "false");
                            response.sendRedirect("login.jsp");
                            break;
                        case -1:
                            System.out.println("Error. Cannot authenticate.");
                            break;
                    }
                }else{
                    /*Do something if there is no user set up*/
                    out.println("<Strong>ERRO</Strong>");
                }
            }else{
                System.out.println("No user was set up.");

            }
        con.close();
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
        //processRequest(request, response);
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
            Logger.getLogger(LoginNgn.class.getName()).log(Level.SEVERE, null, ex);
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

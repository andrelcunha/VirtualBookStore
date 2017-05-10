/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.Iterator;
import javax.servlet.Servlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author deko
 */
@WebServlet(name = "FileUploadHandler", urlPatterns = {"/FileUploadHandler"})
public class FileUploadHandler extends HttpServlet {
    private boolean isMultipart;
    private String filePath;
    private final int maxFileSize = 5000 * 1024;
    private final int maxMemSize = 4 * 1024;
    private File file ;
    
    
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

        throw new ServletException("GET method used with " +
            getClass( ).getName( )+": POST method required.");
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
        filePath = getServletContext().getInitParameter("file-upload"); 
        // Check that we have a file upload request
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter( );

        if( !isMultipart ){
           System.out.println("No file uploaded");
           return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("/tmp/"));
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );

        try{ 
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();
            while ( i.hasNext () ) 
            {
                FileItem item = (FileItem)i.next();
                if ( !item.isFormField() )	
                {
                    // Get the uploaded file parameters
                    String fileName = item.getName();
                    System.out.println(fileName);
                    // Write the file
                    if( fileName.lastIndexOf("\\") >= 0 ){
                       file = new File( filePath + 
                       fileName.substring( fileName.lastIndexOf("\\"))) ;
                    }else{
                       file = new File( filePath + 
                       fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                    }
                    item.write( file ) ;

                    //return the filename
                    System.out.println("Uploaded Filename: " + fileName );
                }
            }
        }catch(Exception ex) {System.out.println(ex);}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles the uploaded photo, "
                + "rename it to be storade in assets and"
                + "returns file name and path";
    }

}

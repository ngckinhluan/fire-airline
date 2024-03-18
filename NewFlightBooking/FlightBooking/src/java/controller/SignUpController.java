/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.EmailUtil;
import util.PasswordUtil;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import util.Validatation;

/**
 *
 * @author khoa2
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    }
    private final ExecutorService executorService = Executors.newFixedThreadPool(5);

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
        //Retrieve parameters
        String username = request.getParameter("newusername");
        String password = request.getParameter("newpassword");
        String repass = request.getParameter("repass");
        String email = request.getParameter("newemail");
        // Perform input validation
        Validatation validate = new Validatation();
        String errorMsg = validate.validateSignUpInput(username, password, repass, email);
        //Check if there are no errors when user inputs
        if (errorMsg.equals("")) {
            EmailUtil emailUtil = new EmailUtil();
            PasswordUtil valueUtil = new PasswordUtil();
            String emailType = "signup";
            // Generate a new OTP and store it in the session
            String generatedValue = valueUtil.generateOTP();
            // Push Generate OTP to the session
            HttpSession session = request.getSession();
            session.setAttribute("generatedValue", generatedValue);
            // Send OTP email in other thread
            executorService.submit(() -> emailUtil.sendEmail(email, emailType, generatedValue));
            //Redirect to confirm OTP code 
            request.getRequestDispatcher("signUpOTP.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        // Shutdown the thread pool when the servlet is destroyed
        executorService.shutdown();
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

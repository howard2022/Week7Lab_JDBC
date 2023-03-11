package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserService us = new UserService();
        
        try{
            HttpSession session = request.getSession();
            ArrayList<User> users = us.getAll();;
            request.setAttribute("users", users);
            
            

        } catch (Exception ex){
            
        }
        
        String action = request.getParameter("action");
        if (action != null && action.equals("edit")) {
            try {
                String email = request.getParameter("email");
                User user = us.get(email);
                request.setAttribute("edit", user);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action != null && action.equals("delete")) {

        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try{

        }catch (Exception ex){
            
        }
    }

}

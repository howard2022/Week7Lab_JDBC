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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String email = request.getParameter("email");
//        String email = (String) session.getAttribute("email");
        try {

            List<User> users = us.getAll();
            session.setAttribute("allUsers", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            if (action != null && action.equals("edit")) {

                User user = us.get(email);
                 session.setAttribute("selectedUser", user);

            } else if (action != null && action.equals("delete")) {

                us.delete(email);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserService us = new UserService();
        String action = request.getParameter("action");

        String email = request.getParameter("email");
        String firstname = request.getParameter("firstName");
        String lastname = request.getParameter("lastName");
        String password = request.getParameter("password");
        int roleID = Integer.parseInt(request.getParameter("role"));

        try {
            switch (action) {
                case "add":
                    us.insert(email, firstname, lastname, password, roleID);
                    break;

                case "update":
                    us.update(email, firstname, lastname, password, roleID);
                    break;

                case "cancel":
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
            }
            List<User> users = us.getAll();
            request.setAttribute("allUsers", users);

        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

}

package org.example.esocialsystem;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/employeur")
public class EmployeurServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("default");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            EmployeurDAO dao = new EmployeurDAO(em);
            List<Employeur> employeurs = dao.findAll();
            
            request.setAttribute("employeurs", employeurs);
            request.getRequestDispatcher("employeurs.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String raisonSociale = request.getParameter("raisonSociale");
        String secteurActivite = request.getParameter("secteurActivite");

        EntityManager em = emf.createEntityManager();
        try {
            EmployeurDAO dao = new EmployeurDAO(em);
            dao.save(new Employeur(raisonSociale, secteurActivite));

            response.sendRedirect(request.getContextPath() + "/employeur");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'enregistrement: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}

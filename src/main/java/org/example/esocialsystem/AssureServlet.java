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

@WebServlet("/assure")
public class AssureServlet extends HttpServlet {

private EntityManagerFactory emf;

public void init() throws ServletException {
    emf = Persistence.createEntityManagerFactory("default");
}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            AssureDAO dao = new AssureDAO(em);
            EmployeurDAO employeurDAO = new EmployeurDAO(em);

            List<Assure> assures = dao.findAll();
            List<Employeur> employeurs = employeurDAO.findAll();

            request.setAttribute("assures", assures);
            request.setAttribute("employeurs", employeurs);

            request.getRequestDispatcher("assures.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            String nom = request.getParameter("nom");
            double salaire = Double.parseDouble(request.getParameter("salaire"));
            Long employeurId = Long.parseLong(request.getParameter("employeurId"));

            AssureDAO dao = new AssureDAO(em);
            EmployeurDAO employeurDAO = new EmployeurDAO(em);

            Employeur employeur = employeurDAO.findById(employeurId);

            Assure a = new Assure(nom, salaire, employeur);
            dao.save(a);

            response.sendRedirect("assure");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("assure?error=true");
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

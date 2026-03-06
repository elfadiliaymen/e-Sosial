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

@WebServlet("/droits")
public class DroitServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("default");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            AssureDAO assureDAO = new AssureDAO(em);
            CotisationDAO cotisationDAO = new CotisationDAO(em);

            String assureIdStr = request.getParameter("assureId");
            
            // Populate list for dropdown
            List<Assure> assures = assureDAO.findAll();
            request.setAttribute("assures", assures);

            if (assureIdStr != null && !assureIdStr.isEmpty()) {
                try {
                    Long assureId = Long.parseLong(assureIdStr);
                    Assure selectedAssure = assureDAO.findById(assureId);

                    if (selectedAssure != null) {
                        long totalMonths = cotisationDAO.countMonthsByAssureId(assureId);
                        double totalCotisations = cotisationDAO.sumCotisationsByAssureId(assureId);
                        
                        // Simple logic for rights status (Example: > 6 months = Open)
                        String status = (totalMonths >= 6) ? "Ouverts" : "Fermés (Manque de cotisations)";

                        request.setAttribute("selectedAssure", selectedAssure);
                        request.setAttribute("totalMonths", totalMonths);
                        request.setAttribute("totalCotisations", totalCotisations);
                        request.setAttribute("status", status);
                    }
                } catch (NumberFormatException e) {
                    // Handle error silently or add message
                }
            }

            request.getRequestDispatcher("droits.jsp").forward(request, response);
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

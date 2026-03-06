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
import java.util.stream.Collectors;

@WebServlet("/cotisations")
public class CotisationServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("default");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String declarationIdStr = request.getParameter("declarationId");
        if (declarationIdStr == null || declarationIdStr.isEmpty()) {
            response.sendRedirect("declarations");
            return;
        }

        EntityManager em = emf.createEntityManager();
        try {
            Long declarationId = Long.parseLong(declarationIdStr);
            DeclarationDAO declarationDAO = new DeclarationDAO(em);
            CotisationDAO cotisationDAO = new CotisationDAO(em);

            Declaration declaration = declarationDAO.findById(declarationId);
            if (declaration == null) {
                response.sendRedirect("declarations?error=declaration_not_found");
                return;
            }

            List<Cotisation> cotisations = cotisationDAO.findByDeclarationId(declarationId);
            double totalAumony = cotisationDAO.calculateTotalCotisationByDeclarationId(declarationId);

            request.setAttribute("declaration", declaration);
            request.setAttribute("cotisations", cotisations);
            request.setAttribute("totalAumony", totalAumony);

            request.getRequestDispatcher("cotisations.jsp").forward(request, response);
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

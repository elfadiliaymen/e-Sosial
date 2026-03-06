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
import java.time.LocalDate;
import java.util.List;

@WebServlet("/declarations")
public class DeclarationServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("default");
    }

    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        try{
            DeclarationDAO dao = new DeclarationDAO(em);
            EmployeurDAO employeurDAO = new EmployeurDAO(em);

            List<Declaration> declarationList = dao.findAll();
            List<Employeur> employeurs = employeurDAO.findAll();

            request.setAttribute("declarations" , declarationList);
            request.setAttribute("employeurs" , employeurs);

            request.getRequestDispatcher("declaration.jsp").forward(request , response);
        }finally {
            em.close();
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        try {
            Long employeurId = Long.parseLong(req.getParameter("employeurId"));
            int mois = Integer.parseInt(req.getParameter("mois"));
            int annee = Integer.parseInt(req.getParameter("annee"));

            EmployeurDAO employeurDAO = new EmployeurDAO(em);
            DeclarationDAO declarationDAO = new DeclarationDAO(em);
            CotisationDAO cotisationDAO = new CotisationDAO(em);
            CotisationService cotisationService = new CotisationService();

            Employeur employeur = employeurDAO.findById(employeurId);
            if (employeur == null) {
                resp.sendRedirect("declarations?error=employeur_not_found");
                return;
            }

            Declaration declaration = new Declaration(mois, annee, LocalDate.now());
            declaration.setEmployeur(employeur);
            declarationDAO.save(declaration);

            if (employeur.getAssures() != null) {
                for (Assure assure : employeur.getAssures()) {
                    Cotisation cotisation = cotisationService.calculerCotisation(assure, declaration, assure.getSalaire());
                    cotisationDAO.save(cotisation);
                }
            }

            resp.sendRedirect("cotisations?declarationId=" + declaration.getId());
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("declarations?error=true");
        } finally {
            em.close();
        }
    }
}

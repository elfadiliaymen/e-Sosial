package org.example.esocialsystem;

public class CotisationService {

    private static final double TAUX_SALARIAL = 0.0448;
    private static final double TAUX_PATRONAL = 0.2489;
    private static final double PLAFOND_SALARIAL = 6000.0;

    public Cotisation calculerCotisation(Assure assure, Declaration declaration, double salaireBrut) {

        double salaireSoumisSalarial = Math.min(salaireBrut, PLAFOND_SALARIAL);

        double montantSalarial = salaireSoumisSalarial * TAUX_SALARIAL;
        double montantPatronal = salaireBrut * TAUX_PATRONAL;

        return new Cotisation(declaration, assure, montantSalarial, montantPatronal);
    }
}

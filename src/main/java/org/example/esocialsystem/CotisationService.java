package org.example.esocialsystem;

public class CotisationService {

    private static final double TAUX_SALARIAL = 0.0448;
    private static final double TAUX_PATRONAL = 0.0640;
    private static final double PLAFOND = 6000.0;

    public Cotisation calculerCotisation(Assure assure, Declaration declaration, double salaireBrut) {

        double salaireSoumis = Math.min(salaireBrut, PLAFOND);

        double montantSalarial = salaireSoumis * TAUX_SALARIAL;
        double montantPatronal = salaireSoumis * TAUX_PATRONAL;

        return new Cotisation(declaration, assure, montantSalarial, montantPatronal);
    }
}

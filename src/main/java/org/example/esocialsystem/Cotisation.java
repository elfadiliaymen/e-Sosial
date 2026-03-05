package org.example.esocialsystem;

import jakarta.persistence.*;

@Entity
@Table(name = "cotisations")
public class Cotisation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "declaration_id")
    private Declaration declaration;

    @ManyToOne
    @JoinColumn(name = "assure_id")
    private Assure assure;

    private double cotisation_salariale;
    private double cotisation_patronale;
    private double total_cotisation;

    public Cotisation() {
    }

    public Cotisation(Declaration declaration, Assure assure, double cotisation_salariale, double cotisation_patronale) {
        this.declaration = declaration;
        this.assure = assure;
        this.cotisation_salariale = cotisation_salariale;
        this.cotisation_patronale = cotisation_patronale;
        this.total_cotisation = cotisation_salariale + cotisation_patronale;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Declaration getDeclaration() {
        return declaration;
    }

    public void setDeclaration(Declaration declaration) {
        this.declaration = declaration;
    }

    public Assure getAssure() {
        return assure;
    }

    public void setAssure(Assure assure) {
        this.assure = assure;
    }

    public double getCotisation_salariale() {
        return cotisation_salariale;
    }

    public void setCotisation_salariale(double cotisation_salariale) {
        this.cotisation_salariale = cotisation_salariale;
    }

    public double getCotisation_patronale() {
        return cotisation_patronale;
    }

    public void setCotisation_patronale(double cotisation_patronale) {
        this.cotisation_patronale = cotisation_patronale;
    }

    public double getTotal_cotisation() {
        return total_cotisation;
    }

    public void setTotal_cotisation(double total_cotisation) {
        this.total_cotisation = total_cotisation;
    }
}

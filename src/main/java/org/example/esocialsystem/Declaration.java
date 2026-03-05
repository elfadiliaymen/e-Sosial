package org.example.esocialsystem;


import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "declarations")
public class Declaration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "employeur_id")
    private Employeur employeur;

    private int mois;

    private int  annee;
    private LocalDate date_declaration;

    public Declaration(){}

    public Declaration(int mois , int annee , LocalDate date_declaration){
        this.mois = mois;
        this.annee = annee;
        this.date_declaration = date_declaration;

    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public LocalDate getDate_declaration() {
        return date_declaration;
    }

    public void setDate_declaration(LocalDate date_declaration) {
        this.date_declaration = date_declaration;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Employeur getEmployeur() {
        return employeur;
    }

    public void setEmployeur(Employeur employeur) {
        this.employeur = employeur;
    }
}

package org.example.esocialsystem;

import jakarta.persistence.*;

@Entity
@Table(name = "assures")
public class Assure {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nom;
    
    @Column(name = "salaire_mensuel", nullable = false)
    private double salaire;

    @ManyToOne
    @JoinColumn(name = "employeur_id")
    private Employeur employeur;

    public Assure() {}

    public Assure(String nom, double salaire, Employeur employeur) {
        this.nom = nom;
        this.salaire = salaire;
        this.employeur = employeur;
    }


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public double getSalaire() { return salaire; }
    public void setSalaire(double salaire) { this.salaire = salaire; }

    public Employeur getEmployeur() { return employeur; }
    public void setEmployeur(Employeur employeur) { this.employeur = employeur; }
}

package org.example.esocialsystem;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "employeurs")
public class Employeur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "raison_sociale")
    private String raisonSociale;

    @Column(name = "secteur_activite")
    private String secteurActivite;

    @OneToMany(mappedBy = "employeur", cascade = CascadeType.ALL)
    private List<Assure> assures;

    @OneToMany(mappedBy = "employeur" , cascade = CascadeType.ALL)
    private List<Declaration> declarations;

    public Employeur() {}

    public Employeur(String raisonSociale, String secteurActivite) {
        this.raisonSociale = raisonSociale;
        this.secteurActivite = secteurActivite;
    }


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getRaisonSociale() { return raisonSociale; }
    public void setRaisonSociale(String raisonSociale) { this.raisonSociale = raisonSociale; }

    public String getSecteurActivite() { return secteurActivite; }
    public void setSecteurActivite(String secteurActivite) { this.secteurActivite = secteurActivite; }

    public List<Declaration> getDeclarations() {
        return declarations;
    }

    public void setDeclarations(List<Declaration> declarations) {
        this.declarations = declarations;
    }

    public List<Assure> getAssures() { return assures; }
    public void setAssures(List<Assure> assures) { this.assures = assures; }
}

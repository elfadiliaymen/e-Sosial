<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.esocialsystem.Employeur" %>
<%@ page import="org.example.esocialsystem.Declaration" %>
<!DOCTYPE html>
<html>
<head>
    <title>Déclarations Mensuelles</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="navbar">
    <div class="container" style="width: 100%; margin: 0; padding: 0 20px; border: none; background: transparent;">
        <a href="index.jsp" class="brand">e-Social</a>
        <a href="employeur">Employeurs</a>
        <a href="assure">Assurés</a>
        <a href="declarations">Déclarations</a>
    </div>
</div>

<div class="container">
    <h2>Nouvelle Déclaration de Salaire</h2>

    <form action="declarations" method="POST">
        <div class="form-group">
            <label>Employeur :</label>
            <select name="employeurId" required>
                <option value="">-- Choisir un employeur --</option>
                <%
                    List<Employeur> employeurs = (List<Employeur>) request.getAttribute("employeurs");
                    if (employeurs != null) {
                        for (Employeur e : employeurs) {
                %>
                <option value="<%= e.getId() %>"><%= e.getRaisonSociale() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label>Mois (1-12) :</label>
            <input type="number" name="mois" min="1" max="12" placeholder="03" required>
        </div>
        <div class="form-group">
            <label>Année :</label>
            <input type="number" name="annee" placeholder="2026" required>
        </div>
        <button type="submit" class="btn btn-primary">Valider la Déclaration</button>
    </form>

    <h2 class="mt-20">Historique des Déclarations</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Employeur</th>
            <th>Période</th>
            <th>Date Système</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Declaration> declarations = (List<Declaration>) request.getAttribute("declarations");
            if (declarations != null && !declarations.isEmpty()) {
                for (Declaration d : declarations) {
        %>
        <tr>
            <td><%= d.getId() %></td>
            <td><%= d.getEmployeur().getRaisonSociale() %></td>
            <td><%= d.getMois() %> / <%= d.getAnnee() %></td>
            <td><%= d.getDate_declaration() %></td>
            <td>
                <a href="cotisations?declarationId=<%= d.getId() %>" class="btn btn-sm btn-info">Détails</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" class="text-center">Aucune déclaration trouvée.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.esocialsystem.Employeur" %>
<%@ page import="org.example.esocialsystem.Declaration" %>
<!DOCTYPE html>
<html>
<head>
    <title>Déclaration Mensuelle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">e-Social</a>
        <div class="navbar-nav">
            <a class="nav-link" href="employeur">Employeurs</a>
            <a class="nav-link" href="assure">Assurés</a>
            <a class="nav-link active" href="declarations">Déclarations</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4">Nouvelle Déclaration de Salaire</h2>

    <form action="declarations" method="POST" class="card p-4 mb-4">
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Employeur</label>
                <select name="employeurId" class="form-select" required>
                    <option value="">Sélectionner un employeur</option>
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
            <div class="col-md-3">
                <label class="form-label">Mois</label>
                <input type="number" name="mois" class="form-control" placeholder="03" min="1" max="12" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Année</label>
                <input type="number" name="annee" class="form-control" placeholder="2026" required>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Valider</button>
            </div>
        </div>
    </form>

    <h3 class="mt-5">Historique des Déclarations</h3>
    <table class="table table-bordered bg-white mt-3">
        <thead class="table-secondary">
        <tr>
            <th>ID</th>
            <th>Employeur</th>
            <th>Période</th>
            <th>Date Déclaration</th>
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
                <a href="cotisations?declarationId=<%= d.getId() %>" class="btn btn-sm btn-info text-white">Voir Cotisations</a>
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

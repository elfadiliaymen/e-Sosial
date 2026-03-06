<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.esocialsystem.Cotisation" %>
<%@ page import="org.example.esocialsystem.Declaration" %>
<!DOCTYPE html>
<html>
<head>
    <title>e-Social - Détails des Cotisations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">e-Social</a>
        <div class="navbar-nav">
            <a class="nav-link" href="employeur">Employeurs</a>
            <a class="nav-link" href="assure">Assurés</a>
            <a class="nav-link" href="declarations">Déclarations</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <%
        Declaration d = (Declaration) request.getAttribute("declaration");
        if (d != null) {
    %>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Détails des Cotisations - <%= d.getMois() %>/<%= d.getAnnee() %></h2>
        <span class="badge bg-primary fs-5">Employeur: <%= d.getEmployeur().getRaisonSociale() %></span>
    </div>

    <table class="table table-hover bg-white shadow-sm">
        <thead class="table-dark">
        <tr>
            <th>Nom de l'Assuré</th>
            <th>Salaire (DH)</th>
            <th>Part Salariale (4.48%)</th>
            <th>Part Patronale (24.89%)</th>
            <th>Total Cotisation</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Cotisation> cotisations = (List<Cotisation>) request.getAttribute("cotisations");
            if (cotisations != null) {
                for (Cotisation c : cotisations) {
        %>
        <tr>
            <td><%= c.getAssure().getNom() %></td>
            <td><%= String.format("%.2f", c.getAssure().getSalaire()) %></td>
            <td><%= String.format("%.2f", c.getCotisation_salariale()) %></td>
            <td><%= String.format("%.2f", c.getCotisation_patronale()) %></td>
            <td class="fw-bold"><%= String.format("%.2f", c.getTotal_cotisation()) %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
        <tfoot class="table-light">
        <tr class="fs-5">
            <td colspan="4" class="text-end fw-bold">Total à payer par l'employeur :</td>
            <td class="text-danger fw-bold"><%= String.format("%.2f", (Double)request.getAttribute("totalAumony")) %> DH</td>
        </tr>
        </tfoot>
    </table>
    <% } else { %>
    <div class="alert alert-warning">Déclaration non trouvée.</div>
    <% } %>

    <div class="mt-3">
        <a href="declarations" class="btn btn-outline-secondary">Retour aux Déclarations</a>
        <button class="btn btn-outline-secondary" onclick="window.print()">Imprimer le Reçu</button>
    </div>
</div>
</body>
</html>

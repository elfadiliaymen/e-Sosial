<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.esocialsystem.Cotisation" %>
<%@ page import="org.example.esocialsystem.Declaration" %>
<!DOCTYPE html>
<html>
<head>
    <title>Détails des Cotisations</title>
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
    <%
        Declaration d = (Declaration) request.getAttribute("declaration");
        if (d != null) {
    %>
    <h2>Cotisations - <%= d.getMois() %>/<%= d.getAnnee() %></h2>
    <p><b>Employeur :</b> <%= d.getEmployeur().getRaisonSociale() %></p>

    <table>
        <thead>
        <tr>
            <th>Assuré</th>
            <th>Salaire</th>
            <th>Salariale (4.48%)</th>
            <th>Patronale (24.89%)</th>
            <th>Total</th>
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
            <td><b><%= String.format("%.2f", c.getTotal_cotisation()) %></b></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4" style="text-align: right;"><b>Total à payer :</b></td>
            <td style="color: red;"><b><%= String.format("%.2f", (Double)request.getAttribute("totalAumony")) %> DH</b></td>
        </tr>
        </tfoot>
    </table>
    <% } else { %>
    <div class="alert alert-danger">Déclaration non trouvée.</div>
    <% } %>

    <div class="mt-20">
        <a href="declarations" class="btn btn-info">Retour</a>
        <button class="btn btn-primary" onclick="window.print()">Imprimer</button>
    </div>
</div>
</body>
</html>

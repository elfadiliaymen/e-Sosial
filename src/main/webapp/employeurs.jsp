<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Employeurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow p-4 mb-5">
            <h3 class="text-success">Ajouter un Employeur</h3>
            <form action="${pageContext.request.contextPath}/employeur" method="POST" class="row g-3">
                <div class="col-md-5">
                    <input type="text" name="raisonSociale" class="form-control" placeholder="Raison Sociale" required>
                </div>
                <div class="col-md-3">
                    <select name="secteurActivite" class="form-select" required>
                        <option value="" selected disabled>Secteur d'activité</option>
                        <option value="Informatique">Informatique</option>
                        <option value="Industrie">Industrie</option>
                        <option value="Services">Services</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success w-100">Enregistrer</button>
                </div>
            </form>
        </div>

        <h3 class="mb-3">Liste des Entreprises</h3>
        <table class="table table-light table-hover shadow-sm">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Raison Sociale</th>
                    <th>Secteur</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeurs}" var="emp">
                    <tr>
                        <td><c:out value="${emp.id}"/></td>
                        <td><c:out value="${emp.raisonSociale}"/></td>
                        <td><c:out value="${emp.secteurActivite}"/></td>
                        <td>
                            <button class="btn btn-outline-primary btn-sm">Voir Détails</button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty employeurs}">
                    <tr>
                        <td colspan="4" class="text-center text-muted">Aucun employeur trouvé.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>

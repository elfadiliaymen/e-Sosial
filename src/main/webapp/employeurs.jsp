<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Employeurs</title>
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
        <h2>Ajouter un Employeur</h2>
        <form action="${pageContext.request.contextPath}/employeur" method="POST">
            <div class="form-group">
                <label>Raison Sociale :</label>
                <input type="text" name="raisonSociale" required>
            </div>
            <div class="form-group">
                <label>Secteur d'activité :</label>
                <select name="secteurActivite" required>
                    <option value="" selected disabled>Choisir un secteur</option>
                    <option value="Informatique">Informatique</option>
                    <option value="Industrie">Industrie</option>
                    <option value="Services">Services</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Enregistrer</button>
        </form>

        <h2 class="mt-20">Liste des Employeurs</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Raison Sociale</th>
                    <th>Secteur</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeurs}" var="emp">
                    <tr>
                        <td><c:out value="${emp.id}"/></td>
                        <td><c:out value="${emp.raisonSociale}"/></td>
                        <td><c:out value="${emp.secteurActivite}"/></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty employeurs}">
                    <tr>
                        <td colspan="3" class="text-center">Aucun employeur trouvé.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Assurés</title>
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
    <h2>Gestion des Assurés</h2>
    
    <c:if test="${param.error == 'true'}">
        <div class="alert alert-danger">Une erreur est survenue lors de l'enregistrement.</div>
    </c:if>

    <h3>Ajouter un Assuré</h3>
    <form action="assure" method="POST">
        <div class="form-group">
            <label>Nom Complet :</label>
            <input type="text" name="nom" required>
        </div>
        <div class="form-group">
            <label>Salaire Mensuel (DH) :</label>
            <input type="number" step="0.01" name="salaire" required>
        </div>
        <div class="form-group">
            <label>Employeur :</label>
            <select name="employeurId" required>
                <option value="">-- Choisir un employeur --</option>
                <c:forEach items="${employeurs}" var="e">
                    <option value="${e.id}">${e.raisonSociale}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Enregistrer</button>
    </form>

    <h3 class="mt-20">Liste des Assurés</h3>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom Complet</th>
            <th>Salaire</th>
            <th>Employeur</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${assures}" var="assure">
            <tr>
                <td><c:out value="${assure.id}"/></td>
                <td><c:out value="${assure.nom}"/></td>
                <td><fmt:formatNumber value="${assure.salaire}" pattern="#,##0.00"/> DH</td>
                <td><c:out value="${assure.employeur.raisonSociale}" default="N/A"/></td>
            </tr>
        </c:forEach>
        <c:if test="${empty assures}">
            <tr>
                <td colspan="4" class="text-center">Aucun assuré trouvé.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <div class="mt-20">
        <a href="index.jsp" class="btn btn-info">Retour à l'accueil</a>
    </div>
</div>

</body>
</html>

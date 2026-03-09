<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consultation des Droits</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="container" style="width: 100%; margin: 0; padding: 0 20px; border: none; background: transparent;">
        <a href="index.jsp" class="brand">e-Social</a>
        <a href="employeur">Employeurs</a>
        <a href="assure">Assurés</a>
        <a href="declarations">Déclarations</a>
        <a href="droits">Droits Sociaux</a>
    </div>
</div>

<div class="container">
    <h2>Consultation des Droits Sociaux</h2>

    <form action="droits" method="GET">
        <div class="form-group">
            <label>Sélectionner un Assuré :</label>
            <select name="assureId" required>
                <option value="">-- Choisir --</option>
                <c:forEach items="${assures}" var="a">
                    <option value="${a.id}" ${param.assureId == a.id ? 'selected' : ''}>
                        ${a.nom} (ID: ${a.id})
                    </option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Consulter</button>
    </form>

    <c:if test="${not empty selectedAssure}">
        <div class="mt-20" style="border: 1px solid #ccc; padding: 15px;">
            <h3>Résultat pour : ${selectedAssure.nom}</h3>
            <p><b>Mois Cotisés :</b> ${totalMonths}</p>
            <p><b>Total des Cotisations :</b> <fmt:formatNumber value="${totalCotisations}" pattern="#,##0.00"/> DH</p>
            <p><b>Statut :</b> 
                <span style="font-weight: bold; color: ${status == 'Ouverts' ? 'green' : 'red'};">
                    ${status}
                </span>
            </p>
            <p><small>(Critère : Au moins 6 mois de cotisations déclarées)</small></p>
        </div>
    </c:if>
</div>

</body>
</html>

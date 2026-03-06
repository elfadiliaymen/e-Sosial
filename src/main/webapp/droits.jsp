<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>e-Social - Consultation des Droits</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .card { box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">e-Social</a>
        <div class="navbar-nav">
            <a class="nav-link" href="employeur">Employeurs</a>
            <a class="nav-link" href="assure">Assurés</a>
            <a class="nav-link" href="declarations">Déclarations</a>
            <a class="nav-link active" href="droits">Droits Sociaux</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">Consultation des Droits Sociaux</h2>
    </div>

    <div class="card p-4 mb-5">
        <form action="droits" method="GET" class="row g-3 align-items-end">
            <div class="col-md-6">
                <label for="assureId" class="form-label">Sélectionner un Assuré</label>
                <select name="assureId" id="assureId" class="form-select" required>
                    <option value="">-- Choisir --</option>
                    <c:forEach items="${assures}" var="a">
                        <option value="${a.id}" ${param.assureId == a.id ? 'selected' : ''}>
                            ${a.nom} (ID: ${a.id})
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Consulter</button>
            </div>
        </form>
    </div>

    <c:if test="${not empty selectedAssure}">
        <div class="card">
            <div class="card-header bg-info text-white">
                <h4 class="mb-0">Détails des Droits : ${selectedAssure.nom}</h4>
            </div>
            <div class="card-body">
                <div class="row text-center">
                    <div class="col-md-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="text-muted">Mois Déclarés</h5>
                            <h2 class="display-4 text-primary">${totalMonths}</h2>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="text-muted">Total Cotisations</h5>
                            <h2 class="display-6 text-success">
                                <fmt:formatNumber value="${totalCotisations}" pattern="#,##0.00"/> DH
                            </h2>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="text-muted">Statut des Droits</h5>
                            <h3 class="${status == 'Ouverts' ? 'text-success' : 'text-danger'} mt-3">
                                ${status}
                            </h3>
                            <small class="text-muted">Critère: > 6 mois cotisés</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>

</body>
</html>

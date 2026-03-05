<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>e-Social - Liste des Assurés</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #f8f9fa; padding: 20px; }
        .container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">Gestion des Assurés</h2>
        <a href="index.jsp" class="btn btn-secondary">Retour Accueil</a>
    </div>

    <c:if test="${param.error == 'true'}">
        <div class="alert alert-danger">Une erreur est survenue lors de l'enregistrement.</div>
    </c:if>

    <div class="mb-3">
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAssureModal">
            Ajouter un nouvel assuré
        </button>
    </div>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nom Complet</th>
            <th>Salaire Mensuel (DH)</th>
            <th>Employeur (Raison Sociale)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${assures}" var="assure">
            <tr>
                <td><c:out value="${assure.id}"/></td>
                <td><c:out value="${assure.nom}"/></td>
                <td><fmt:formatNumber value="${assure.salaire}" pattern="#,##0.00"/></td>
                <td><c:out value="${assure.employeur.raisonSociale}" default="N/A"/></td>
                <td>
                    <button class="btn btn-sm btn-warning">Modifier</button>
                    <button class="btn btn-sm btn-danger">Supprimer</button>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty assures}">
            <tr>
                <td colspan="6" class="text-center">Aucun assuré trouvé.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<!-- Add Assure Modal -->
<div class="modal fade" id="addAssureModal" tabindex="-1" aria-labelledby="addAssureModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAssureModalLabel">Ajouter un Assuré</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="assure" method="POST">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="nom" class="form-label">Nom Complet</label>
                        <input type="text" class="form-control" id="nom" name="nom" required>
                    </div>
                    <div class="mb-3">
                        <label for="salaire" class="form-label">Salaire Mensuel (DH)</label>
                        <input type="number" step="0.01" class="form-control" id="salaire" name="salaire" required>
                    </div>
                    <div class="mb-3">
                        <label for="employeurId" class="form-label">Employeur</label>
                        <select class="form-select" id="employeurId" name="employeurId" required>
                            <option value="">Sélectionner un employeur</option>
                            <c:forEach items="${employeurs}" var="e">
                                <option value="${e.id}">${e.raisonSociale}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
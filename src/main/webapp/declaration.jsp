<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Déclaration Mensuelle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Nouvelle Déclaration de Salaire</h2>

    <div class="card p-4 mb-4">
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Employeur</label>
                <select class="form-select">
                    <option>Tech Solutions SARL</option>
                    <option>Global Logistics SA</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Mois</label>
                <input type="number" class="form-control" placeholder="03" min="1" max="12">
            </div>
            <div class="col-md-3">
                <label class="form-label">Année</label>
                <input type="number" class="form-control" placeholder="2026">
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button class="btn btn-primary w-100">Lancer</button>
            </div>
        </div>
    </div>

    <table class="table table-bordered bg-white">
        <thead class="table-secondary">
        <tr>
            <th>Assuré</th>
            <th>Salaire de Base</th>
            <th>Salaire Déclaré ce mois</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Ahmed Bennani</td>
            <td>8500.00 DH</td>
            <td><input type="number" class="form-control" value="8500.00"></td>
        </tr>
        <tr>
            <td>Sara El Amrani</td>
            <td>12000.00 DH</td>
            <td><input type="number" class="form-control" value="12000.00"></td>
        </tr>
        </tbody>
    </table>
    <button class="btn btn-danger float-end">Valider la Déclaration</button>
</div>
</body>
</html>
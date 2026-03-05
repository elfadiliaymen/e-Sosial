<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>e-Social - Détails des Cotisations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Détails des Cotisations - Mars 2026</h2>
        <span class="badge bg-primary fs-5">Employeur: Tech Solutions</span>
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
        <tr>
            <td>Ahmed Bennani</td>
            <td>8,500.00</td>
            <td>268.80</td> <td>2,115.65</td>
            <td class="fw-bold">2,384.45</td>
        </tr>
        <tr>
            <td>Sara El Amrani</td>
            <td>12,000.00</td>
            <td>268.80</td> <td>2,986.80</td>
            <td class="fw-bold">3,255.60</td>
        </tr>
        </tbody>
        <tfoot class="table-light">
        <tr class="fs-5">
            <td colspan="4" class="text-end fw-bold">Total à payer par l'employeur :</td>
            <td class="text-danger fw-bold">5,640.05 DH</td>
        </tr>
        </tfoot>
    </table>

    <div class="mt-3">
        <button class="btn btn-outline-secondary" onclick="window.print()">Imprimer le Reçu</button>
    </div>
</div>
</body>
</html>
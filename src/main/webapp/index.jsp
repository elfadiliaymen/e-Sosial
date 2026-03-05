<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>e-Social System - Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .hero { background: #007bff; color: white; padding: 60px 0; margin-bottom: 40px; }
        .card { transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<div class="hero text-center">
    <div class="container">
        <h1 class="display-4">Système e-Social</h1>
        <p class="lead">Gestion des Employeurs, des Assurés et des Cotisations</p>
    </div>
</div>

<div class="container">
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title text-primary">Gestion des Employeurs</h5>
                    <p class="card-text">Gérez les entreprises affiliées au système.</p>
                    <a href="employeur" class="btn btn-primary">Accéder</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title text-success">Gestion des Assurés</h5>
                    <p class="card-text">Gérez la liste des salariés et leurs salaires.</p>
                    <a href="assure" class="btn btn-success">Accéder</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title text-info">Déclarations & Cotisations</h5>
                    <p class="card-text">Gérez les déclarations mensuelles et les calculs.</p>
                    <a href="declaration.jsp" class="btn btn-info text-white">Accéder</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="ab" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.telusko.JobApp.model.JobPost" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-warning">
    <div class="container">
        <a class="navbar-brand fs-1 fw-medium" href="#">Romeo A Benatero Web Demo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.facebook.com/romeo.benatero">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card">
<div class="card-body">

    <h2 class="mb-4 text-center font-weight-bold">Edit Job Post</h2>

    <form action="updateJob" method="post">
        <input type="hidden" name="postId" value="${jobPost.postId}" />

        <div class="mb-3">
            <label class="form-label">Job Profile</label>
            <input type="text" class="form-control" name="postProfile" value="${jobPost.postProfile}" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Job Description</label>
            <textarea class="form-control" name="postDesc" rows="3" required>${jobPost.postDesc}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Experience Required (Years)</label>
            <input type="number" class="form-control" name="reqExperience" value="${jobPost.reqExperience}" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Tech Stack Required (Comma Separated)</label>
            <input type="text" class="form-control" name="postTechStack" value="${jobPost.postTechStack}" required />
        </div>

        <button type="submit" class="btn btn-success">Update Job</button>
        <a href="viewalljobs" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</div>
</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>



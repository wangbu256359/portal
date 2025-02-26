<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Romeo A Benatero Web Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>
<div class="container mt-5">
   <h2 class="text-start">Add New User</h2>
    <form action="saveUser" method="post">
        <div class="mb-3">
             <label class="form-label" style="text-align: left; display: block;">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
             <label class="form-label" style="text-align: left; display: block;">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="mb-3">
             <label class="form-label" style="text-align: left; display: block;">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <button type="submit" class="btn btn-success">Save User</button>
        <a href="userList" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h2 class="text-start">Edit User</h2>

      <form action="updateUser" method="post">
                   <input type="hidden" name="user_id" value="${user.user_id}" />

                            <div class="mb-3">
                                <label class="form-label" style="text-align: left; display: block;">Username</label>
                                <input type="text" class="form-control" name="username" value="${user.username}" required />
                            </div>

                            <div class="mb-3">
                                <label class="form-label" style="text-align: left; display: block;">Password</label>
                                <input type="password" class="form-control" name="password" value="${user.password}" required />
                            </div>

                            <div class="mb-3">
                               <label class="form-label" style="text-align: left; display: block;">Name</label>
                                <input type="text" class="form-control" name="name" value="${user.name}" required />
                            </div>

                            <button type="submit" class="btn btn-success">Update User</button>
                            <a href="viewallusers" class="btn btn-secondary">Cancel</a>
      </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>

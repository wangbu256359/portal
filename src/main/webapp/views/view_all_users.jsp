<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <!-- Navbar -->
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

    <!-- User List -->
    <div class="container mt-5">
        <h2 class="mb-4 text-center">User List</h2>
        <table class="table table-bordered text-center">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.name}</td>
                        <td>
                            <!-- Edit button triggers modal and passes user_id via data attribute -->
                            <button class="btn btn-warning btn-sm edit-user-btn"
                                    data-user-id="${user.user_id}"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editUserModal">
                                Edit
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-danger" onclick="deleteUser(${user.user_id})">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="container mt-3 d-flex justify-content-end">

            <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#addUserModal">
                Create User
            </button>

            <!-- Button to generate and download report -->
            <button type="button" class="btn btn-success" onclick="downloadReport()">
                Generate Report
            </button>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="addUserFormContainer" class="text-center">
                        <p>Loading form...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="editUserFormContainer" class="text-center">
                        <p>Loading form...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function() {
            // Load Add User Form when modal opens
            $('#addUserModal').on('show.bs.modal', function() {
                $('#addUserFormContainer').html('<p class="text-center">Loading form...</p>');
                $('#addUserFormContainer').load('views/addUser.jsp', function(response, status, xhr) {
                    if (status === "error") {
                        $('#addUserFormContainer').html('<p class="text-danger">Error loading form.</p>');
                    }
                });
            });

            // Load Edit User Form when Edit button is clicked
            $('.edit-user-btn').click(function() {
                let userId = $(this).data('user-id');
                $('#editUserFormContainer').html('<p class="text-center">Loading form...</p>');
                // Call the controller method using the user_id parameter
                $('#editUserFormContainer').load('editUser?user_id=' + userId, function(response, status, xhr) {
                    if (status === "error") {
                        $('#editUserFormContainer').html('<p class="text-danger">Error loading form.</p>');
                    }
                });
            });
        });
    </script>
     <script>
           function deleteUser(user_id) {
               if (confirm("Are you sure you want to delete this User?")) {
                   fetch("deleteUser?user_id=" + user_id, { method: "DELETE" })
                   .then(response => {
                       if (response.ok) {
                           alert("User deleted successfully!");
                           window.location.reload(); // Refresh the page after deletion
                       } else {
                           alert("Failed to delete job.");
                       }
                   })
                   .catch(error => console.error("Error:", error));
               }
           }
     </script>
     <script>
         function downloadReport() {
             // Redirect to the backend report generation endpoint
             window.location.href = "http://localhost:8080/reports/generate";
         }
     </script>

</body>
</html>

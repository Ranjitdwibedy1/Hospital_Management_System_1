<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - WellSphere</title>
    <%@include file="../component/allcss.jsp"%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style type="text/css">
        /* Animated Gradient Background */
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #dbeafe, #bfdbfe, #93c5fd, #60a5fa);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            font-family: 'Poppins', sans-serif;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Card Styling */
        .paint-card {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease-in-out;
        }
        .paint-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Card Body Styling */
        .card-body {
            padding: 25px;
            text-align: center;
        }
        .card-body i {
            color: #60a5fa;
            font-size: 3rem;
            transition: transform 0.3s ease;
        }
        .card-body i:hover {
            transform: scale(1.2);
        }
        .card-body p {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e3a8a;
            margin-top: 10px;
        }

        /* Header Styling */
        .fs-3 {
            font-size: 2rem;
            font-weight: 700;
            color: #1e3a8a;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        /* Alerts */
        .text-danger {
            color: #ef4444 !important;
        }
        .text-success {
            color: #10b981 !important;
        }

        /* Modal Styling */
        .modal-content {
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(5px);
        }
        .modal-header {
            background: linear-gradient(90deg, #60a5fa, #93c5fd);
            color: #fff;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .modal-footer {
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
        }
        .modal-body input.form-control {
            border-radius: 10px;
            border: 1px solid #60a5fa;
            padding: 12px;
            transition: all 0.3s ease;
        }
        .modal-body input.form-control:focus {
            border-color: #93c5fd;
            box-shadow: 0 0 10px rgba(147, 197, 253, 0.5);
            outline: none;
        }

        /* Button Styling */
        .btn-primary {
            background: linear-gradient(90deg, #60a5fa, #93c5fd);
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            color: #fff;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(96, 165, 250, 0.4);
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #93c5fd, #60a5fa);
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(96, 165, 250, 0.6);
            color: #fff;
        }
        .btn-secondary {
            background: linear-gradient(90deg, #6b7280, #9ca3af);
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            background: linear-gradient(90deg, #9ca3af, #6b7280);
            transform: scale(1.05);
            color: #fff;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .fs-3 {
                font-size: 1.5rem;
            }
            .card-body {
                padding: 15px;
            }
            .card-body i {
                font-size: 2.5rem;
            }
            .card-body p {
                font-size: 1.25rem;
            }
            .col-md-4 {
                margin-bottom: 20px;
            }
            .modal-dialog {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${ empty adminObj }">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>

    <c:if test="${not empty errorMsg}">
        <p class="fs-3 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>

    <c:if test="${not empty succMsg}">
        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <%
        DoctorDao dao = new DoctorDao(DBConnect.getConn());
    %>
    <div class="row">
        <!-- Doctor Card -->
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <i class="fas fa-user-md"></i>
                    <p>Doctor<br><%=dao.countDoctor()%></p>
                </div>
            </div>
        </div>

        <!-- User Card -->
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <i class="fas fa-user-circle"></i>
                    <p>User<br><%=dao.countUSer()%></p>
                </div>
            </div>
        </div>

        <!-- Total Appointment Card -->
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <i class="far fa-calendar-check"></i>
                    <p>Total Appointment<br><%=dao.countAppointment()%></p>
                </div>
            </div>
        </div>

        <!-- Specialist Card with Modal -->
        <div class="col-md-4 mt-2">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body">
                    <i class="far fa-calendar-check"></i>
                    <p>Specialist<br><%=dao.countSpecialist()%></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for adding specialist -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control" required>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
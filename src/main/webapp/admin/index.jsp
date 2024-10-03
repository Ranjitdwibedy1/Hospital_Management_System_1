<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>


    <meta charset="ISO-8859-1">

    <title>Insert title here</title>
    <%@include file="../component/allcss.jsp"%>

    <style type="text/css">
        .paint-card{
            box-shadow:0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>


</head>

<body>

<%@include file="navbar.jsp"%>

<<<<<<< HEAD
<c:if test="${empty adminObj}">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>
    <c:if test="${not empty errorMsg}">
        <p class="fs-3 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session"/>
=======
<div class="container p-5">
    <p class="text-center fs-3">Admin Dashboard</p>

    <c:if test="${not empty errorMsg}">

        <p class="fs-3 text-center text-danger">${ errorMsg}</p>

        <c:remove var="errorMsg" scope="session" />

>>>>>>> a293720e5d9219702fd3f1793612e54bb564c039
    </c:if>
    <c:if test="${not empty succMsg}">
<<<<<<< HEAD
        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
        <c:remove var="succMsg" scope="session"/>
=======

        <div class="fs-3 text-center text-success" role="alert">
                ${succMsg}</div>

        <c:remove var="succMsg" scope="session" />

>>>>>>> a293720e5d9219702fd3f1793612e54bb564c039
    </c:if>

    <div class="row">

        <div class="col-md-4">

            <div class="card paint-card">

                <div class="card-body text-center text-success">

                    <i class="fas fa-user-md fa-3x"></i><br>

                    <p class="fs-4 text-center">

                        Doctor <br>5

                    </p>
                </div>
            </div>
        </div>



        <div class="col-md-4">

            <div class="card paint-card">

                <div class="card-body text-center text-success">

                    <i class="fas fa-user-circle fa-3x"></i><br>

                    <p class="fs-4 text-center">

                        User <br>43

                    </p>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card paint-card">

                <div class="card-body text-center text-success">
<<<<<<< HEAD
                    <i class="fa-solid fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">Total Appointment <br>400
=======

                    <i class="far fa-calendar-check fa-3x"></i><br>

                    <p class="fs-4 text-center">

                        Total Appointment <br>453

>>>>>>> a293720e5d9219702fd3f1793612e54bb564c039
                    </p>


                </div>

            </div>

        </div>

        <div class="col-md-4 mt-2">
<<<<<<< HEAD
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fa-solid fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">Specialist <br>21
                    </p>
                </div>
            </div>
        </div>
=======

            <div class="card paint-card" data-bs-toggle="modal"
                 data-bs-target="#exampleModal">

                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>

                    <p class="fs-4 text-center">

                        Specialist<br>34

                    </p>

                </div>

            </div>

        </div>

>>>>>>> a293720e5d9219702fd3f1793612e54bb564c039
    </div>

</div>





<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<<<<<<< HEAD
                <form action="../addSpecialist" method="post">

                    <div class="form-group">
                        <label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control">
                    </div>
                    <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary">ADD</button>
                    </div>
                </form>
=======

                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        </label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control">
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>






>>>>>>> a293720e5d9219702fd3f1793612e54bb564c039
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
</body>

</html>
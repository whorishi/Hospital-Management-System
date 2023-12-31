<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-5">
		<p class="text-center fs-3">ADMIN DASHBOARD</p>



		<c:if test="${ not empty sucMsg}">
			<p class="fs-3 text-center text-success">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session" />
		</c:if>

		<c:if test="${ not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<div class="row">
			<div class="col-md-4 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center text-seccess">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							DOCTOR <br> 5
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-seccess">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							<br>SPECIALIST 5
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center text-seccess">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							USER <br> 5
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center text-seccess">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointments <br> 5
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="modal" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../add_specialist" method="post">
						<div class="form-group">
							<label>Specialization:</label> <input class="form-contorl"
								type="text" name="spec_name" placeholder="Enter Specialization">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-success">ADD</button>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<%@include file="../component/footer.jsp"%>
</body>
</html>
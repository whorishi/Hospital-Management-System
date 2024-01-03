<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						<c:if test="${not empty logoutSucMsg }">
							<h3 class="fst-italic text-center text-success">${logoutSucMsg}</h3>
							<c:remove var="logoutSucMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg }">
							<h3 class="fst-italic text-center text-danger">${errorMsg}</h3>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						
						<form action="doctor_login" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									type="email" name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									type="password" name="password" class="form-control">
							</div>
							<button type="submit"
								class="btn bg-success text-white col-md-12 form-control">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="component/footer.jsp"%>
</body>
</html>
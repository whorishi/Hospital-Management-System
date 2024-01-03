<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> <i
			class="fa-regular fa-hospital"></i> CITY HOSPITAL
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="patient.jsp">PATIENT</a></li>

			</ul>
			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fa-solid fa-user-doctor"></i>   ${doctorObj.name }</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctor_logout">LOGOUT</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
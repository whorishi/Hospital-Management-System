<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><h2>
				<i class="fa-regular fa-hospital"></i> CITY HOSPITAL
			</h2></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				

				<c:if test="${empty userObj}">
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin_login.jsp">Admin</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor_login.jsp">Doctor</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Appointment</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_login.jsp">User</a></li>

				</c:if>
			
				<c:if test="${not empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Appointment</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">View Appointment</a></li>

					<div class="dropdown">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false"><i class="fa-solid fa-user"></i>  ${userObj.getName()}</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="#">Change Password</a></li>
							<li><a class="dropdown-item" href="user_logout">LOGOUT</a></li>
						</ul>
					</div>
				</c:if>


			</ul>
		</div>
	</div>
</nav>
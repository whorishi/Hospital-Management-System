<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DB"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 08px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/appointment.png">
			</div>
			
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Book Your Appointment</p>
						<c:if test="${not empty errorMsg }">
							<p class="fst-italic text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty bookedMsg}">
							<p class="fst-italic text-center text-success">${bookedMsg}</p>
							<c:remove var="bookedMsg" scope="session"/>
						</c:if>
						
						<form class="row g-3" action="user_appointment" method="post">
							<input type="hidden" name="uid" value="${userObj.id}">
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label>
								<input required type="text" class="form-control" name="name">
							</div>
							
							<div class="col-md-6">
								<label >Gender</label>
								<select required class="form-control" name="gender">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label>
								<input required type="text" class="form-control" name="age">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment Date</label>
								<input required type="date" class="form-control" name="appointment_date">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label>
								<input required type="text" class="form-control" name="email">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Contact No.</label>
								<input required type="text" class="form-control" name="contact">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Disease</label>
								<input required type="text" class="form-control" name="disease">
							</div>
							
							<%
								DoctorDao docDao = new DoctorDao(DB.connect());
								ArrayList<Doctor> listOfDoctors = docDao.getAllDoctors();
							%>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label>
								<select required class="form-control" name="did">
									<option value="">--select--</option>
									<%
										for(Doctor d:listOfDoctors)
										{%>
											<option value="<%=d.getId() %>"><%=d.getName() %> : <%=d.getSpecialization() %></option>
										<%}
									%>
								</select>
							</div>
							
							<div class="col-md-12">
								<label>Address</label>
								<input required type="text" class="form-control" name="address">
							</div>
							
							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-warning">Submit</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
							
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>







	<%@include file="component/footer.jsp"%>
</body>
</html>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DB"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">ADD DOCTORS</p>
						<c:if test="${not empty sucMsg }">
							<h3 class="fst-italic text-center text-success">${sucMsg}</h3>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg }">
							<h3 class="fst-italic text-center text-danger">${errorMsg}</h3>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input required
									type="text" name="name" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input required
									type="date" name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									type="text" name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialization</label> <select
									required name="specialization" class="form-control">
									<option>---select---</option>
									<%
									SpecialistDao specDao = new SpecialistDao(DB.connect());
									ArrayList<String> listOfSpec = specDao.getAllSpecialization();
									for (String s : listOfSpec) {
									%>
									<option><%=s%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input required
									type="email" name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Contact No.</label> <input required
									type="text" name="contact" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									type="password" name="password" class="form-control">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success">Add</button>
							</div>


						</form>

					</div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs=3 text-center">Doctor Details</p>
						<c:if test="${not empty UpdateSucMsg }">
							<h3 class="fst-italic text-center text-success">${UpdateSucMsg}</h3>
							<c:remove var="UpdateSucMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialization</th>
									<th scope="col">Contact No.</th>
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao docDao = new DoctorDao(DB.connect());
								ArrayList<Doctor> listOfDoctor = docDao.getAllDoctors();
								for (Doctor d : listOfDoctor) {
								%>
								<tr>
									<td><%=d.getId()%></td>
									<td><%=d.getName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialization()%></td>
									<td><%=d.getContact()%></td>
									<td><%=d.getEmail()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-warning"><i class="fa-solid fa-pencil"></i></a>
										<a href="../delete_doctor?email=<%=d.getEmail()%>" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
									</td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>


	</div>



	<%@include file="../component/footer.jsp"%>
</body>
</html>
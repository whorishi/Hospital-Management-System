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
			<div class="col-md-12 offest">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">EDIT DOCTOR</p>
						<%-- <c:if test="${not empty sucMsg }">
							<h3 class="fst-italic text-center text-success">${sucMsg}</h3>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg }">
							<h3 class="fst-italic text-center text-danger">${errorMsg}</h3>
							<c:remove var="errorMsg" scope="session" />
						</c:if> --%>
						<%
						String id_param = request.getParameter("id");
						int id = Integer.parseInt(id_param);
						DoctorDao docDao = new DoctorDao(DB.connect());
						Doctor d = docDao.getDoctorById(id);
						
						%>
						<form action="../edit_doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input required
									type="text" name="name" value="<%=d.getName()%>" class="form-control" >
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input required
									type="date" name="dob" value="<%=d.getDob()%>" class="form-control" >
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									type="text" name="qualification" value="<%=d.getQualification()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialization</label> <select
									required name="specialization" class="form-control">
									<option><%=d.getSpecialization()%></option>
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
									type="email" name="email" value="<%=d.getEmail()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Contact No.</label> <input required
									type="text" name="contact" value="<%=d.getContact()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									type="text" name="password" value="<%=d.getPassword()%>" class="form-control">
							</div>
							<input type="hidden" name="id" class="form-control" value="<%=d.getId() %>">
							
							<div class="text-center">
								<button type="submit" class="btn btn-warning">Update</button>
							</div>


						</form>

					</div>
				</div>
			</div>

		</div>


	</div>



	<%@include file="../component/footer.jsp"%>
</body>
</html>
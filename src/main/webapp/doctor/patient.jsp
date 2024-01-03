<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DB"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 fw-bold text-center text-success">Patient
							Details</p>
						<c:if test="${not empty commentSucMsg }">
							<p class="text-center text-success">${commentSucMsg }</p>
							<c:remove var="commentSucMsg" scope="session"/>	
						</c:if>
						<c:if test="${not empty commentErrMsg }">
							<p class="text-center text-danger">${commentErrMsg }</p>
							<c:remove var="commentErrMsg" scope="session"/>	
						</c:if>
						<table class="table">
							<thead>

								<tr>
									<th scope="col">Full name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">App. Date</th>
									<th scope="col">Email</th>
									<th scope="col">Contact</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor)session.getAttribute("doctorObj");
								int did = d.getId();
								AppointmentDao appDao = new AppointmentDao(DB.connect());
								ArrayList<Appointment> listOfAppointment = appDao.getAllAppointmentsByDoctorId(did);
								for(Appointment ap:listOfAppointment)
								{%>
									<tr>
									<th><%=ap.getName() %></th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getEmail() %></td>
									<td><%=ap.getContact() %></td>
									<td><%=ap.getDisease() %></td>
									<td>
										<%
										if("pending".equals(ap.getStatus()))
										{
										%>
											<button class="btn btn-warning">
											<i class="fa-regular fa-clock"></i>
											</button>
										<%
										}
										else
										{
										%>
											<button class="btn btn-success">
											<i class="fa-regular fa-circle-check"></i>
											</button>
										<%
										}
										%>
									</td>
									<%
										if("pending".equals(ap.getStatus()))
										{
										%>
											<td>
												<a href="comment.jsp?appid=<%=ap.getAppointmentId()%>" class="btn btn-success">comment</a>
											</td>
										<%
										}
										else
										{
										%>
											<td>
												<a href="#" class="btn btn-success btn-sm disabled">commented</a>
											</td>
										<%
										}
										%>
									
								</tr>
								<%}
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
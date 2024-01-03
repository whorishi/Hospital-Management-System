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
<title>View Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 08px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
							
								<tr>
									<th scope="col">Full name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User)session.getAttribute("userObj");
								AppointmentDao appDao = new AppointmentDao(DB.connect());
								DoctorDao docDao = new DoctorDao(DB.connect());
								int uid = u.getId();
								ArrayList<Appointment> listOfAppointment = appDao.getAllAppointmentsByUserId(uid);
								for(Appointment ap:listOfAppointment) 
								{%>
								<tr>
									<th><%=ap.getName() %></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getDisease() %></td>
									<%
									Doctor doc = docDao.getDoctorById(ap.getDoctorId());
									%>
									<td><%=doc.getName() %></td>
									<td>
										<%
										if("pending".equals(ap.getStatus()))
										{%>
											<button class="btn btn-warning"><i class="fa-regular fa-clock"></i>PENDING</button>
										<%}
										else
										{%>
											<button class="btn btn-success"><i class="fa-regular fa-circle-check"></i>Approved</button>
										<%}
										%>
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
			
			<div class="col-md-4 p-3">
				<img alt="" src="img/appointment2.png">
				
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>
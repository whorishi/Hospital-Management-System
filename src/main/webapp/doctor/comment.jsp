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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../component/allcss.jsp" %>
<title>Comment</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)''
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fd-4">Patient Comment</p>
						<%
						int appId = Integer.parseInt(request.getParameter("appid"));
						//System.out.println(appointmentId);
						AppointmentDao appDao = new AppointmentDao(DB.connect());
						Appointment app = appDao.getAppointmentsByAppointmentId(appId);
						%>
						<form class="row" action="../doctor_comment" method="post">
							<div class="col-md-6">
								<label>Patient Name</label>
								<input type="text" readonly value="<%=app.getName() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Age</label>
								<input type="text" readonly value="<%=app.getAge() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Contact</label>
								<input type="text" readonly value="<%=app.getContact() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Disease</label>
								<input type="text" readonly value="<%=app.getDisease() %>" class="form-control">
							</div>
							
							<div class="col-md-12">
								<label>Comment</label>
								<textarea required name="comment" class="form-control" row="3" cols=""></textarea>
							</div>
							
							<input type="hidden" name="appid" value="<%=app.getAppointmentId() %>">
							<input type="hidden" name="docid" value="<%=app.getDoctorId() %>">
							<button type="submit" class="text-center btn btn-success">Comment</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<%@include file="../component/footer.jsp" %>
</body>
</html>
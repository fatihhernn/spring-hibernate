<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
	<title>List Customer</title>
	
	<!-- references our style sheet -->
	
	<link type="text/css" 
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css"	/>
</head>
<body>
	
	<div id="wrapper">
		<div id="header">
			<h2> CRM- Customer Reletionship Menager </h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content" >
			<!-- put new button : add customer -->
			<input type="button" value="Add Customer" 
			onclick="window.location.href='showFormForAdd';return false;"
			class="add-button"
			/>
			
			<!--  add a search box -->
            <form:form action="search" method="GET">
                Search customer: <input type="text" name="theSearchName" /><input type="submit" value="Search" class="add-button" />
            </form:form>
		
			<!-- add out html table here -->
			<table>
			 	
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<!-- loop over and pribt our customers, kontroller sınıfına tanımlı olan customerstan gelecek -->
				<c:forEach var="tempCustomer" items="${customers}" >
				
					<!-- costruct an "update" link with customer id -->
			 		<c:url var="updateLink" value="/customer/showFormForUpdate">
			 			<c:param name="customerId" value="${tempCustomer.id}"></c:param>
			 		</c:url>
			 		
			 		<!-- construct an "delete" link with customer id -->
			 		<c:url var="deleteLink" value="/customer/delete">
			 			<c:param name="customerId" value="${tempCustomer.id}"></c:param>
			 		</c:url>
			 	
					<tr>
						<td>${tempCustomer.firstname}</td>
						<td>${tempCustomer.lastname}</td>
						<td>${tempCustomer.email}</td>
						<td><a href="${updateLink }">Update</a> 
							| 
							<a href="${deleteLink }" onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a></td> 
					</tr>	
				</c:forEach>
			
			</table>
		</div>
	</div>
	
</body>
</html>
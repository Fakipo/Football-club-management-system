<!DOCTYPE html>
<html>

<head>
	
	<title>Booking Form HTML Template</title>


	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="bookstyle.css" />

<%
		response.setHeader("Cache-Control","no-cache,no-store,must-validate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
		String s;
		String loginAs;
		s = (String) session.getAttribute("email");
		session.setAttribute("remail",s);
		loginAs = (String) session.getAttribute("loginAsHome");
		if(s==null)
		{
			response.sendRedirect("SignUp.jsp");
		}
		else if(loginAs==null)
		{
			response.sendRedirect("SignUp.jsp");
		}
		else if(!loginAs.equals("fan"))
		{
			session.setAttribute("notFan","no" );
			response.sendRedirect("HomePage.jsp");
		}
%>

</head>

<body>
   <a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<div class="booking-bg"></div>
						<form action = "Ticket">
							<div class="form-header">
								<h1>Book your Ticket</h1>
								    <h2>Arsenal vs </h2><Label for="opponent">Real Madrid</label><!-- opponent team-->
									<h6 >Upper: $15,Lower: $10,V.I.P:$25</h6> 
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Seat</span>
										<select name="seat" class="form-control">
											<option value = "upper">Upper</option>
											<option value = "lower">Lower</option>
											<option value = "vip">VIP</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<span class="form-label">Qty</span>
										<select name = "quantity" class="form-control">
											<option value = "1">1</option>
											<option value = "2">2</option>
											<option value = "3">3</option>
											<option value = "4">4</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								
							</div>
							<div class="form-group">
								<span class="form-label">Email</span>	
								<input class="form-control" name="xemail" type="email" placeholder="<%= s	%>" disabled>
							</div>
							<div class="form-group">
								<span class="form-label">Phone</span>
								<input class="form-control" id="m1" name="telephone" type="number" placeholder="Enter your phone number" required minlength="10" autocomplete="off" onkeydown="return event.keyCode !== 69" >
							</div>
							
							<div class="form-btn">
								<button class="submit-btn" onclick="return ValidateNo()">Book Now</button>
							</div>
							<% session.setAttribute("booklogin",loginAs);%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Validation for telephone -->
</body>


<script>
  function ValidateNo() {
  var phoneNo = document.getElementById('m1');

  if ((phoneNo.value.length < 10) || (phoneNo.value.length > 10)) {
    alert("Mobile No. is not valid, Please Enter a 10 Digit Mobile No.");
    return false;
  }
  return true;
   }
  </script> 

</html>
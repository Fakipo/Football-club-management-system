<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Shipping</title>
 <link rel="stylesheet" href="shipstyle.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo">
  </head>
<body>
<%
	String s;
	s =	request.getParameter("types");
	String semail = (String)session.getAttribute("semail");
	//out.println(s);
%>
<div class="wrapper">
    <div class="container">
        <form action="shopship">
            <h1>
                Shipping Details
            </h1>
            <div class="name">
                <div>
                    <label for="f-name">First Name</label>
                    <input type="text" id="m1" name="fname" required>
                </div>
                <div>
                    <label for="l-name">Last Name</label>
                    <input type="text" id="m2" name="lname" required>
                </div>
            </div>
            <div class="street">
                <label for="name">Street</label>
                <input type="text" name="street" required>
            </div>
            <div class="address-info">
                <div>
                    <label for="city">City</label>
                    <input type="text" id="m3" name="city">
                </div>
                <div>
                    <label for="state">State</label>
                    <input type="text" id="m4" name="state" required>
                </div>
                <div>
                    <label for="zip">Zip</label>
                    <input type="number" id="m5" name="zip" required>
                </div>
            </div>
            <h1>
               	 Payment Information
            </h1>
            <div class="cc-num">
                <label for="card-num">Credit/Debit Card No.</label>
                <input type="number" id="m6" name="cardnum" required >
            </div>
            <div class="cc-info">
                <div>
                    <label for="card-num">Exp</label>
                    <input type="date" id="" name="expire" required>
                </div>
                <div>
                    <label for="card-num">CVV</label>
                    <input type="number" id="m7" name="cvv" required>
                </div>
            </div>
            <div class="btns">
                <button onclick = "return Validate()">purchase </button>
               
            </div>
			<%
	session.setAttribute("shoptype",s);
    session.setAttribute("billemail",semail);                		
%>
             </form>

    </div>
</div>

</body>
            


<script>
  
    function Validate() {
	     var ch = /^[a-zA-Z]+$/; 
	   var a = document.getElementById("m1").value;
	   var b = document.getElementById("m2").value;
	   var c = document.getElementById("m3").value;
	   var d = document.getElementById("m4").value;
	  
	   if(a.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid First name");
			  return false ;
			}
	   if(b.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid last name");
			  return false ;
			}
	   if(c.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid city");
			  return false ;
			}
	   if(d.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid state");
			  return false ;
			}
       var zip = document.getElementById('m5');
       var card_No = document.getElementById('m6');
       var cvv_No = document.getElementById('m7');
	   
	   if ((zip.value.length < 6 )||( zip.value.length > 6)) {
    alert("Enter a valid Zipcode, must be 6 digit");
    return false;
  }
  if ((card_No.value.length < 16) || (card_No.value.length > 16)) {
    alert("card no. is not valid!!");
    return false;
  }
   if ((cvv_No.value.length < 3) || (cvv_No.value.length > 3)) {
    alert("cvv is not valid!!");
    return false;
  }
        return true;
		
    }
   </script>
</html>
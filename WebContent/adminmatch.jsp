	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
   <title>Adminform</title>
   <link rel="stylesheet" href="Adminstyle.css">
</head>
<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
 <div class="loginbox">
	
   <form onsubmit="return Validate()" action = "addmatch">
	<h2>Match Details</h2>
	<p>Opponent</p>
	<select name="opponent">
    <option value="chelsea">Chelsea</option>
    <option value="barcelona">Barcelona</option>
    <option value="liverpool">liverpool</option>
	<option value="juventus">Juventus</option>
    <option value="paris">Paris</option>
    <option value="realmadrid" >Real Madrid</option>
  </select>
	
	    <p>Match no.</p>
		<input type="number" id="m1" name="matchno" placeholder="Enter Match no." required><br><br>
        <label >Date</label>
        <input type="date" name="matchdate" id="matchdate" required>
		<input type="submit" name="" value="Add Match">
		
	</form>
</div>
</body>


<script>
  function Validate() {
  var match_no = document.getElementById('m1');

  if ((match_no.value <= 0) || (match_no.value > 100)) {
    alert("Match No. is not valid, Please Enter a valid No.");
    return false;
  }
  return true;
   }
  </script> 
</html>
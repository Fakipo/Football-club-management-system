<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
   <title>Add Member</title>
   <link rel="stylesheet" href="addstyle.css">
</head>

<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
 <div class="addbox">
	<h2>Add Member</h2>
	
 
	<form onsubmit="return validation()" action="addplayer">
	    	
	
    <h4>Member</h4>
    <div class="form-inline">
        <input type="text" id="m1" name="name" placeholder="Enter name" required><br>
        <select name = "memtype">
         <option value="manager">Manager</option>
         <option value="player">Player</option>
         <option value="staff">Staff</option>
		 
        </select>
    </div>
	   <input type="submit" name="" value="Add+">
	</form>
</div>
</body>

<script>
   function validation()
     { 
	   var c = /^[a-zA-Z]+$/; 
	   var a = document.getElementById("m1").value;
	   if(a.match(c))
	      true ;
		  else
		    {
			  alert("Enter a valid name");
			  return false ;
			}

      }

</script>
</html>
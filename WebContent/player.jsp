<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import ="java.util.*" %>
    <%@page import = "java.sql.*" %>
<html>
<head>
   <title>Team Selection</title>
   <link rel="stylesheet" href="playerstyle.css">
</head>

<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
<%
	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
	String d = (String) session.getAttribute("roll");
	if(!d.equals("manager"))
	{	
		session.setAttribute("notemanager","no");
		response.sendRedirect("clubmain.jsp");
		
	}
%>
 <div class="loginbox">
	<!--<img src=" class="user" >-->
  
	<h2>Make Team</h2>
	
 
	<form action="maketeam" onsubmit = "return Validate()">
	    	
	
    <h4>Captain</h4>
    <div class="form-inline">
        <input type="text" name="pl1" placeholder="Enter name" id="m1" required>
        <select name = "sp1">
		 <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>player 2</h4>
    <div class="form-inline">
        <input type="text" name="pl2" placeholder="Enter name"  id="m2" required>
        <select name="sp2">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>player 3</h4>
    <div class="form-inline">
        <input type="text" name="pl3" placeholder="Enter name"  id="m3" required>
        <select name = "sp3">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>        </select>
    </div>
	
	<h4>player 4</h4>
    <div class="form-inline">
        <input type="text" name="pl4" placeholder="Enter name"  id="m4" required>
        <select name="sp4">
                <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>player 5</h4>
    <div class="form-inline">
        <input type="text" name="pl5" placeholder="Enter name" id="m5" required>
        <select name = "sp5">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>        </select>
    </div>
	
	<h4>player 6</h4>
    <div class="form-inline">
        <input type="text" name="pl6" placeholder="Enter name" id="m6" required>
        <select name = "sp6">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>        </select>
    </div>
	
	<h4>player 7</h4>
    <div class="form-inline">
        <input type="text" name="pl7" placeholder="Enter name" id="m7" required>
        <select name="sp7">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>        </select>
    </div>
	
	<h4>player 8</h4>
    <div class="form-inline">
        <input type="text" name="pl8" placeholder="Enter name" id="m8" required>
        <select name="sp8">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option> 
       </select>
    </div>
	
	<h4>player 9</h4>
    <div class="form-inline">
        <input type="text" name="pl9" placeholder="Enter name" id="m9" required>
        <select name="sp9">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>player 10</h4>
    <div class="form-inline">
       <input type="text" name="pl10" placeholder="Enter name" id="m10" required>
        <select name = "sp10">
          <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>player 11</h4>
    <div class="form-inline">
        <input type="text" name="pl11" placeholder="Enter name" id="m11" required>
        <select name = "sp11">
         <option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h2>Substitutes
	<h4>Substitute 1</h4>
    <div class="form-inline">
        <input type="text" name="s1" placeholder="Enter name" id="m12" required>
        <select name = "ss1">
<option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>Substitute 2</h4>
    <div class="form-inline">
        <input type="text" name="s2" placeholder="Enter name" id="m13" required>
        <select name = "ss2">
<option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<h4>Substitute 3</h4>
    <div class="form-inline">
        <input type="text" name="s3" placeholder="Enter name" id="m14" required>
        <select name = "ss3">
<option value = "goalkeeper">Goalkeeper</option>
         <option value = "defender" >Centre back</option>
         <option value = "fullback">Fullback</option>
		 <option value = "mid">Center Midfielder </option>
         <option value = "sidemid">Side Midfielder </option>
         <option value = "winger" >Winger</option>
		  <option value = "striker" >Striker</option>
        </select>
    </div>
	
	<input type="submit" name="" value="Submit">
	</form>
</div>
</body>


<script>
  
    function Validate() 
{
	     var ch = /^[a-zA-Z]+$/; 
	   var a = document.getElementById("m1").value;
	   var b = document.getElementById("m2").value;
	   var c = document.getElementById("m3").value;
	   var d = document.getElementById("m4").value;
	   var e = document.getElementById("m5").value;
	   var f = document.getElementById("m6").value;
	   var g = document.getElementById("m7").value;
	   var h = document.getElementById("m8").value;
	   var i = document.getElementById("m9").value;
	   var j = document.getElementById("m10").value;
	   var k = document.getElementById("m11").value;
	   var l = document.getElementById("m12").value;
	   var m = document.getElementById("m13").value;
	   var n = document.getElementById("m14").value;
	   if(a.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 1");
			  return false ;
			}
	   if(b.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 2");
			  return false ;
			}
	   if(c.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 3");
			  return false ;
			}
	   if(d.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 4");
			  return false ;
		    }
		 if(e.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 5");
			  return false ;
			}
	   if(f.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 6");
			  return false ;
			}
	   if(g.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 7");
			  return false ;
			}
	   if(h.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 8");
			  return false ;
		    }
		 if(i.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 9");
			  return false ;
			}
	   if(j.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 10");
			  return false ;
			}
	   if(k.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 11");
			  return false ;
			}
	   if(l.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 12");
			  return false ;
		    }
	   if(m.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 13");
			  return false ;
		    }
		if(n.match(ch))
	      true ;
		  else
		    {
			  alert("Enter a valid name of player 14");
			  return false ;
		    }
			alert("good");
	}
	</script>		
</html>
import java.util.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class First
 */
@WebServlet("/First")
public class First extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public First() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	//	String a = req.getParameter("email");
	//	String b = req.getParameter("pass");
		
	//	req.setAttribute("mail",a);
		//req.setAttribute("password",b);
	//	RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
	//	rd.forward(req,res);
		String a = req.getParameter("email");
		String b = req.getParameter("pass");
		String c = req.getParameter("loginAs");
		if(c=="admin")
		{
			c = "admin";
		}
		else if(c=="clubmember")
		{
			c = "clubmember";
		}
		else if (c=="fan")
		{
			c = "fan";
		}
		HttpSession session = req.getSession();
		session.setAttribute("yemail", a);
		
		List l = new LinkedList();
		if(a.length()==0 || b.length()==0 )
		{
			l.add("You can't leave fields empty, add both name and the password");
		}

			try { 
	  
	            // Initialize the database 
	            Connection con = DatabaseConnection.initializeDatabase(); 
	  
	            // Create a SQL query to insert data into demo table 
	            // demo table consists of two columns, so two '?' is used 
	            PreparedStatement st = con 
	                   .prepareStatement("select * from "+c+" where email ='"+a+"' and pass = '"+b+"'"); 
	            ResultSet rs = st.executeQuery();
	            
	            // For the first parameter, 
	            // get the data using request object 
	            // sets the data to st pointer 
	            PrintWriter out = res.getWriter();           
	  
	        	if(rs.next())
	        	{


	        		session.setAttribute("loginAs",c);	        		

	    	        if(c.equals("admin"))
	    	        {
	            		RequestDispatcher rp = req.getRequestDispatcher("mainadmin.jsp");
	            		rp.forward(req, res);	        	
	    	        }
	    	        else if (c.equals("clubmember")||c.equals("fan"))
	    	        {
	            		RequestDispatcher rp = req.getRequestDispatcher("HomePage.jsp");
	            		rp.forward(req, res);
	    	        }
	        	}
	        	else
	        		{
	        		l.add("Enter right username and password");
	        		}
	        	rs.close();
	            st.close(); 
	            con.close(); 
	  
	            // Get a writer pointer  
	            // to display the successful result 

	          //  out.println("<html><body><b>Successfully Inserted" + "</b></body></html>"); 


			} 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
			if(!l.isEmpty())
			{	

				req.setAttribute("errorlist", l);
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req,res);
			}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	    } 	 
}
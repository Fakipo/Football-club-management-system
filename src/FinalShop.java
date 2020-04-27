

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FinalShop
 */
@WebServlet("/FinalShop")
public class FinalShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();   
		HttpSession session = request.getSession();
		String a = (String)session.getAttribute("shopmail");
		String b = (String)session.getAttribute("shoptype");

		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
//		out.println("swal ( 'Successful' ,  '' ,  'success' );");
		out.println("swal ( 'Order has been placed' ,  'Successful !' ,  'success' );");
		out.println("});");
		out.println("</script>"); 
		
		session.setAttribute("invoicemail", a);
		session.setAttribute("invoiceproduct", b);
		RequestDispatcher rd = request.getRequestDispatcher("sinvoice.jsp");
		rd.include(request,response);
		
	}

}

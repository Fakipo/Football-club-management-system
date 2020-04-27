

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
 * Servlet implementation class FinalTicket
 */
@WebServlet("/FinalTicket")
public class FinalTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	String c = request.getParameter("ok");
		 PrintWriter out = response.getWriter();   

		HttpSession session = request.getSession();
		String pos = (String)session.getAttribute("position");
		String quant = (String)session.getAttribute("quantity");
		String price = (String)session.getAttribute("price");
		String mial = (String)session.getAttribute("finaltmail");
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
//		out.println("swal ( 'Successful' ,  '' ,  'success' );");
		out.println("swal ( 'Tickets Have Been Booked' ,  'Successful !' ,  'success' );");
		out.println("});");
		out.println("</script>"); 
		session.setAttribute("invoicemail",mial);	
		session.setAttribute("invoicequant",quant);
		session.setAttribute("invoiceprice",price);		
		session.setAttribute("invoicepos",pos);
		
		RequestDispatcher rd = request.getRequestDispatcher("tinvoice.jsp");
		rd.include(request,response);
	}
}

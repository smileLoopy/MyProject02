package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/idValidate.do")
public class IdController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		MembershipDAO dao = new MembershipDAO();
		
		String u_Id = req.getParameter("inputId");
		
		MembershipDTO dto = dao.idValidate(u_Id);
		
		boolean result = true;
		
		if(dto.getId() == null) {
			result = true;
			
			resp.sendRedirect("id_duplication.jsp?inputId="+u_Id);
		} else if(dto.getId().equals(u_Id)) {
			result = false;
			/* JSFunction.alertBack("중복되었습니다.", out); */
		}
	
	
	}
	
}

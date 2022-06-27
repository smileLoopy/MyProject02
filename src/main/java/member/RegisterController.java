package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

@WebServlet("/member/register.do")
public class RegisterController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/member/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String inputFirstName = req.getParameter("inputFirstName");
		String inputLastName = req.getParameter("inputLastName");
		String id = req.getParameter("inputId");
		String pass1 = req.getParameter("inputPassword");
		String pass2 = req.getParameter("inputPasswordConfirm");
		
		/*
		 * if(inputFirstName.equals("")) { JSFunction.alertBack(resp,
		 * "Enter your fucking Firstname"); } else if (inputLastName.equals("")) {
		 * JSFunction.alertBack(resp, "Enter your fucking Lastname"); } else if
		 * (id.equals("")) { JSFunction.alertBack(resp, "Enter your fucking id"); } else
		 * if (pass1.equals("")) { JSFunction.alertBack(resp,
		 * "Enter your fucking password"); } else if (pass2.equals("")) {
		 * JSFunction.alertBack(resp, "Enter your fucking password confirm"); } else if
		 * (!pass1.equals(pass2)) { JSFunction.alertBack(resp,
		 * "Fucking Passwords must match"); }
		 */
		 
		////////////////////////////////////////////////////////////

		//megister_date은 기본으로 sysdate를 지정하였으므로 할필요없습니다
		
		MembershipDAO mDao = new MembershipDAO();
		
		MembershipDTO mDto = new MembershipDTO();
		
		mDto.setFirstname(inputFirstName);
		mDto.setLastname(inputLastName);
		mDto.setId(id); 
		mDto.setPass(pass2);
		
		System.out.println(mDto.getPass());
		
		int Result = mDao.memberInsert(mDto);
		mDao.close(); //반납
		
		
		
		if (Result == 1) {

			JSFunction.alertLocation(resp, "회원가입성공", "/MariaMVCBoard/Website/index.jsp");
		} else {
			
			JSFunction.alertBack(resp, "회원가입실패");

		}
	}
}
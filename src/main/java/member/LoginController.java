package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBConnect;
import utils.JSFunction;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	
	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../admin/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디와 비번을 가져옵니다.
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		//관리자 아이디 가져오기 => 현재 null 값으로 안가져와짐. => 필요없음.
		String admin_id = this.getInitParameter("admin_id");
		System.out.println("admin_id: "+ admin_id);
		
		// 여긴 또 js function 으로 폼값 검증이됨... 
//		if(id.equals("")) {
//			JSFunction.alertBack(resp, "Enter your fucking id");
//		}
//		else if (pass.equals("")) {
//			JSFunction.alertBack(resp, "Enter your fucking pass");
//		}
		
		//DAO객체를 생성합니다
		MembershipDAO mDao = new MembershipDAO();
		
		//DAO의 memberSelect()의 결과값을 DTO에 저장합니다
		
		MembershipDTO dto = mDao.memberSelect(id, pass);
		//System.out.println(dto.getUser_name());
		
		mDao.close(); //반납
		
		//회원정보를 찾으면...
		if(dto.getId() != null) {
			//세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
		    session.setAttribute("firstname", dto.getFirstname());
		    
		    JSFunction.alertLocation(resp, "로그인성공", "/MariaMVCBoard/Website/index.jsp");
		}else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다");
		}
	}
}
package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//이렇게 같은 클래스를 참고하는 경우 와일드카드를 사용할수있습니다.
import javax.servlet.http.*;


@WebServlet("/member/logout.do")
public class LogoutController extends HttpServlet {

	//여기선 로그아웃은 한가지 경우이기에 service메서드로 해봅시다
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그아웃시 세션내용을 지웁니다
		HttpSession session = req.getSession();
		
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_NAME");
		
		//한꺼번에 지우기
		//session.invalidate();

		//메인페이지로 이동
		resp.sendRedirect("../index.do");
	}


}
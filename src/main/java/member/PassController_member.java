package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import mynotice.MyNoticeDAO;
import utils.JSFunction;


//어노테이션을 통한 요청명 매핑
@WebServlet("/member/pass.do")
public class PassController_member extends HttpServlet {
	//패스워드 검증 페이지로 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		/mvcboard/pass.do?mode=edit&idx=156
		요청명은 이와 같으므로 파라미터를 받아오는 작업을 해야 한다.
		서블릿에서는 2가지 방법으로 받을 수 있는데 
		방법1: request 내장객체를 이용한다. => req.getParameter (파라미터명)
		방법2: View(JSP파일)에서 EL의 param 내장객체를 사용한다 => ${param.파라미터명}
		 */
		//파라미터를 request영역에 저장한 후 View로 포워드 한다.
		req.setAttribute("mode", req.getParameter("mode"));
		req.setAttribute("idx", req.getParameter("idx"));
		req.getRequestDispatcher("/admin/Pass_member.jsp").forward(req, resp);
	}
	
	//전송한 폼값을 받아 수정페이지로 이동 혹은 게시물 삭제처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//검증페이지에서 전송한 폼값을 받음
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		
		//커넥션풀을 통한 DB연결 및 패스워드 검증 
		MembershipDAO dao = new MembershipDAO();
		
		System.out.println("mode:"+ mode);
		/*
		edit은 어짜피 editprocess에서 db연결 다시함 그리고 위에서 패스워드 성공한게 아니면 그전에 디비 연결을 끊어야함
		delete은 일단 이것도 패스워드 실패하면 디비연결 끊어야되고 selevtView로 파일 데이터 다시 불러와야되니까 디비 연결을
		다시 해야함.
		 */
		/* dao.close(); */
		
		/*
		패스워드 검증에 성공한 경우 
			mode가 edit이면 수정페이지로 이동한다.
				delete이면 게시물을 즉시 삭제한다. 
		 */
		
		if(mode.equals("edit")) {
			/*
			검증이 완료된 패스워드를 session영역에 저장한다.
			session영역은 페이지를 이동해도 데이터가 공유되므로 해당 게시물을
			수정완료할때까지는 유지하고, 수정이 완료되면 제거할 것이다.
			여기에서 저장한 패스워드는 수정을 위한 update쿼리문의 where절의
			조건으로 사용된다.
			 */
			resp.sendRedirect("../member/edit.do?idx="+ idx);
		}
		else if (mode.equals("delete")) {
			//삭제인 경우 커넥션풀을 통해 DB연결
			dao = new MembershipDAO();
			//기존의 게시물을 얻어온다.
			MembershipDTO dto = dao.selectView(idx);
			//게시물을 삭제한다.
			int result = dao.deletePost(idx);
			//커넥션풀에 자원 반납
			dao.close();
			//알림창을 띄운 후 리스트(목록)으로 이동한다.
			JSFunction.alertLocation(resp, "삭제되었습니다.", "../member/list.do");
			
		}
		
	
	}
}

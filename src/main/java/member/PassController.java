package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;


//어노테이션을 통한 요청명 매핑
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
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
		req.getRequestDispatcher("/BoardSkin/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		if(confirmed) {
			if(mode.equals("edit")) {
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../mvcboard/edit.do?idx="+ idx);
				
			}
			else if (mode.equals("delete")) {
				dao = new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);
				int result = dao.deletePost(idx);
				dao.close();
				if(result==1) {
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
				
			}
			
		}
		else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
		
	
	}
}

package member;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

//수정처리를 위한 매핑 (pass eidt으로 선택하면 여기로 넘어옴)
@WebServlet("/member/edit.do")
public class EditController_member extends HttpServlet {
	
	//수정페이지로 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		파라미터로 전달된 idx값을 받은 후 기존 게시물을 조회한다.
		조회된 결과를 수정페이지의 각 input태그에 value속성으로 삽입한다. 
		<textarea>는 value속성이 없으므로 태그사이에 값을 삽입한다.
		 */
		String idx = req.getParameter("idx");
		MembershipDAO dao = new MembershipDAO();
		MembershipDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/admin/Edit_member.jsp").forward(req, resp);
	}
	
	//게시물 수정처리 및 파일업로드 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//디렉토리의 물리적 경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		// this => 서블릿자체에서 가져오는거
		//web.xml에 기술한 컨텍스트 초기화 파라미터를 얻어온다.
		ServletContext application = this.getServletContext();
		
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일업로드 처리. 객체 생성과 동시에 업로드는 완료된다.
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if( mr==null) {
			//업로드 directory 를 못가져와도 여기로 에러가 떨어짐. 
			JSFunction.alertLocation(resp, "제한용량초과 or 디렉토리 경로를 확안하세요.", "../myboard/write.do");
			return;
		}
		
		
		String idx = mr.getParameter("idx");
		String firstname = mr.getParameter("firstname");
		String lastname = mr.getParameter("lastname");
		String id = mr.getParameter("id");
		String pass = mr.getParameter("pass");
		
		
		System.out.println("idx"+ idx);
		System.out.println("firstname"+ firstname);
		System.out.println("lastname"+ lastname);
		System.out.println("id"+ id);
		System.out.println("pass"+ pass);
		
		
		//DTO에 폼값 저장
		MembershipDTO dto = new MembershipDTO();
		dto.setIdx(idx);
		dto.setFirstname(firstname);
		dto.setLastname(lastname);
		dto.setId(id);
		dto.setPass(pass);
		
		
		//DB연결 및 업데이트 처리
		MembershipDAO dao = new MembershipDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		
		if(result == 1) {
			resp.sendRedirect("../member/view.do?idx=" + idx);
			
		} else {
			JSFunction.alertBack(resp, "회원정보 수정 실패");
		}
		
		
	}

}

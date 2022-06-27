package myboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/myboard/list.do")
//게시판 목록 요청 처리를 위한 서블릿 클래스
public class ListController extends HttpServlet{

	//목록의 경우 메뉴를 클릭한 후 이동하므로 get방식으로 요청하게 된다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 이용한 DB연결을 위해 DAO객체 생성
		MyBoardDAO dao = new MyBoardDAO();
		
		//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//현재 페이지에 출력할 게시물을 얻어옴.
		//DAO에서 가져온 board 가 쫙 들어옴. 
		List<MyBoardDTO> boardLists = dao.selectlist(map);
		
		System.out.println("boardLists:"+ boardLists);
		
		//커넥션풀에 자원 반납
		dao.close();
		
		//View로 전달할 객체들을 request영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		//View로 포워드를 걸어준다.
		req.getRequestDispatcher("/admin/tables2.jsp").forward(req, resp);
	
	}
	
}

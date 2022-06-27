package myboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
어노테이션을 통한 매핑은 요청명을 해당 컨트롤러 상단에 기술하면된다.
이 또한 요청명에 대한 기술이 잘못될 경우 톰켓이 시작되지 않을 수 있으므로 
주의해야 한다.(꼭 슬러쉬로 시작해야 한다)
 */
@WebServlet("/myboard/view.do")
public class ViewController extends HttpServlet{
	
	/*
	service()는 서블릿의 수명주기 메서드 중 사용자의 요청을 전송방식에
	상관없이 먼저 받아 doGet() 혹은 doPost()로 요청을 전달하는 역할을 한다.
	따라서 방식에 상관없이 요청을 처리할 수 있다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 통해 DB연결
		MyBoardDAO dao = new MyBoardDAO();
		//일련번호를 파라미터로 받음
		String idx = req.getParameter("idx");
		//조회수 증가
		dao.updateViewCount(idx);
		//게시물 조회
		MyBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		
		//첨부파일의 확장자를 확인하여 처리하기 (저장됨 값을 가지고 처리하는게 더 중요)
		String fileName = dto.getSfile();
		String fileType = "";
		if( dto.getSfile() != null) {
			//첨부된 파일이 있다면.. 
			//파일의 확장자 따내기 
			//파일명의 마지막에 있는 .(닷)의 인덱스를 찾은 후 확장자를 잘라냄
			//방법1. 
			//String ext = dto.getSfile().substring(dto.getSfile().lastIndexOf("."));
			//방법2.
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			System.out.println("확장자=" + ext);
			
			if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
				//첨부파일이 이미지인 경우
				fileType = "image";
			}
			else if (ext.equals("mp3")) {
				//첨부파일이 음원파일인 경우
				fileType = "music";
			}
			dto.getSfile();
			
		}
		
		
		
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
		req.setAttribute("fileType", fileType);
		req.getRequestDispatcher("../admin/View.jsp").forward(req, resp);
	}
}

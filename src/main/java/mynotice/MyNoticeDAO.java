package mynotice;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;
import myboard.MyBoardDTO;

public class MyNoticeDAO extends DBConnPool{
	
	//부모클래스 기본 생성자 사용 DB연결
	public MyNoticeDAO() {
		super();
	}
	
	//게시판 목록 출력
	public List<MyNoticeDTO> selectlist(Map<String, Object> map){
		
		
		List<MyNoticeDTO> board = new ArrayList<MyNoticeDTO>();
		
		String query = "SELECT * FROM notice ORDER BY idx DESC ";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			//값이 있으면 dto에 모두 저장.
			while(rs.next()) {
				
				MyNoticeDTO dto = new MyNoticeDTO();
				
				//저장
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setViewcount(rs.getInt(10));
				
				//list 보드에 해당 값들 모두 넣기
				board.add(dto);
				
			}
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생함.");
			e.printStackTrace();
		}
		
		return board;
	}
	
	//글쓰기
	public int insertWrite(MyNoticeDTO dto) {
		
		int result = 0;
		
		try {
			
			String query = "INSERT INTO notice (name, title, content, ofile, sfile, pass) "
					+ " VALUES (?, ?, ?, ?, ?, ?) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
			
		}
		
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//파일 다운로드 횟수 증가
	public void downCountPluse(String idx) {
		String query = "UPDATE notice SET downcount=downcount+1 WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("파일 다운로드 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	//상세보기
	public MyNoticeDTO selectView (String idx) {
		
		//조회된 레코드를 DTO객체에 저장한 후 반환한다.
		MyNoticeDTO dto = new MyNoticeDTO();
		//인파라미터가 있는 쿼리문 작성
		String query = "SELECT * FROM notice WHERE idx=?";
		
		try {
			//쿼리실행을 위한 객체생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			//조회된 레코드가 있을때 DTO객체에 각 컬럼값을 저장한다.
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setViewcount(rs.getInt(10));
			}
			
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		//저장된 값 반환.
		return dto;
	}
	
	//방문자 수 증가
	public void updateViewCount(String idx) {
		String query = "UPDATE notice SET viewcount=viewcount+1 WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	//수정/삭제 전 해당 게시물의 패스워드 검증
	
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM notice WHERE pass=? AND idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			
			/*
			select문에 count()함수를 사용하는 경우 조건(where절)에 만족하는 레코드가
			없을때는 0, 만족하는 레코드가 있을때는 1이상의 정수값이 반환된다.
			즉 어떤경우에도 결과값이 있으므로 next() 호출시 if문이 필요하지 않다.
			 */
			rs.next();
			/*
			resultSet => 레코드. next 는 레코드 하나씩 읽는것. 3행이 있으면 next 3번.
			만약 결과가 없으면 0임 그래서 if에 넣으면 값이 없으면 false 
			
			if(rs.next()) : 결과가 있을수도 있고 없을수도 있고 
				=> 일바적인 select문을 사용하는 경우에 1개의 레코드만 반환될때 사용한다. 
				주로 일련번호를 조건으로 추가하는 경우인데, 만족하는 레코드가 없다면
				next()를 사용할때 에러가 발생된다. 
			
			While(rs.next()) : 결과가 2개 이상일때 
				=> select의 결과가 2개이상일때 사용된다. 주로 게시판의 목록과 같이 
				여러개의 레코드가 반환되는 경우에 사용한다.
			 */
			
			//일치하는 결과가 없는 경우 false를 반환한다. 
			if(rs.getInt(1) ==0) {
				isCorr = false;
			}
		}
		catch (Exception e) {
			//예외가 발생하면 검증이 안된것이므로 이때도 false를 반환한다.
			isCorr = false;
			e.printStackTrace();
			
		}
		//검증이 완료되었을때만 ture를 반환한다.
		return isCorr;
	}
	
	//게시물 삭제하기
	public int deletePost (String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM notice WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			
		}
		return result;
	}
	
	//게시물 수정 처리 
	public int updatePost (MyNoticeDTO dto) {
		int result = 0;
		try {
			//update쿼리문 작성
			String query = "UPDATE notice SET title=?, name=?, content=?, ofile=?, sfile=? WHERE idx=? and pass=?";
			
			//동적쿼리문 실행을 위해 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			//쿼리 실행 및 결과 반환 (update된 행의 갯수 반환)
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	

}

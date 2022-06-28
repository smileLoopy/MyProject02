package member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.DBConnPool;
import common.JDBConnect;
import myboard.MyBoardDTO;

public class MembershipDAO extends DBConnPool{

	//DB연결
	public MembershipDAO() {
		super();
	}
	
	//회원가입
	public int memberInsert (MembershipDTO mDto) {
		
		int result = 0;
		
		try {
			
			String sql = "INSERT INTO membership (firstname, lastname, id, pass) VALUES (?, ?, ?, ?)";
			
			//query문 확인
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mDto.getFirstname());
			psmt.setString(2, mDto.getLastname());
			psmt.setString(3, mDto.getId());
			psmt.setString(4, mDto.getPass());
			
			System.out.println(mDto.getPass());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원 가입 중 에러발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//회원 로그인 (삭제하지마)
	// 회원정보(추후에 로그인 및 아이디 체크등 정보확인용으로 작업할겁니다)
	public MembershipDTO memberSelect(String id, String pw) {
		MembershipDTO dto = new MembershipDTO(); // 객체생성
		try {

			if (pw.equals("")) {
				// 아이디가 맞는지 확인용
				String sql = "SELECT * FROM membership WHERE id = ?";

				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {


					//저장
					dto.setIdx(rs.getString(1));
					dto.setFirstname(rs.getString(2));
					dto.setLastname(rs.getString(3));
					dto.setId(rs.getString(4));
					dto.setPass(rs.getString(5));
					dto.setRegidate(rs.getDate(6));

				}

			} else {
				// 아이디와 비번이 맞는지 확인용
				String sql = "SELECT * FROM membership WHERE id = ? and pass = ?";

				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {

					//저장
					dto.setIdx(rs.getString(1));
					dto.setFirstname(rs.getString(2));
					dto.setLastname(rs.getString(3));
					dto.setId(rs.getString(4));
					dto.setPass(rs.getString(5));
					dto.setRegidate(rs.getDate(6));

				}
			}

		} catch (Exception e) {
			System.out.println("로그인에러" + e.getMessage());
			e.getStackTrace();

		}

		return dto;
	}
	

	
	//회원 목록 출력
	public List<MembershipDTO> selectlist(Map<String, Object> map){
		
		List<MembershipDTO> board = new ArrayList<MembershipDTO>();
		
		String query = "SELECT * FROM membership ORDER BY idx DESC";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			//값이 있으면 dto에 모두 저장.
			while(rs.next()) {
				
				MembershipDTO dto = new MembershipDTO();
				
				//저장
				dto.setIdx(rs.getString(1));
				dto.setFirstname(rs.getString(2));
				dto.setLastname(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPass(rs.getString(5));
				dto.setRegidate(rs.getDate(6));

				
				//list 보드에 해당 값들 모두 넣기
				board.add(dto);
				
			}
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생함.");
			e.printStackTrace();
		}
		
		return board;
	}
	
	
	// Login
	public MembershipDTO memberLogin(String u_id, String u_pass) {
		
		MembershipDTO dto = new MembershipDTO();
		
		String query = "select * from membership where id = ? and pass = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			psmt.setString(2, u_pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setFirstname(rs.getString(2));
				dto.setLastname(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPass(rs.getString(5));
				dto.setRegidate(rs.getDate(6));
			}
			
		} catch (Exception e) {
			System.out.println("로그인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	
	//아이디 중복검사 (정우오빠꺼)
	public MembershipDTO idValidate(String u_id) {
		
		MembershipDTO  dto = new MembershipDTO();
		
		String query = "SELECT id FROM membership WHERE id =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			System.out.println("입력한 아이디값:"+u_id);
			
			
			if(rs.next()) {
				System.out.println("아이디 중복 확인 중 오류 발생");
				dto.setId(rs.getString("id"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//상서보기
	public MembershipDTO selectView (String idx) {
		
		//조회된 레코드를 DTO객체에 저장한 후 반환한다.
		MembershipDTO dto = new MembershipDTO();
		//인파라미터가 있는 쿼리문 작성
		String query = "SELECT * FROM membership WHERE idx=?";
		
		try {
			//쿼리실행을 위한 객체생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			//조회된 레코드가 있을때 DTO객체에 각 컬럼값을 저장한다.
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setFirstname(rs.getString(2));
				dto.setLastname(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPass(rs.getString(5));
				dto.setRegidate(rs.getDate(6));
			}
			
		}
		catch(Exception e) {
			System.out.println("회원정보 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		//저장된 값 반환.
		return dto;
	}
	
	//회원정보 삭제하기
	public int deletePost (String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM membership WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			
		}
		return result;
	}
	
	//회원정보 수정처리
	public int updatePost (MembershipDTO dto) {
		int result = 0;
		try {
			//update쿼리문 작성
			String query = "UPDATE membership SET firstname=?, lastname=?, id=?,  pass=? ";
			
			//동적쿼리문 실행을 위해 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getFirstname());
			psmt.setString(2, dto.getLastname());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPass());
			
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

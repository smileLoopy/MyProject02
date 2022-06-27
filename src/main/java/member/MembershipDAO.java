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
	
	
	// 회원정보(추후에 로그인 및 아이디 체크등 정보확인용으로 작업할겁니다)
	public MembershipDTO memberSelect(String id, String pass) {
		MembershipDTO dto = new MembershipDTO(); // 객체생성
		try {
			System.out.println("id:" + id);
			System.out.println("pw:" + pass);

			if (pass.equals("")) {
				
				// 아이디가 맞는지 확인용
				String sql = "SELECT * FROM membership where id = ?";

				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {

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
				psmt.setString(2, pass);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {

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
		
		String query = "SELECT * FROM membership";
		
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
	
	//아이디 중복검사
	public MembershipDTO idValidate(String id) {
		
		MembershipDTO  dto = new MembershipDTO();
		
		String query = "SELECT id FROM membership WHERE id =? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	


	
}

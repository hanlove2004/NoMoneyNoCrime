package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.MemberDTO;

public interface MemberDAO {
	int insertMember(MemberDTO memberdto); // 회원가입
	
	int insertRoleAndMember(String id , String role); // 회원 권한 insert
	
	int deleteMember(MemberDTO memberdto); // 탈퇴
	
	int admindeleteMember(int num); // 회원 강퇴
	
	int updateMember(MemberDTO memberdto);// 회원 정보 수정
	
	/*int loginMember(MemberDTO memberdto); // 로그인 */
	
	List<MemberDTO> getMemberList(HashMap map); // 회원리스트 조회
	
	MemberDTO getMemberDetail(String id); // 회원정보 보기 (디테일)
	
	MemberDTO searchIdByNameAndEmail(String name , String email); // 아이디 찾기
	
	MemberDTO searchPwdByIdAndEmail(String id , String email); // 비밀번호 찾기
	
	int getMemberCount(); // 회원 현황 (전체 회원수)
}

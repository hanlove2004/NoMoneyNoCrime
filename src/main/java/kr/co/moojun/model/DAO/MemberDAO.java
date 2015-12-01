package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.MemberDTO;

public interface MemberDAO {
	int insertMember(MemberDTO memberdto); // 회원가입
	
	int insertRoleAndMember(String id , String role); // 회원 권한 insert
	
	int deleteMember(MemberDTO memberdto); // 탈퇴
	
	int updateMember(MemberDTO memberdto);// 회원 정보 수정
	
	int loginMember(String id , String pwd); // 로그인
	
	List<MemberDTO> getMemberList(MemberDTO memberdto); // 회원리스트 조회
	
	MemberDTO getMemberDetail(String id); // 회원정보 보기 (디테일)
}

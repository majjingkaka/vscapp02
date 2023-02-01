package com.example.vscapp02.service;

import java.util.List;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

//import com.example.vscapp01.config.JwtTokenInfo;
import com.example.vscapp02.dto.Member;
//import com.example.vscapp01.entity.MemberEntity;

public interface MemberService extends UserDetailsService{
	
    //public List<MemberEntity> findAll() throws Exception;
    public List<Member> getFindAll() throws Exception;
    //public ResponseEntity<MemberEntity> getAllUsers() throws Exception;
    public ResponseEntity<Integer> createMember(Member memberDto) throws Exception;

    public Member findMemberInfoById(Long memberId);
    public Member findMemberInfoByEmail(String email);
    public Member registerNewMemberAccount(Member member) throws Exception;
    
    // public JwtTokenInfo login(String memberId, String password);
    
    // @Override
    // public UserDetails loadUserByUsername(String username);

    //public String createToken(MemberEntity MemberEntity);
}

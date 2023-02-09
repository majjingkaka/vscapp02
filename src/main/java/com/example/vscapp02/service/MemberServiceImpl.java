package com.example.vscapp02.service;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
//import java.util.Optional;
//import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import javax.management.relation.Role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//import com.example.vscapp01.Components.JwtTokenProvider;
//import com.example.vscapp01.Components.JwtTokenProvider;
//import com.example.vscapp01.config.JwtTokenInfo;
//import com.example.vscapp01.common.DefaultRes;
//import com.example.vscapp01.common.ResponseMessage;
//import com.example.vscapp01.common.StatusCode;
import com.example.vscapp02.dto.Member;
import com.example.vscapp02.dto.Role;
import com.example.vscapp02.dto.SpringUser;
//import com.example.vscapp01.entity.MemberEntity;
import com.example.vscapp02.mapper.MemberMapper;
//import com.example.vscapp01.repository.MemberRepository;

//import lombok.RequiredArgsConstructor;

@Service
//@RequiredArgsConstructor //https://computer-science-student.tistory.com/622
public class MemberServiceImpl implements MemberService{

    //@Autowired
	//private MemberRepository memberRepository;

    @Autowired
    private MemberMapper memberMapper;
    

    //private final JwtTokenProvider jwtTokenProvider;

    //private final PasswordEncoder passwordEncoder; //추가
    @Autowired 
    PasswordEncoder passwordEncoder; //추가
/*
	public List<MemberEntity> findAll() throws Exception{
        List<MemberEntity> members = new ArrayList<>();
        memberRepository.findAll().forEach(e -> members.add(e));
        
        return members;
    }
 */






    public List<Member> getFindAll() throws Exception{
        //List<MemberEntity> members = new ArrayList<>();
        return memberMapper.getFindAll();
    }












/*
	// 멤버 전체 조회
    public ResponseEntity<MemberEntity> getAllUsers() throws Exception{
        MemberEntity memberEntity = new MemberEntity();
        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        //final List<MemberEntity> userList = memberMapper.findAll();
        //if (userList.isEmpty())
            //return DefaultRes.res(StatusCode.NOT_FOUND, ResponseMessage.NOT_FOUND_USER);
        //return DefaultRes.res(StatusCode.OK, ResponseMessage.READ_USER, userList);
        //https://thalals.tistory.com/268
        
        return new ResponseEntity<>(memberEntity, header, HttpStatus.OK);
    }
 */




















    //private static final String ROLE_PREFIX = "ROLE_";
    /*
    @Override
    public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
        MemberDto memberDto = memberMapper.selectMember(memberId);
        
        if(memberDto == null) {
           throw new UsernameNotFoundException("사용자 정보가 존재하지 않습니다.");
        }

        //List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        //roles.add(new SimpleGrantedAuthority("ROLE_MEMBER"));

        //List<Role> userRoleList = memberRepository.selectMemberRole(member);

        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        //for (Role role: userRoleList) {
        //    roles.add(new SimpleGrantedAuthority(ROLE_PREFIX + role.getRoleName()));
        //}
        roles.add(new SimpleGrantedAuthority(ROLE_PREFIX + "MEMBER"));

        SpringUser springUser = new SpringUser(memberDto.getId(), memberDto.getPassword(), roles, memberDto);

        return springUser;
    }
	 */
	
	/*
    public Optional<MemberVo> findById(Long mbrNo) {
        Optional<MemberVo> member = memberRepository.findById(mbrNo);
        return member;
    }

    public void deleteById(Long mbrNo) {
        memberRepository.deleteById(mbrNo);
    }

    public MemberVo save(MemberVo member) {
        memberRepository.save(member);
        return member;
    }

    public void updateById(Long mbrNo, MemberVo member) {
        Optional<MemberVo> e = memberRepository.findById(mbrNo);

        if (e.isPresent()) {
            e.get().setMbrNo("1"); //member.getMbrNo()
            e.get().setId("2"); //member.getId()
            e.get().setName("3"); //member.getName()
            memberRepository.save(member);
        }
    }
    */
	
	//https://goddaehee.tistory.com/209

    @Transactional
    //@Override
    public ResponseEntity<Integer> createMember(Member memberDto) {
        //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        
        //MemberEntity memberEntity = MemberEntity.builder()
        //.id(memberDto.getId())
        //.name(memberDto.getName())
        //.password(passwordEncoder.encode(memberDto.getPassword()))
        //.build();
        
        //member.setLastAccessDt(LocalDateTime.now());
        //member.setRegDt(LocalDateTime.now());

        // 비밀번호 암호화
        //BCryptPasswordEncoder passwordEncoder2 = new BCryptPasswordEncoder();
        //member.setPassword(passwordEncoder2.encode(memberEntity.getPassword()));
        
        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        //memberRepository.save(memberEntity);
        memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
        // try{
        //     memberMapper.createMember(memberDto);
        // }catch(Exception e){
        //     e.printStackTrace();
        // }
        
        return new ResponseEntity<>(memberMapper.createMember(memberDto), header, HttpStatus.OK);
    }






    public Member findMemberInfoById(Long memberId) {
        //Optional<String> optional = Optional.empty();
        return memberMapper.findById(memberId);
    }

    public Member findMemberInfoByEmail(String email) {
        return memberMapper.findByEmail(email);
    }





    //private final MemberRepository memberRepository;
    // AuthenticationManagerBuilder authenticationManagerBuilder;
    // JwtTokenProvider jwtTokenProvider;
    
    // @Transactional
    // public JwtTokenInfo login(String memberId, String password) {
    //     // 1. Login ID/PW 를 기반으로 Authentication 객체 생성
    //     // 이때 authentication 는 인증 여부를 확인하는 authenticated 값이 false
    //     UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(memberId, password);
 
    //     // 2. 실제 검증 (사용자 비밀번호 체크)이 이루어지는 부분
    //     // authenticate 매서드가 실행될 때 CustomUserDetailsService 에서 만든 loadUserByUsername 메서드가 실행
    //     Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
 
    //     // 3. 인증 정보를 기반으로 JWT 토큰 생성
    //     JwtTokenInfo jwtTokenInfo = jwtTokenProvider.generateToken(authentication);
 
    //      return jwtTokenInfo;
    //  }

    
    private static final String ROLE_PREFIX = "ROLE_";
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberMapper.selectMember(username);
        if(member == null) {
            throw new UsernameNotFoundException("사용자 정보가 존재하지 않습니다.");
            //throw new IOException("this is io exception");
        }

        List<Role> userRoleList = memberMapper.selectMemberRole(member);

        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        for (Role role: userRoleList) {
           roles.add(new SimpleGrantedAuthority(ROLE_PREFIX + role.getRoleName()));
        }
        
        roles.add(new SimpleGrantedAuthority(ROLE_PREFIX + "MEMBER"));
        
        SpringUser springUser = new SpringUser(member.getMemberId(), member.getPassword(), roles, member);
        return springUser;
    }
    
    public void logout() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        HttpServletResponse response = requestAttributes.getResponse();

        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    }
    
    public Member registerNewMemberAccount(Member member) throws Exception {
        if(!StringUtils.isEmpty(memberMapper.selectMemberIdByMemberId(member.getMemberId()))) {
            throw new Exception("이미 존재하는 사용자 아이디입니다.");
        }

        //memberMapper.updateNomemberCpStatus(member.getCellphone(), false);

        member.setPassword(passwordEncoder.encode(member.getPassword()));
        memberMapper.insertMember(member);
        //memberMapper.insertMemberJoinType(member);

        return member;
    }

/*
    public String createToken(MemberEntity MemberEntity){
        
        return jwtTokenProvider.createToken(MemberEntity.getMemberId(), MemberEntity.getRoles(), 1800000);
    }
     */

    
    /* public void resetPassword(Member member) {
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        int result = memberRepository.updatePassword(member);
    }

    public void refreshUser(Member member){
        SpringUser springUser = (SpringUser) loadUserByUsername(member.getMemberId());
        UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(springUser.getUsername(), springUser.getPassword(), springUser.getAuthorities());
        newAuth.setDetails(springUser);
        SecurityContextHolder.getContext().setAuthentication(newAuth);
    }

    public boolean isExistMemberId(String memberId){
        return memberRepository.selectMemberIdByMemberId(memberId) != null ||
        withdrawalRepository.selectMemberIdByMemberId(memberId) != null;
    }

    public boolean validatePassword(String password) {
        Member member = Util.getMember();
        return passwordEncoder.matches(password, member.getPassword());
    } */

}

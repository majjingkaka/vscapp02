package com.example.vscapp02.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.vscapp02.dto.Member;
//import com.example.vscapp01.entity.MemberEntity;
import com.example.vscapp02.dto.Role;


@Mapper
@Repository
public interface MemberMapper {

    public Member selectMember(String memberId);
    public List<Role> selectMemberRole(Member member);
    public String selectMemberIdByMemberId(String memberId);

    public int insertMember(Member member);
    //public int insertMemberJoinType(Member member);





    //https://otrodevym.tistory.com/entry/spring-boot-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-31-Mybatis-%EC%84%A4%EC%A0%95-%EB%B0%8F-%EC%82%AC%EC%9A%A9-%EB%B0%A9%EB%B2%95
    //https://mollangpiu.tistory.com/317
    //@Select("SELECT * FROM fa_memberinfo")
    public List<Member> getFindAll();

    //@Select("SELECT * FROM user WHERE userIdx = #{userIdx}")
    //User findByUserIdx(@Param("userIdx") int userIdx);


    public Integer createMember(Member memberDto);



    public Member findById(Long memberId);
    public Member findByEmail(String memberId);

    

}
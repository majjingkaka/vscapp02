package com.example.vscapp02.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

//import com.example.vscapp01.entity.MemberEntity;

import java.util.Collection;

public class SpringUser extends User {

    private Member member;

    public SpringUser(String username, String password, Collection<? extends GrantedAuthority> authorities, Member member) {
        super(username, password, authorities);
        this.member = member;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}

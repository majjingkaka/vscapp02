package com.example.vscapp02.dto;

import java.io.Serializable;
//import java.util.ArrayList;
//import java.util.List;

//import javax.validation.constraints.*;

//import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Service
@SessionScope
@SuppressWarnings("serial")
public class Member implements Serializable{

    
    private int memberNo;

    //@NotBlank(message = "아이디는 필수 입력 값입니다.")
    private String memberId;

    //@NotBlank(message = "이름은 필수 입력 값입니다.")
    private String name;

    //@NotEmpty(message = "이메일은 필수 입력 값입니다.")
    //@Email(message = "이메일 형식으로 입력해주세요.")
    //@Pattern(regexp = "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$")//https://gmlwjd9405.github.io/2018/12/25/difference-dao-dto-entity.html
    private String email;

    //@JsonIgnore
    //@NotEmpty(message = "비밀번호는 필수 입력 값입니다.")
    //@Length(min = 8, max = 25, message = "비밀번호는 8자 이상, 25자 이하로 입력해주세요.")
    private String password;

    //@NotEmpty(message = "주소는 필수 입력 값입니다.")
    //private String address;


    //private List<String> roles = new ArrayList<>();
    //private List<String> roles;


    //https://wildeveloperetrain.tistory.com/101
    //https://gmlwjd9405.github.io/2018/12/25/difference-dao-dto-entity.html
    
//     @Builder
//     public MemberDto(String memberId, String name, String email, String password, String address) {
//         this.memberId = memberId;
//         this.name = name;
//         this.email = email;
//         this.password = password;
//         this.address = address;
//     }













}

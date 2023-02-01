package com.example.vscapp02.common;

import com.example.vscapp02.dto.Member;
import com.example.vscapp02.dto.SpringUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.text.StrSubstitutor;
//import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by seongho.ha on 2016-10-07.
 */
@Service
public class Util {
    public final static int SMS_LENGTH = 90;
    public static final String MSG_SEPARATOR = "__LINE__";

    public static Member getMember() {
        SpringUser springUser = (SpringUser) SecurityContextHolder.getContext().getAuthentication().getDetails();
        return springUser.getMember();
    }

    /**
     * 회원 권한이 있는지 조회한다.
     */
    public static boolean hasRole(String role) {
        if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())) {
            return false;
        } else {
            SpringUser springUser = (SpringUser) SecurityContextHolder.getContext().getAuthentication().getDetails();
            Collection<? extends GrantedAuthority> authorities = springUser.getAuthorities();
            for (Iterator iterator = authorities.iterator(); iterator.hasNext(); ) {
                GrantedAuthority type = (GrantedAuthority) iterator.next();
                if(role.equals(type.getAuthority())) {
                    return true;
                }
            }
            return false;
        }
    }

    public static boolean isNumber(String num) // String 형식으로 데이터를 받는다.
    {
        try
        {
            double d = Double.parseDouble(num); // Double 형태로 변환을 시도해본다.
        }
        catch(NumberFormatException nfe)
        {
            return false; // 변환에 오류가 발생하면 해당 데이터는 숫자가 아니다.
        }
        return true; // 변환에 성공하면 해당 데이터는 숫자.
    }

    //public static String getActiveProfile(){
    //    Environment environment = ApplicationContextUtils.getBean(Environment.class);
    //    return environment.getActiveProfiles()[0];
    //}

    public static boolean validateCellphone(String cellphone) {
        return cellphone != null && cellphone.matches("(01[016789])(\\d{3,4})\\d{4}$");
    }

    public static boolean isLogin() {
        return !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)
                && SecurityContextHolder.getContext().getAuthentication() != null
                && SecurityContextHolder.getContext().getAuthentication().isAuthenticated();

    }

    public static String replaceTemplateStr(String source, Map<String, String> valueMap) {
        StrSubstitutor strSubstitutor = new StrSubstitutor(valueMap, "#{", "}");
        return strSubstitutor.replace(source);
    }


    /**
     * 메시지가 sms인지 lms인지 판단한다.
     * 영문, 숫자의 경우 1byte, 나머지는 2byte로 계산한다.
     * @param message
     * @return
     */
    public static boolean isLongMessage(String message) {
        int mLen = message.length();
        int mSize = 0;
        for (int i = 0; i < mLen; i++) {
            char c = message.charAt(i);
            if ((c >= 0x61 && c <= 0x7A) || (c >= 0x41 && c <= 0x5A) || c >= 0x30 && c <= 0x39) {
                mSize += 1;

            } else {
                mSize += 2;
            }

            if (mSize > SMS_LENGTH) {
                return true;
            }
        }
        return false;
    }

    /*숫자 한글 처리*/
    public static String moneyToHangl(String money) {

        StringBuffer l_result = new StringBuffer();
        String[] l_kr1 = { "", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구" };
        String[] l_kr2 = { "", "십", "백", "천" };
        String[] l_kr3 = { "", "만", "억", "조" };

        int l_count = 0; // 0 갯수카운트변수
        int l_len = money.length(); // 숫자 길이
        int l_target; // 해당숫자

        for (int i = 0; i < l_len; i++) {
            // i번째 숫자 캐싱
            l_target = Integer.parseInt(money.charAt(i) + "");
            l_result.append(l_kr1[l_target]);
            if (l_target > 0) {
                l_result.append(l_kr2[(l_len - 1 - i) % 4]); // 십 백 천
            } else {
                l_count++; // 0인경우 카운트 증가
            }
            if ((l_len - 1 - i) % 4 == 0) { // 자리가 4의배수인경우
                // 0이 아닌게 한번이라도 있는경우 만억조 출력
                if (l_count != 4) {
                    // 만 억 조
                    l_result.append(l_kr3[(l_len - 1 - i) / 4]);
                }
                l_count = 0; // 초기화
            }
        }
        return l_result.toString();
    }

    //중복방지 값으로 사용 05181648(날짜)+000006(memberNo)
    public static String getLimitNonce() {
        String memberPad = StringUtils.leftPad(String.valueOf(Util.getMember().getMemberNo()), 6, "0");
        String limitNonce = new SimpleDateFormat("MMddHHmm").format(new Date()) + memberPad;
        return limitNonce;
    }

}

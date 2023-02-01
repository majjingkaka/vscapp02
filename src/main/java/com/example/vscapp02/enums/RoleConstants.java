package com.example.vscapp02.enums;

/**
 * Created by seongho.ha on 2017-05-08.
 */
public enum RoleConstants {
    ROLE_MEMBER(1, "ROLE_MEMBER"), ROLE_STAFF(2, "ROLE_STAFF"), ROLE_INCOME_ELIGIBLE(3, "ROLE_INCOME_ELIGIBLE");

    private int roleNo;

    private String roleName;

    RoleConstants(int roleNo, String roleName) {
        this.roleNo = roleNo;
        this.roleName = roleName;
    }

    public int getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(int roleNo) {
        this.roleNo = roleNo;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}

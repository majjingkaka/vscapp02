package com.example.vscapp02.common;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EncryptTypeHandler implements TypeHandler<String> {

    private static final String SECRET_KEY = "6b49fff91635dde6";

    private AES256Util aes256Util;

    private static Logger logger = LoggerFactory.getLogger(EncryptTypeHandler.class);

    public EncryptTypeHandler() throws UnsupportedEncodingException {
        this.aes256Util = new AES256Util(SECRET_KEY);
    }

    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, String s, JdbcType jdbcType) throws SQLException {
        try {
            if(StringUtils.isEmpty(s)) {
                preparedStatement.setString(i, s);
            } else {
                preparedStatement.setString(i, aes256Util.encrypt(s));
            }

        } catch (Exception e) {
            throw new SQLException(e);
        }
    }

    @Override
    public String getResult(ResultSet resultSet, String s) throws SQLException {
        try {
            String val = resultSet.getString(s);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }

    }

    @Override
    public String getResult(ResultSet resultSet, int i) throws SQLException {
        try {
            String val = resultSet.getString(i);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }

    @Override
    public String getResult(CallableStatement callableStatement, int i) throws SQLException {
        try {
            String val = callableStatement.getString(i);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
}

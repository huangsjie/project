package com.panda.util;


import com.panda.model.system.Users;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordHelper {

    private String algorithmName = "md5";

    private int hashIterations = 2;

    public void encryptPassword(Users user) {
        String newPassword = new SimpleHash(algorithmName, user.getPassword(), ByteSource.Util.bytes(user.getAccount() + user.getId()), hashIterations).toHex();
        user.setPassword(newPassword);
    }

    /**
     * 测试密码
     * @param args
     */
    public static void main(String[] args) {
        PasswordHelper passwordHelper = new PasswordHelper();
        Users user = new Users();
        user.setId("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
        user.setAccount("morgan");
        user.setPassword("123456");
        passwordHelper.encryptPassword(user);
        System.out.println(user.getPassword());
    }
}

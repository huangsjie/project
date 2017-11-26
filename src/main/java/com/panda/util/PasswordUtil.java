package com.panda.util;


import com.panda.model.system.Users;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/14
 * Time: 17:28
 */
public class PasswordUtil {

    private static String algorithmName = "md5";

    private static int hashIterations = 2;

    public static void encryptPassword(Users user) {
        String newPassword = new SimpleHash(algorithmName, user.getPassword(), ByteSource.Util.bytes(user.getAccount() + user.getId()), hashIterations).toHex();
        user.setPassword(newPassword);
    }

    /**
     * 测试密码
     * @param args
     */
    public static void main(String[] args) {
        PasswordUtil passwordHelper = new PasswordUtil();
        Users user = new Users();
        user.setId("0f1443aa-eade-410d-b8bf-74ebfa914ca4");
        user.setAccount("morgan");
        user.setPassword("123456");
        passwordHelper.encryptPassword(user);
        System.out.println(user.getPassword());
    }
}

package com.panda.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * Created with IDEA.
 * User: Alan
 * Date: 2017/11/2
 * Time: 15:11
 */
public class SerializeUtil {
    public static byte[] serialize(Object object) {
        ObjectOutputStream oos = null;
        ByteArrayOutputStream baos = null;
        try {
            //序列化
            baos = new ByteArrayOutputStream();
            oos = new ObjectOutputStream(baos);
            oos.writeObject(object);
            byte[] bytes = baos.toByteArray();
            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        }
        return null;
    }

    public static Object unserialize(byte[] bytes) {
        ByteArrayInputStream bais = null;
        try {
            //反序列化
            bais = new ByteArrayInputStream(bytes);
            ObjectInputStream ois = new ObjectInputStream(bais);
            return ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        }
        return null;
    }
}
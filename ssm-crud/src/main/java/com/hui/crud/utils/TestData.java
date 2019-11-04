package com.hui.crud.utils;

import org.junit.Test;

import java.util.Random;
import java.util.UUID;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/19
 */
public class TestData {

    @Test
    public void test() {
        for (int i = 0; i < 5; i++) {
            int number = TestData.getNumber();
            System.out.println(number);
            // String sex = TestData.getSex();
            //System.out.println(sex);
        }

    }

    /**
     * 随机获取性别的方法
     *
     * @return 性别 男或女
     */
    public static String getSex() {
        Random random = new Random();
        /*表示不是1就是2*/
        int i = random.nextInt(2) + 1;
        if (i == 1) {
            return "男";
        } else return "女";
    }

    /**
     * 随机生成名称 16进制
     *
     * @return 随机名称
     */
    public static String getName() {
        UUID uuid = UUID.randomUUID();
        String substring = uuid.toString().substring(0, 6);
        return substring;
    }

    /**
     * 生成年龄0到18岁
     *
     * @return
     */
    public static int getAge() {
        Random random = new Random();
        int i = random.nextInt(18);
        return i;
    }

    /**
     * 生成随机数0到5
     *
     * @return
     */
    public static int getNumber() {
        Random random = new Random();
        int i = random.nextInt(5) + 1;
        return i;
        /*int num = (int) (Math.random() * 5 + 1);
        return num;*/

    }


}

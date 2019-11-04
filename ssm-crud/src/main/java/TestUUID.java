import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/11
 */
public class TestUUID {

    public static void main(String[] args) {
        TestUUID t = new TestUUID();
        for (int i = 0; i < 10; i++) {

            System.out.println(t.getIntData());
        }

        for (int i = 0; i < 10; i++) {
            System.out.println(t.getSex());
        }


    }

    public static String getGuid() {
        StringBuffer now = new StringBuffer(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
        int n = (int) (Math.random() * 90000.0D + 10000.0D);
        return now.append(n).toString();
    }

    public static String getZcbhid() {
        StringBuffer now = new StringBuffer(new SimpleDateFormat("yyyyMMdd").format(new Date()));
        int n = (int) (Math.random() * 9000.0D + 1000.0D);
        return now.append(n).toString();

    }

    public static int getIntData() {
        int n = (int) (Math.random() * 9000.0D + 1000.0D);

        return n;
    }

    /*随机生成性别用于数据测试*/
    public static String getSex() {
        Random random = new Random();
        int i = random.nextInt(2);
        if (i == 1) {
            return "男";
        } else return "女";

    }

    /*
     * 生成随机名字,用于数据测试
     * */
    public static String getNmaeString() {
        UUID uuid = UUID.randomUUID();
        String substring = uuid.toString().substring(0, 5);
        return substring;
    }


}

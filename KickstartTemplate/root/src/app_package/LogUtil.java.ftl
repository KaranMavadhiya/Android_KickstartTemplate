package ${packageName}.utils;

public class LogUtil {

    private static String tagName = "LogUtil";

    /*
     * @param Tag
     * @param message
     */
    public static void w(String Tag, String message) {
        android.util.Log.w(tagName, Tag + " : " + message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void d(String Tag, String message) {
        android.util.Log.d(tagName, Tag + " : " + message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void e(String Tag, String message) {
        android.util.Log.e(tagName, Tag + " : " + message);
    }

    /*
     * @param Tag
     * @param message
     * @param e
     */
    public static void e(String Tag, String message, Throwable e) {
        android.util.Log.e(tagName, Tag + " : " + message, e);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void i(String Tag, String message) {
        android.util.Log.i(tagName, Tag + " : " + message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void v(String Tag, String message) {
        android.util.Log.v(tagName, Tag + " : " + message);
    }
}
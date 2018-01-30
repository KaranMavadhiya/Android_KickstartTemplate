package ${packageName}.utils;

import ${applicationPackage}.BuildConfig;

public class LogUtil {

    private static final String LOG_PREFIX = "LOG_";

    private static final String DEBUG_BUILD_TYPE = "debug";
    private static boolean LOG_ENABLED = false;

    static {
        if (BuildConfig.BUILD_TYPE.equals(DEBUG_BUILD_TYPE)) {
            LOG_ENABLED = true;
        }
    }


    /*
     * @param Tag
     * @param message
     */
    public static void w(String Tag, String message) {
        if (LOG_ENABLED)
            android.util.Log.w(LOG_PREFIX + Tag, message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void d(String Tag, String message) {
        if (LOG_ENABLED)
            android.util.Log.d(LOG_PREFIX + Tag, message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void e(String Tag, String message) {
        if (LOG_ENABLED)
            android.util.Log.e(LOG_PREFIX + Tag, message);
    }

    /*
     * @param Tag
     * @param message
     * @param e
     */
    public static void e(String Tag, String message, Throwable e) {
        if (LOG_ENABLED)
            android.util.Log.e(LOG_PREFIX + Tag, message, e);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void i(String Tag, String message) {
        if (LOG_ENABLED)
            android.util.Log.i(LOG_PREFIX + Tag, message);
    }

    /*
     * @param Tag
     * @param message
     */
    public static void v(String Tag, String message) {
        if (LOG_ENABLED)
            android.util.Log.v(LOG_PREFIX + Tag, message);
    }
}
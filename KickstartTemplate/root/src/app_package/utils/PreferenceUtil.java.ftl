package ${packageName}.utils;

import android.app.Activity;
import android.content.Context;

public class PreferenceUtil {

    // SharedPreference
    private android.content.SharedPreferences SharedPreferences;
    private android.content.SharedPreferences.Editor SharedPreferencesEditor;

    public PreferenceUtil(Context context, String preferenceName) {
        // Create SharedPreferences
        SharedPreferences = context.getSharedPreferences(preferenceName, Activity.MODE_PRIVATE);
        SharedPreferencesEditor = SharedPreferences.edit();
    }

    /*
     * @param key      Key of the preference
     * @param value    Value of the key
     */
    public  void putInt(String key, int value) {
        SharedPreferencesEditor.putInt(key, value).commit();
    }

    /*
     * @param key      Key of the preference
     * @param value    Value of the key
     */
    public  void putString(String key, String value) {
        SharedPreferencesEditor.putString(key, value).commit();
    }

    /*
     * @param key      Key of the preference
     * @param value    Value of the key
     */
    public  void putBoolean(String key, boolean value) {
        SharedPreferencesEditor.putBoolean(key, value).commit();
    }

    /*
     * @param key            Key of the preference
     * @param defaultVaule   Default value if key is not available
     * @return               Value of key
     */
    public  int getInt(String key, int defaultVaule) {
        return SharedPreferences.getInt(key, defaultVaule);
    }

    /*
     * @param key            Key of the preference
     * @param defaultVaule   Default value if key is not available
     * @return               Value of key
     */
    public  String getString(String key, String defaultVaule) {
        return SharedPreferences.getString(key, defaultVaule);
    }

    /*
     * @param key            Key of the preference
     * @param defaultVaule   Default value if key is not available
     * @return               Value of key
     */
    public  boolean getBoolean(String key, boolean defaultVaule) {
        return SharedPreferences.getBoolean(key, defaultVaule);
    }

    /*
     *
     */
    public void clear(){
        SharedPreferencesEditor.clear().commit();
    }
}

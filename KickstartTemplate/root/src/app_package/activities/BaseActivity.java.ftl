package ${packageName}.activities;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.dialogs.CustomProgressDialog;
import ${packageName}.utils.PreferenceUtil;
 
public abstract class ${className} extends AppCompatActivity implements View.OnClickListener {

    public static final String TAG = BaseActivity.class.getSimpleName();

    /*
     * MAX_CLICK_INTERVAL contains Max time interval to prevent double click
     * lastClickedTime contains last clicked time of view
     */
    public static final long MAX_CLICK_INTERVAL = 1000;
    protected long lastClickedTime = 0;

    /*
     * ProgressDialog
     */
    private CustomProgressDialog progressDialog;

    /*
     * SharedPreferences
     */
    public PreferenceUtil mPreferenceUtil;

    /*
     * abstract method for set view
     * @return
     */
    public abstract int getActivityView();

    /*
     * abstract method to initialize components
     */
    public abstract void initializeComponents();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(getActivityView());

	// Initialize preference utility
        mPreferenceUtil = new PreferenceUtil(getApplicationContext(),getString(R.string.app_name));

        initializeComponents();
    }

    @Override
    public void onClick(View view) {

        /*
         * Logic for hide keyboard on click
         */
        InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
        }

        /*
         * Logic to Prevent the Launch Twice if User makes
         * the Tap(Click) very Fast.
         */
        if (SystemClock.elapsedRealtime() - lastClickedTime < MAX_CLICK_INTERVAL) {
            return;
        }
        lastClickedTime = SystemClock.elapsedRealtime();


    }

     /**
     * @param className Name of the next Activity (NextActivity.class)
     */
    public void startActivity(Class<?> className){
        startActivity(new Intent(getApplicationContext(), className));
    }

    /**
     * @param className Name of the next Activity (NextActivity.class)
     * @param resultCode Activity result code
     */
    public void startActivity(Class<?> className, int resultCode){
        startActivityForResult(new Intent(getApplicationContext(), className),resultCode);
    }

    /**
     * @param intent  Activity Intent
     * @param resultCode Activity result code
     */
    public void startActivityForResultBack(Intent intent, int resultCode) {
        setResult(resultCode, intent);
    }

    /**
     * @param className Name of the next Activity (NextActivity.class)
     * @param enterAnim enter animation
     * @param exitAnim exit animation
     */
    public void startActivity(Class<?> className, int enterAnim, int exitAnim){
        startActivity(new Intent(getApplicationContext(), className));
        overridePendingTransition(enterAnim, exitAnim);
    }

    /**
     * @param className Name of the next Activity (NextActivity.class)
     * @param resultCode Activity result code
     * @param enterAnim enter animation
     * @param exitAnim exit animation
     */
    public void startActivity(Class<?> className, int resultCode, int enterAnim, int exitAnim){
        startActivityForResult(new Intent(getApplicationContext(), className),resultCode);
        overridePendingTransition(enterAnim, exitAnim);
    }

    /**
     * @param intent Activity Intent
     * @param resultCode Activity result code
     * @param enterAnim enter animation
     * @param exitAnim exit animation
     */
    public void startActivityForResultBack(Intent intent, int resultCode, int enterAnim, int exitAnim) {
        setResult(resultCode, intent);
        overridePendingTransition(enterAnim, exitAnim);
    }

    /*
     * Adds the Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, Fragment currentFragment, Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {
            if (currentFragment == null || nextFragment == null) {
                return false;
            }
            FragmentManager fragmentManager = getFragmentManager();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();

            if (requiredAnimation) {
                fragmentTransaction.setTransition(FragmentTransaction.TRANSIT_NONE);
            }

            fragmentTransaction.add(fragmentContainerResourceId, nextFragment, nextFragment.getClass().getSimpleName());
            fragmentTransaction.addToBackStack(nextFragment.getClass().getSimpleName());

            Fragment parentFragment;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR1) {
                parentFragment = currentFragment.getParentFragment();
                if (parentFragment == null) {
                    fragmentTransaction.hide(currentFragment);
                } else {
                    fragmentTransaction.hide(parentFragment);
                }
            }

            if (!commitAllowingStateLoss) {
                fragmentTransaction.commit();
            } else {
                fragmentTransaction.commitAllowingStateLoss();
            }
            return true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        return false;
    }


    /*
     * Replaces the Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, FragmentManager fragmentManager, Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {
            if (nextFragment == null || fragmentManager == null) {
                return false;
            }
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            if (requiredAnimation) {
                fragmentTransaction.setTransition(FragmentTransaction.TRANSIT_NONE);
            }
            fragmentTransaction.replace(fragmentContainerResourceId, nextFragment, nextFragment.getClass().getSimpleName());

            if (!commitAllowingStateLoss) {
                fragmentTransaction.commit();
            } else {
                fragmentTransaction.commitAllowingStateLoss();
            }
            return true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * @param message ProgressDialog message 
     * @param isCancelable true if user need to cancel dialog on touch else false 
     */
    private void displayDialog(String message, boolean isCancelable) {
        progressDialog = new CustomProgressDialog(this, message, isCancelable);
        if (!isFinishing()) {
            progressDialog.show();
        }
    }

    /**
     * 
     */
    private void dismissDialog() {
        if (progressDialog != null && progressDialog.isShowing())
            progressDialog.dismiss();
    }

    @Override
    public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0) {
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (progressDialog != null && progressDialog.isShowing())
            dismissDialog();
    }
}
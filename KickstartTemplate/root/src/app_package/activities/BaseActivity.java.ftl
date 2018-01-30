package ${packageName}.activities;

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

    /**
     * MAX_CLICK_INTERVAL contains Max time interval to prevent double click
     */
    public static final long MAX_CLICK_INTERVAL = 1000;
    
    /**
     * lastClickedTime contains last clicked time of view to prevent double click
     */
    protected long lastClickedTime = 0;

    /**
     * SharedPreferences
     */
    public PreferenceUtil mPreferenceUtil;
    
    /**
     * ProgressDialog
     */
    private CustomProgressDialog progressDialog;

    /**
     * abstract method for set view
     * @return int (R.layout.XXX)
     */
    public abstract int getActivityView();

    /**
     * abstract method to initialize components
     */
    public abstract void initializeComponents();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(getActivityView());

        // Initialize preference utility
        mPreferenceUtil = new PreferenceUtil(getApplicationContext(), getString(R.string.app_name));

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
    public void startActivity(Class<?> className) {
        startActivity(new Intent(getApplicationContext(), className));
    }

    /**
     * @param className  Name of the next Activity (NextActivity.class)
     * @param resultCode Activity result code
     */
    public void startActivity(Class<?> className, int resultCode) {
        startActivityForResult(new Intent(getApplicationContext(), className), resultCode);
    }

    /**
     * @param intent     Activity Intent
     * @param resultCode Activity result code
     */
    public void startActivityForResultBack(Intent intent, int resultCode) {
        setResult(resultCode, intent);
    }

    /**
     * @param className Name of the next Activity (NextActivity.class)
     * @param enterAnim enter animation
     * @param exitAnim  exit animation
     */
    public void startActivity(Class<?> className, int enterAnim, int exitAnim) {
        startActivity(new Intent(getApplicationContext(), className));
        overridePendingTransition(enterAnim, exitAnim);
    }

    /**
     * @param className  Name of the next Activity (NextActivity.class)
     * @param resultCode Activity result code
     * @param enterAnim  enter animation
     * @param exitAnim   exit animation
     */
    public void startActivity(Class<?> className, int resultCode, int enterAnim, int exitAnim) {
        startActivityForResult(new Intent(getApplicationContext(), className), resultCode);
        overridePendingTransition(enterAnim, exitAnim);
    }

    /**
     * @param intent     Activity Intent
     * @param resultCode Activity result code
     * @param enterAnim  enter animation
     * @param exitAnim   exit animation
     */
    public void startActivityForResultBack(Intent intent, int resultCode, int enterAnim, int exitAnim) {
        setResult(resultCode, intent);
        overridePendingTransition(enterAnim, exitAnim);
    }

    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.app.Fragment currentFragment, android.app.Fragment nextFragment) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, false, false, false);
    }

    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.app.Fragment currentFragment, android.app.Fragment nextFragment, boolean addToBackStack) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, addToBackStack, false, false);
    }

    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @param requiredAnimation           true if screen transition animation is required
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.app.Fragment currentFragment, android.app.Fragment nextFragment, boolean addToBackStack, boolean requiredAnimation) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, addToBackStack, requiredAnimation, false);
    }


    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true                       if new Fragment added successfully into container, false otherwise
     */

    public boolean addFragment(int fragmentContainerResourceId, android.app.Fragment currentFragment, android.app.Fragment nextFragment, boolean addToBackStack, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {
            if (currentFragment == null || nextFragment == null) {
                return false;
            }

            android.app.FragmentTransaction fragmentTransaction = getFragmentManager().beginTransaction();
            if (requiredAnimation)
                fragmentTransaction.setTransition(android.app.FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            else
                fragmentTransaction.setTransition(android.app.FragmentTransaction.TRANSIT_NONE);

            fragmentTransaction.add(fragmentContainerResourceId, nextFragment, nextFragment.getClass().getSimpleName());
            if (addToBackStack)
                fragmentTransaction.addToBackStack(nextFragment.getClass().getSimpleName());

            android.app.Fragment parentFragment;
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

    /**
     * Adds the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.support.v4.app.Fragment currentFragment, android.support.v4.app.Fragment nextFragment) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, false, false, false);
    }

    /**
     * Adds the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.support.v4.app.Fragment currentFragment, android.support.v4.app.Fragment nextFragment, boolean addToBackStack) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, addToBackStack, false, false);
    }

    /**
     * Adds the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @param requiredAnimation           true if screen transition animation is required
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.support.v4.app.Fragment currentFragment, android.support.v4.app.Fragment nextFragment, boolean addToBackStack, boolean requiredAnimation) {
        return addFragment(fragmentContainerResourceId, currentFragment, nextFragment, addToBackStack, requiredAnimation, false);
    }

    /**
     * Adds the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param addToBackStack              true if want to manage fragment BackStack
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true/false                       true if new Fragment added successfully into container, false otherwise
     */
    public boolean addFragment(int fragmentContainerResourceId, android.support.v4.app.Fragment currentFragment, android.support.v4.app.Fragment nextFragment, boolean addToBackStack, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {

            if (currentFragment == null || nextFragment == null) {
                return false;
            }

            android.support.v4.app.FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
            if (requiredAnimation)
                fragmentTransaction.setTransition(android.support.v4.app.FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            else
                fragmentTransaction.setTransition(android.support.v4.app.FragmentTransaction.TRANSIT_NONE);

            fragmentTransaction.add(fragmentContainerResourceId, nextFragment, nextFragment.getClass().getSimpleName());
            if (addToBackStack)
                fragmentTransaction.addToBackStack(nextFragment.getClass().getSimpleName());

            android.support.v4.app.Fragment parentFragment;
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

    /**
     * Replaces the Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.app.FragmentManager fragmentManager, android.app.Fragment nextFragment) {
        return replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, false, false);
    }

    /**
     * Replaces the Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.app.FragmentManager fragmentManager, android.app.Fragment nextFragment, boolean requiredAnimation) {
        return replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, requiredAnimation, false);
    }

    /**
     * Replaces the Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.app.FragmentManager fragmentManager, android.app.Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {
            if (nextFragment == null || fragmentManager == null) {
                return false;
            }

            android.app.FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            if (requiredAnimation)
                fragmentTransaction.setTransition(android.app.FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            else
                fragmentTransaction.setTransition(android.app.FragmentTransaction.TRANSIT_NONE);

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
     * Replaces the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.support.v4.app.FragmentManager fragmentManager, android.support.v4.app.Fragment nextFragment) {
        return replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, false, false);
    }

    /**
     * Replaces the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.support.v4.app.FragmentManager fragmentManager, android.support.v4.app.Fragment nextFragment, boolean requiredAnimation) {
        return replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, requiredAnimation, false);
    }

    /**
     * Replaces the android.support.v4.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             fragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into fragmentContainerResourceId
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if commitAllowingStateLoss is needed
     * @return true                       if new Fragment added successfully into container, false otherwise
     */
    public boolean replaceFragment(int fragmentContainerResourceId, android.support.v4.app.FragmentManager fragmentManager, android.support.v4.app.Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) {
        try {
            if (nextFragment == null || fragmentManager == null) {
                return false;
            }

            android.support.v4.app.FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            if (requiredAnimation)
                fragmentTransaction.setTransition(android.support.v4.app.FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            else
                fragmentTransaction.setTransition(android.support.v4.app.FragmentTransaction.TRANSIT_NONE);

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
     * @param message      ProgressDialog message
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
        super.onBackPressed();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (progressDialog != null && progressDialog.isShowing())
            dismissDialog();
    }
}
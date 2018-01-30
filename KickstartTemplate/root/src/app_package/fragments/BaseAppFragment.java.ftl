package ${packageName}.fragments;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.activities.BaseActivity;
import ${packageName}.dialogs.CustomProgressDialog;
import ${packageName}.utils.PreferenceUtil;
 
/**
 * Base class for all the fragments used, manages common feature needed in the most of the fragments
 */
public abstract class ${secondName} extends Fragment implements View.OnClickListener {

   /**
     * MAX_CLICK_INTERVAL contains Max time interval to prevent double click
     */
    public static final long MAX_CLICK_INTERVAL = 1000;

    /**
     * lastClickedTime contains last clicked time of view to prevent double click
     */
    protected long lastClickedTime = 0;

    /**
     * ProgressDialog
     */
    protected CustomProgressDialog progressDialog;

    /**
     * SharedPreferences
     */
    private PreferenceUtil mPreferenceUtil;

    /**
     * abstract method for set view
     * @return int (R.layout.XXX)
     */
    public abstract int getFragmentView();

    /**
     * Initialize the components for Fragment's view
     * @param view A View inflated into Fragment
     */
    protected abstract void initializeComponent(View view);

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(getFragmentView(), container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        // Initialize preference utility
        mPreferenceUtil = new PreferenceUtil(getActivity(), getString(R.string.app_name));

        initializeComponent(view);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }


    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into container
     * @return true                       if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean addFragment(int fragmentContainerResourceId, Fragment currentFragment, Fragment nextFragment) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).addFragment(fragmentContainerResourceId, currentFragment, nextFragment, false, false);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }

    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into container
     * @param requiredAnimation           true if screen transition animation is required
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean addFragment(int fragmentContainerResourceId, Fragment currentFragment, Fragment nextFragment, boolean requiredAnimation) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).addFragment(fragmentContainerResourceId, currentFragment, nextFragment, requiredAnimation, false);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }


    /**
     * Adds the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param currentFragment             Current loaded Fragment to be hide
     * @param nextFragment                New Fragment to be loaded into container
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if allow commit after activity's saved instance call
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean addFragment(int fragmentContainerResourceId, Fragment currentFragment, Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).addFragment(fragmentContainerResourceId, currentFragment, nextFragment, requiredAnimation, commitAllowingStateLoss);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }


    /**
     * Replaces the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             FragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into container
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean replaceFragment(int fragmentContainerResourceId, FragmentManager fragmentManager, Fragment nextFragment) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, false, false);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }

    /**
     * Replaces the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             FragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into container
     * @param requiredAnimation           true if screen transition animation is required
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean replaceFragment(int fragmentContainerResourceId, FragmentManager fragmentManager, Fragment nextFragment, boolean requiredAnimation) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, requiredAnimation, false);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }


    /**
     * Replaces the android.app.Fragment into layout container
     *
     * @param fragmentContainerResourceId Resource id of the layout in which Fragment will be added
     * @param fragmentManager             FragmentManager of current activity
     * @param nextFragment                New Fragment to be loaded into container
     * @param requiredAnimation           true if screen transition animation is required
     * @param commitAllowingStateLoss     true if allow commit after activity's saved instance call
     * @return true/false                 true if new Fragment added successfully into container, false otherwise
     * @throws ClassCastException    Throws exception if getActivity() is not an instance of BaseActivity
     * @throws IllegalStateException Exception if Fragment transaction is invalid
     */
    protected boolean replaceFragment(int fragmentContainerResourceId, FragmentManager fragmentManager, Fragment nextFragment, boolean requiredAnimation, boolean commitAllowingStateLoss) throws ClassCastException, IllegalStateException {
        if (getActivity() != null) {
            if (getActivity() instanceof BaseActivity) {
                return ((BaseActivity) getActivity()).replaceFragment(fragmentContainerResourceId, fragmentManager, nextFragment, requiredAnimation, commitAllowingStateLoss);
            } else {
                throw new ClassCastException(BaseActivity.class.getName() + " can not be cast into " + getActivity().getClass().getName());
            }
        }
        return false;
    }


    @Override
    public void onClick(View view) {

        /*
         * Logic for hide keyboard on click
         */
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
        }

        /*
         * Logic to Prevent the Launch of the Fragment Twice if User makes
         * the Tap(Click) very Fast.
         */
        if (SystemClock.elapsedRealtime() - lastClickedTime < MAX_CLICK_INTERVAL) {

            return;
        }
        lastClickedTime = SystemClock.elapsedRealtime();

    }

    public void dismissDialog() {
        if (progressDialog != null && progressDialog.isShowing())
            progressDialog.dismiss();
    }

    public void displayDialog(String message, boolean isCancelable) {
        progressDialog = new CustomProgressDialog(getActivity(), message, isCancelable);
        if (!getActivity().isFinishing()) {
            progressDialog.show();
        }
    }

    @Override
    public void onHiddenChanged(boolean hidden) {
        super.onHiddenChanged(hidden);
    }
}
package ${packageName}.dialogs;

import android.app.ProgressDialog;
import android.content.Context;

/**
 * Custom progress dialog used while disable the user interaction to the app.
 */
public class CustomProgressDialog extends ProgressDialog {

    public CustomProgressDialog(Context context, String message, boolean isCancelable) {
        super(context);
        this.setMessage(message);
        this.setCancelable(isCancelable);
        this.setCanceledOnTouchOutside(false);
    }
}

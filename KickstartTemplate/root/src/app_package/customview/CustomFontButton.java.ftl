package ${packageName}.customview;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.support.v7.widget.AppCompatButton;
import android.util.AttributeSet;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.utils.Constants;


/**
 * CustomFontButton class to support custom fonts in Button
 */
public class CustomFontButton extends AppCompatButton {

    private Context context;

    public CustomFontButton(Context context) {
        super(context);
    }

    public CustomFontButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.context = context;
        init(attrs);
    }

    public CustomFontButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.context = context;
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        if (attrs != null) {
            final TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CustomFontTextView);
            final String fontName = a.getString(R.styleable.CustomFontTextView_fontText);
            try {
                if (fontName != null) {
                    Typeface myTypeface = Typeface.createFromAsset(context.getAssets(), Constants.ASSETS_FOLDER_FONTS + fontName);
                    setTypeface(myTypeface);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            a.recycle();
        }
    }
}
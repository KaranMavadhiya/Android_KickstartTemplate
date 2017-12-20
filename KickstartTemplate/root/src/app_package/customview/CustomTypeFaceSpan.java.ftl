package ${packageName}.customview;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.TypefaceSpan;


/**
 * CustomTypeFaceSpan class to support custom fonts in SpannableString
 */
public class CustomTypeFaceSpan extends TypefaceSpan {
    private final Typeface newType;

    public CustomTypeFaceSpan(String family, Typeface type) {
        super(family);
        newType = type;
    }

    private static void applyCustomTypeFace(Paint paint, Typeface tf) {
        int oldStyle;
        Typeface old = paint.getTypeface();
        if (old == null) {
            oldStyle = 0;
        } else {
            oldStyle = old.getStyle();
        }

        int fake = oldStyle & ~tf.getStyle();
        if ((fake & Typeface.BOLD) != 0) {
            //paint.setFakeBoldText(true);
        }

        if ((fake & Typeface.ITALIC) != 0) {
            //paint.setTextSkewX(-0.25f);
        }

        //paint.setFakeBoldText(true);
        paint.setTypeface(tf);
    }

    @Override
    public void updateDrawState(TextPaint ds) {
        applyCustomTypeFace(ds, newType);
    }

    @Override
    public void updateMeasureState(TextPaint paint) {
        applyCustomTypeFace(paint, newType);
    }
}
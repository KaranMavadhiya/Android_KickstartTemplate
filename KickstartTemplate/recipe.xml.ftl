<?xml version="1.0"?>
<recipe>

	<merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	<merge from="root/res/values/attr.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/attr.xml" />

	<instantiate 
		from="root/src/app_package/activities/BaseActivity.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/activities/${className}.java" />

    	<open file="${escapeXmlAttribute(srcOut)}/activities/${className}.java" />

	<instantiate 
		from="root/src/app_package/fragments/BaseAppFragment.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/fragments/${secondName}.java" />

    	<open file="${escapeXmlAttribute(srcOut)}/fragments/${secondName}.java" />

	<instantiate 
		from="root/src/app_package/fragments/BaseSupportFragment.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/fragments/${thirdName}.java" />

    	<open file="${escapeXmlAttribute(srcOut)}/fragments/${thirdName}.java" />


	<instantiate 
	     from="root/src/app_package/dialogs/CustomProgressDialog.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/dialogs/CustomProgressDialog.java" />

	<instantiate 
	     from="root/src/app_package/utils/LogUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/LogUtil.java" />

	<instantiate 
	     from="root/src/app_package/utils/NetworkUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/NetworkUtil.java" />

	<instantiate 
	     from="root/src/app_package/utils/PreferenceUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/PreferenceUtil.java" />

	<instantiate 
	     from="root/src/app_package/utils/Constants.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/Constants.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomFontButton.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomFontButton.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomFontCheckBox.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomFontCheckBox.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomFontEditText.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomFontEditText.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomFontRadioButton.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomFontRadioButton.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomFontTextView.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomFontTextView.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomTypeFaceSpan.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomTypeFaceSpan.java" />

	<instantiate 
	     from="root/src/app_package/customview/CustomViewPager.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/CustomViewPager.java" />

	<instantiate 
	     from="root/src/app_package/customview/FragmentStatePagerAdapter.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/FragmentStatePagerAdapter.java" />

	<instantiate 
	     from="root/src/app_package/customview/NonScrollListView.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/NonScrollListView.java" />


	<instantiate 
	     from="root/src/app_package/customview/RoundedDrawable.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/RoundedDrawable.java" />


	<instantiate 
	     from="root/src/app_package/customview/RoundedImageView.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/RoundedImageView.java" />

	<instantiate 
	     from="root/src/app_package/customview/SquareImageView.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/SquareImageView.java" />

	<instantiate 
	     from="root/src/app_package/customview/SquareLinearLayout.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/customview/SquareLinearLayout.java" />

  
</recipe>

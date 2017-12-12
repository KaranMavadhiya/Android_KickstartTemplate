<?xml version="1.0"?>
<recipe>
	<instantiate 
		from="root/src/app_package/BaseActivity.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/activities/${className}.java" />

    	<open file="${escapeXmlAttribute(srcOut)}/activities/${className}.java" />

	<instantiate 
		from="root/src/app_package/BaseFragment.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/fragments/${secondName}.java" />

    	<open file="${escapeXmlAttribute(srcOut)}/fragments/${secondName}.java" />

	<instantiate 
	     from="root/src/app_package/CustomProgressDialog.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/dialogs/CustomProgressDialog.java" />

	<instantiate 
	     from="root/src/app_package/LogUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/LogUtil.java" />

	<instantiate 
	     from="root/src/app_package/NetworkUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/NetworkUtil.java" />

	<instantiate 
	     from="root/src/app_package/PreferenceUtil.java.ftl"
             to="${escapeXmlAttribute(srcOut)}/utils/PreferenceUtil.java" />
  
</recipe>

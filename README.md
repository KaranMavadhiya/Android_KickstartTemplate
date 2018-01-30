# Android Kickstart Template
#### This is a simple start-template to save your little time.

When you use this template it will automatically create some packages like activities, dialogs, fragments, utils which contains following files.

   #### Activity
   * activities/BaseActivity.java
   #### CustomView
   * customview/CustomFontButton.java
   * customview/CustomFontCheckBox.java
   * customview/CustomFontEditText.java
   * customview/CustomFontRadioButton.java
   * customview/CustomFontTextView.java
   * customview/CustomTypeFaceSpan.java
   * customview/CustomViewPager.java
   * customview/FragmentStatePagerAdapter.java
   * customview/NonScrollListView.java
   * customview/RoundedDrawable.java
   * customview/RoundedImageView.java
   * customview/SquareImageView.java
   * customview/SquareLinearLayout.java
   #### Dialog
   * dialogs/CustomProgressDialog.java (implimented in BaseActivity/BaseFragment)
   #### Fragment
   * fragments/BaseFragment.java (android.app.Fragment)
   * fragments/BaseSupportFragment.java (android.support.v4.app.Fragment)
   #### Utility
   * utils/Constants.java
   * utils/LogUtil.java
   * utils/NetworkUtil.java
   * utils/PreferanceUtil.java (implimented in BaseActivity/BaseFragment)


#### How to use it:
* Step 1: Clone/Download this repository.
* Step 2: Copy KickstartTemplate and Navigate to the location of the templates folder and Paste it into plugins/.../templates/other
~~~~
Windows: {ANDROID_STUDIO_LOCATION}/plugins/android/lib/templates/other/
~~~~

~~~~
Mac: /Applications/Android Studio.app/Contents/plugins/android/lib/templates/other/
~~~~
* Step 3: right click any package of your new/existing project and select New/Other/Kickstart


#### License

~~~~
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
~~~~

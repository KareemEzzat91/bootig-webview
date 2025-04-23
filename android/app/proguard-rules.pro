# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# webview_flutter rules
-keep class io.flutter.plugins.webviewflutter.** { *; }
-keep public class * extends android.webkit.WebViewClient { *; }
-keep public class * extends android.webkit.WebChromeClient { *; }

# shimmer rules (if needed, often not required but good to have just in case)
-keep class com.facebook.shimmer.** { *; }

# Keep specific classes/methods if errors point to them
# -keep class com.example.your_specific_class { *; }

# Keep Google Play Core library classes related to split installs and tasks
# -keep class com.google.android.play.core.splitcompat.** { *; } # Replaced by specific dontwarn rules
# -keep class com.google.android.play.core.splitinstall.** { *; } # Replaced by specific dontwarn rules
# -keep class com.google.android.play.core.tasks.** { *; } # Replaced by specific dontwarn rules

# Rules from build/app/outputs/mapping/release/missing_rules.txt
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task
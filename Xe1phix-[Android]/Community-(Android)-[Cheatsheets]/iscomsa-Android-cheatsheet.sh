###########################################################################################
 
# List installed packages
adb shell pm list packages | cut -d: -f2
 
# Get APK path to package
adb shell pm path com.xxxx.android
 
# Decompile APK package
apktool d <appname>
 
# Recompile APK package
apktool b <apkfolder> -o newapk.apk
 
# Decompile APK code (dex2jar)
d2j-dex2jar.sh someApk.apk
 
# Recompile APK code (jar2dex)
d2j-jar2dex.sh --output=classes.dex abc.jar
 
# Sign APK (note: debug keystore passphrase: android)
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -storepass android -keystore ~/testing/android/keys/debug.keystore <apkname> androiddebugkey
 
# Sign APK with d2j-apk-sign.sh
d2j-apk-sign.sh <apkname>
# Install APK (use -r to reinstall)
adb install <apkname>
 
# Uninstall APK (often required)
adb uninstall <apkname>
 
# Install Burp CA on device
Grab Burp CA
Change extension from .der to .crt
push certificate to /storage/sdcard
Import from SDCARD via settings
 
# Logcat filter by package
adb logcat | grep `adb shell ps | grep co.uk.xxxx.xxxx | cut -c10-15`
 
# View x509 certificate information
openssl x509 -in <certfile> -text -noout
 
# View x509 certificate modulus (often checked by pinning)
openssl x509 -modulus -inform DER -in cacert.der
 
# Load keystore (BKS)
keytool -list -v -keystore <bksfile> -provider org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath /usr/local/bin/bcprov-ext-jdk15on-1.46.jar -storetype BKS -storepass <password>
 
# Add CA to keystore (BKS)
keytool -importcert -v -trustcacerts -file "burp_ca.crt" -alias burp_ca -keystore <bksfile> -provider org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath "/usr/local/bin/bcprov-ext-jdk15on-1.46.jar" -storetype BKS -storepass <password>
 
# Dump to logcat Smali (with tag DBG)
const-string v1, "DBG"
invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
 
# Wait for debugger Smali
invoke-static {}, Landroid/os/Debug;->waitForDebugger()V
 
# Return true/false Smali
const/4 v0, 0x0
return v0
 
# Remount Android filesystem as r/w
mount -o rw,remount,rw /system
 
# Adb pull folder
adb shell find "/data/data/com.xxxx.xxx" | tr -d '\015' | while read line; do adb pull $line; done;
 
# Adb pull file
adb pull /data/app/com.xxxx.xxxx/base.apk
 
# Launch android emulator with proxy support (Burp)
emulator -avd ChallengeApp -http-proxy http://127.0.0.1:8081 -scale 0.4
 
# Launch android emulator with ANDROID_ID not null (sometimes used for rooted detection)
emulator -avd jbx86 -prop emu.uuid=5ec33f90-a471-11e2-9e96-0800200c9a66
 
# Capture screenshot (regardless of whether activity ACLs prevent them) (requires root)
/system/bin/screencap -p /storage/sdcard/screenshot.png
 
# Show listening debug ports
adb jdwp
 
# Debug with jdb
adb forward tcp:<port> jdwp:<port>
jdb -attach localhost:<port>
 
# Debug with rlwrapped jdb (use this one!)
adb forward tcp:<port> jdwp:<port>
rlwrap-jdb jdb -attach localhost:<port>
 
# Launch android emu menu
android avd ChallengeApp -scale 0.4
 
# Open shell to emulator/device
adb shell
 
# List devices
adb devices
 
# Target specific device when using multiple devices
adb -s <devicename> <command>
 
# Uninstall via intent (within emu)
adb shell am start -a android.intent.action.DELETE -d package:<your app package>
 
# Launch logcat GUI/sysmon
cd /home/xxxx/tools/android-sdk-linux/tools; monitor
 
# Launch logcat terminal
adb logcat
 
# Generate debug keystore
keytool -genkeypair -keyalg RSA -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999
 
# List keystore aliases
keytool -keystore debug.keystore -list -v
 
# SQLite3 database management:
sqlite3 <database>
.schema
 
# Get ANDROID_ID of device
adb shell content query --uri content://settings/secure/android_id --projection value
 
# Drozer commands
 # Install agent
 adb install drozer-agent-2.3.4.apk
 # Forward drozer port
 adb forward tcp:31415 tcp:31415
 # Connect
 drozer console --server 127.0.0.1:31415 connect
 # Get APK info
 run app.package.info -a <apkname>
 # Identify attack surface
 run app.package.attacksurface <apkname>
 # List activities
 run app.activity.info -a <apkname>
 
# Launch activity (in adb shell)(run as root if activity not exported)
adb shell am start -a android.intent.action.MAIN -n <activityname>
 
# Enable developer mode
Settings > About > Tap build number 7 times
 
# Query content provider
adb shell content query --uri content://url/username
 
# Bypass operation not permitted error when moving su binaries (Kingroot specific)
chattr -a su
 
# Boot into fastboot mode
adb reboot bootloader
 
# Run adb as root (not supported in production build)
adb root
 
# Run adb as root (alt)
adb kill-server; sudo $(whereis adb) start-server
 
# Compile and execute Java
public class HelloWorld {
 public static void main(String[] args) {
 System.out.println("Hello, World");
 }
}
javac HelloWorld.java
java HelloWorld
 
# Use Android Studio for smali source-level debugging
 Prerequisite: Install Android Studio.
 Prerequisite: Install 'smalidea' plugin from https://github.com/JesusFreke/smali/wiki/smalidea
 Prerequisite: Install APK as 'debuggable'=true.  You may have to patch the AndroidManifest in the APK for this.
 Step 1: Import the APK smali into Android Studio:
 Use Baksmali to dump APK smali into a source directory:
   <em>baksmali foobar.apk -o ~/tests/12345678ABC/project/src</em>
 Run Android Studio, select "Import Project" and select project directory (e.g. ~/tests/12345678ABC/project)
 For the import, choose "Create project from existing sources"
 Once created/imported in Android Studio, find the above 'src' directory in the 'Project' sub-view of the 'Project' pane.
 Right-click on the 'src' directory and select "Mark Directory As -> Sources Root"
 Navigate around the source, and set breakpoints where necessary.
 Step 2: Debug the APK
 Set the app to wait for the debugger when it runs:
   <em>adb shell am set-debug-app -w com.example.packagename</em>
 Launch the APK on the device (you should see 'waiting for debugger' pop-up)
 Run Android Monitor (monitor), click on the debuggable app in the 'Devices' pane, and note the local port number
   (local port number is usually 8700, shown in the last column such as '86XX / 8700')
   Leave monitor running, as it maintains the necessary port forwarding
 Create a 'Remote' debug configuration in Android Studio and set the localhost port to '8700' (or whatever found previously)
 Start the debug session in Android Studio with the newly created 'Remote' configuration.
 The 'Waiting For Debugger' pop-up should disappear on the device, and the debugger should hit any breakpoints set.
 Note - memory and registers (v0 etc) can be examined/modified in the 'Watches' window in Android Studio.
 
# Manage SDK/API settings
android
 
Notes:
 Applications storage path: /data/app/
 Data storage path: /data/data/<apkname> and /sdcard/Android/data/<apkname>
 SDCard: /storage/sdcard

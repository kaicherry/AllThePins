load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_bundle_import")
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")


objc_library(
name = "ObjCSources",
module_name = "WKYTPlayerView",
enable_modules = True,
resources = ["ThirdParty/WKYTPlayer/WKYTPlayerView.bundle",],
srcs = ["ThirdParty/WKYTPlayer/WKYTPlayerView.m",],
hdrs = ["ThirdParty/WKYTPlayer/WKYTPlayerView.h",],
sdk_frameworks = ["UIKit", "WebKit",],
)

swift_library(
name = "Combined",
module_name = "TheApp",
copts = ["-import-objc-header","/Users/kaicherry/AllThePins/AllThePins/AllThePins/ThirdParty/WKYTPlayer/AllThePins-Bridging-Header.h",],
srcs = [
"AppDelegate.swift",
"DetailViewController.swift",
"MasterViewController.swift",
"VPinTable.swift",
],
data = ["Base.lproj/Main.storyboard",":Resources","Images",],
deps = [":ObjCSources",":Crashlytics",":Fabric",],
)

#Third Party Frameworks not available as source
#Explictly list files in imported third party frameworks. globs are discouraged for stability/security
apple_static_framework_import(
name = "Crashlytics",
framework_imports = [
"ThirdParty/Crashlytics/Crashlytics.framework/Crashlytics",
"ThirdParty/Crashlytics/Crashlytics.framework/Info.plist",
"ThirdParty/Crashlytics/Crashlytics.framework/run",
"ThirdParty/Crashlytics/Crashlytics.framework/submit",
"ThirdParty/Crashlytics/Crashlytics.framework/uploadDSYM",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/ANSCompatibility.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/Answers.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/CLSAttributes.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/CLSLogging.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/CLSReport.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/CLSStackFrame.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Headers/Crashlytics.h",
"ThirdParty/Crashlytics/Crashlytics.framework/Modules/module.modulemap",
],
sdk_dylibs = ["libz",],
)

#Specify explictly files in imported third party frameworks
#Explictly list files in imported third party frameworks. globs are discouraged for stability/security
apple_static_framework_import(
name = "Fabric",
framework_imports = [
"ThirdParty/Crashlytics/Fabric.framework/Fabric",
"ThirdParty/Crashlytics/Fabric.framework/Info.plist",
"ThirdParty/Crashlytics/Fabric.framework/run",
"ThirdParty/Crashlytics/Fabric.framework/uploadDSYM",
"ThirdParty/Crashlytics/Fabric.framework/Headers/FABAttributes.h",
"ThirdParty/Crashlytics/Fabric.framework/Headers/Fabric.h",
"ThirdParty/Crashlytics/Fabric.framework/Modules/module.modulemap",
],
)

apple_resource_group(
name = "Resources",
resources = [
"Default Backglass.png",
"Default Playfield.png",
"woot.json",
#structured_resources = [],
],

)

apple_resource_group(
name = "Images",
resources = glob(["newfiles/**"],),
)

#This target cannot have the same name as the enclosing folder. This causes a conflict
#when building for arm. IE, the way XCode organizes a project. Suggest appending "App" as below.

ios_application(
name = "AllThePinsApp",
bundle_id = "com.sakurakai.vpaddicts.AllThePins",
families = [
"ipad",
],
provisioning_profile = "WildBazel.mobileprovision",
minimum_os_version = "12.1",
infoplists = ["Info.plist"],
visibility = ["//visibility:public"],
app_icons = glob(["Assets.xcassets/**"]),
launch_storyboard = "Base.lproj/LaunchScreen.storyboard",
deps = [":Combined",],
)

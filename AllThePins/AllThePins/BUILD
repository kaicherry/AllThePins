load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")

swift_library(
name = "Sources",
module_name = "AllThePins",
srcs = [
"AppDelegate.swift",
"DetailViewController.swift",
"MasterViewController.swift",
"VPinTable.swift",
],
data = [":Resources", ":Images", "Base.lproj/Main.storyboard", ],
)

apple_resource_group(
name = "Resources",
resources = [
"Default Backglass.png",
"Default Playfield.png",
"woot.json",
],

)

apple_resource_group(
name = "Images",
resources = glob(["newfiles/**"]),
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
deps = [":Sources"],
)

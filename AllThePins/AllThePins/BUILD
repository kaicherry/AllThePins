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

ios_application(
name = "AllThePins",
bundle_id = "com.sakurakai.vpaddicts.AllThePins",
families = [
"ipad",
],
minimum_os_version = "12.1",
infoplists = ["Info.plist"],
visibility = ["//visibility:public"],
app_icons = glob(["Assets.xcassets/**"]),
launch_storyboard = "Base.lproj/LaunchScreen.storyboard",
deps = [":Sources"],
provisioning_profile = "WildBazel.mobileprovision",
)

ios_application(
name = "AllThePins-Sim",
bundle_id = "com.sakurakai.vpaddicts.AllThePins",
families = [
"ipad",
],
minimum_os_version = "12.1",
infoplists = ["Info.plist"],
visibility = ["//visibility:public"],
app_icons = glob(["Assets.xcassets/**"]),
launch_storyboard = "Base.lproj/LaunchScreen.storyboard",
deps = [":Sources"],
)

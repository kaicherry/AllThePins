load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")

swift_library(
name = "Sources",
srcs = [
"AppDelegate.swift",
"DetailViewController.swift",
"MasterViewController.swift",
"VPinTable.swift",
],
data = [":Resources", ":Images"],
)

apple_resource_group(
name = "Resources",
resources = [
"Base.lproj/Main.storyboard",
#glob(["newfiles/*"]),
],
structured_resources = [],
)

apple_resource_group(
name = "Images",
structured_resources = glob(["newfiles/**"]),
)

ios_application(
name = "AllThePins",
bundle_id = "com.sakurakai.vpaddicts.AllThePins",
families = [
"iphone",
"ipad",
],
minimum_os_version = "12.2",
infoplists = ["Info.plist"],
visibility = ["//visibility:public"],
app_icons = glob(["Assets.xcassets/**"]),
launch_storyboard = "Resources/LaunchScreen.storyboard",
deps = [":Sources"],

)

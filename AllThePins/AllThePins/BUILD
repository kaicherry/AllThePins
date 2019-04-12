load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@build_bazel_rules_swift//swift:swift.bzl", "git_repository")
#load("//apple:versioning.bzl","apple_bundle_version")

swift_library(
name = "Sources",
srcs = [
"AppDelegate.swift",
"DetailViewController.swift",
"MasterViewController.swift",
"VPinTable.swift",
],
data = [
glob(["Base.lproj/**"]),
"woot.json",
glob["newfiles/**"],
],
)

ios_application(
name = "AllThePins",
bundle_id = "com.sakurakai.vpaddicts.AllThePins",
families = [
"iphone",
"ipad",
],
minimum_os_version = "12.1",
infoplists = [":AllThePins/Info.plist"],
visibility = ["//visibility:public"],
app_icons = glob(["Assets.xcassets/**"]),
deps = [],
)

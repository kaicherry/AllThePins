load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_group")
load("@build_bazel_rules_apple//apple:resources.bzl", "apple_bundle_import")
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")



#Non-Executable Resources to be bundled into final app. glob() is ok.

apple_resource_group(
    name = "Resources",
    resources = [
                    "Default Backglass.png",
                    "Default Playfield.png",
                    "woot.json",
    ],
    #structured_resources = [],
)

apple_resource_group(
    name = "Images",
    resources = glob(["newfiles/**"],),
)


#Combine Swift, ObjC, Resources, Frameworks into library
#NB: When bridging ObjC classes into apps, the bridging header must be specified

swift_library(
    name = "Combined",
    module_name = "TheApp",
    copts = [
                "-import-objc-header",
                "/Users/kaicherry/AllThePins/AllThePins/AllThePins/ThirdParty/WKYTPlayer/AllThePins-Bridging-Header.h",
            ],
    srcs =  [
                "AppDelegate.swift",
                "DetailViewController.swift",
                "MasterViewController.swift",
                "VPinTable.swift",
            ],
    data =  [
                "Base.lproj/Main.storyboard",
                ":Resources",
                "Images",
            ],
    deps =  [
                "//third_party/apple/objc/wkytplayer:wkytplayerview",
                "@crashlytics//:crashlytics", #use at(@) for remotes
                "@fabric//:fabric",
            ],
)


#Assemble the iOS App. In testing, it appears that this target cannot have the same name as the enclosing folder,
#ie the way XCode organizes a project. This causes a conflict when building for arm. Suggest appending "App" as below.

ios_application(
        name = "AllThePinsApp",
        bundle_id = "com.sakurakai.vpaddicts.AllThePins",
        families = ["ipad",],
        provisioning_profile = "WildBazel.mobileprovision",
        minimum_os_version = "12.1",
        infoplists = ["Info.plist"],
        visibility = ["//visibility:public"],
        app_icons = glob(["Assets.xcassets/**"]),
        launch_storyboard = "Base.lproj/LaunchScreen.storyboard",
        deps = [":Combined",],
)

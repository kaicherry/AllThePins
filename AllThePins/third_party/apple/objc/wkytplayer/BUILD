load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

package(default_visibility = ["//visibility:public"])

licenses([
"notice" # Individual deps have specific licenses
])



objc_library(
    name = "wkytplayerview",
    module_name = "WKYTPlayerView",
    enable_modules = True,
    resources = ["WKYTPlayerView.bundle",],
    srcs = ["WKYTPlayerView.m",],
    hdrs = ["WKYTPlayerView.h",],
    sdk_frameworks = [
        "UIKit",
        "WebKit",
    ],
)

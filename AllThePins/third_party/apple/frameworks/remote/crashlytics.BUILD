load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")

apple_static_framework_import(
    name = "crashlytics",
    framework_imports = [
                            "Crashlytics.framework/Crashlytics",
                            "Crashlytics.framework/Info.plist",
                            "Crashlytics.framework/run",
                            "Crashlytics.framework/submit",
                            "Crashlytics.framework/uploadDSYM",
                            "Crashlytics.framework/Headers/ANSCompatibility.h",
                            "Crashlytics.framework/Headers/Answers.h",
                            "Crashlytics.framework/Headers/CLSAttributes.h",
                            "Crashlytics.framework/Headers/CLSLogging.h",
                            "Crashlytics.framework/Headers/CLSReport.h",
                            "Crashlytics.framework/Headers/CLSStackFrame.h",
                            "Crashlytics.framework/Headers/Crashlytics.h",
                            "Crashlytics.framework/Modules/module.modulemap",
    ],
    sdk_dylibs = ["libz",],  
    visibility = ["//visibility:public"],
)

load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_framework_import")

apple_static_framework_import(
    name = "fabric",
        framework_imports = [
            "Fabric.framework/Fabric",
            "Fabric.framework/Info.plist",
            "Fabric.framework/run",
            "Fabric.framework/uploadDSYM",
            "Fabric.framework/Headers/FABAttributes.h",
            "Fabric.framework/Headers/Fabric.h",
            "Fabric.framework/Modules/module.modulemap",
        ],
        visibility = ["//visibility:public"],
)

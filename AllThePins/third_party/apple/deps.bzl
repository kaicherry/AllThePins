load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _new_http_archive(name, **kwargs):
    if not native.existing_rule(name):
        http_archive(name=name, **kwargs)

def _new_git_repository(name, **kwargs):
    if not native.existing_rule(name):
        new_git_repository(name=name, **kwargs)


def establish_framework_deps():
    _new_http_archive(
        name = "crashlytics",
        sha256 = "23792351c149f7c3aa207daae239628d598fe0849b59adc10fbccd181747f05b",
        strip_prefix = "iOS",
        urls = [
            "https://kit-downloads.fabric.io/cocoapods/crashlytics/3.12.0/crashlytics.zip"
        ],
	build_file = Label("//third_party/apple/frameworks/remote:crashlytics.BUILD"),
    )
    _new_http_archive(
        name = "fabric",
        sha256 = "2300f6c4884b987e8d81f5048ce9168048e9e3b0d0b4acef7089a48a982bb648",
        strip_prefix = "iOS",
        urls = [
                "https://kit-downloads.fabric.io/cocoapods/fabric/1.9.0/fabric.zip"
        ],
        build_file = Label("//third_party/apple/frameworks/remote:fabric.BUILD"),
    )




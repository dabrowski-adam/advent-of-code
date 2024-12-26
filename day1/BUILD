load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary")
load("@rules_jvm_external//:defs.bzl", "artifact")


scala_binary(
    name       = "app",
    srcs       = glob(["src/main/scala/**/*.scala"]),
    main_class = "adventofcode.day1.Main",
    deps       = [
        "//common:lib",
        artifact("org.typelevel:cats-effect_3"),
        # Transitive dependencies of cats-effect_3.
        artifact("org.typelevel:cats-core_3"),
        artifact("org.typelevel:cats-kernel_3"),
    ],
)

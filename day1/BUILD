load("@rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")
load("@rules_jvm_external//:defs.bzl", "artifact")

scala_library(
    name = "lib",
    srcs = glob(["src/main/scala/**/*.scala"]),
    resources = glob(["src/main/resources/**/*"]),
    deps = [
        "//common:lib",
        artifact("org.typelevel:cats-effect_3"),
        # Transitive dependencies of cats-effect_3.
        artifact("org.typelevel:cats-core_3"),
        artifact("org.typelevel:cats-kernel_3"),
        artifact("org.typelevel:cats-effect-std_3"),
        artifact("org.typelevel:cats-effect-kernel_3"),
    ],
)

scala_binary(
    name = "app",
    main_class = "adventofcode.day1.Main",
    deps = [
        ":lib",
    ],
)

scala_test(
    name = "test",
    size = "small",
    srcs = glob(["src/test/scala/**/*.scala"]),
    deps = [
        ":lib",
        artifact("org.scalatest:scalatest_3"),
    ],
)

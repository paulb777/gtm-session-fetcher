// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GTMSessionFetcher",
  platforms: [ .iOS(.v8), .macOS(.v10_10), .tvOS(.v9) ], // SPM doesn't allow iOS 7 or macOS 10.9
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to
    // other packages.
    .library(
      name: "GTMSessionFetcher_Core",
      targets: ["GTMSessionFetcher_Core"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "GTMSessionFetcher_Core",
      path: "Source",
      sources: ["GTMSessionFetcher.m", "GTMSessionFetcherLogging.m",
                "GTMSessionFetcherLogging.h", "GTMSessionFetcherService.m",
                "GTMSessionUploadFetcher.m",
                "GTMSessionUploadFetcher.h"],
      publicHeadersPath: "Public",
      cSettings: [
        .headerSearchPath("$(SRCROOT)/Public"),
      ],
      linkerSettings: [
        .linkedFramework("Security"),
        .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS])),
      ]),
  ]
)

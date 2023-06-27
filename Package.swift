// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "googletest",
    products: [
        .library(
            name: "googletest",
            targets: ["googletest"]),
		.executable(name: "gtest", targets: ["googletest", "gtest"]),
		.library(
			name: "googlemock",
			targets: ["googlemock"]),
    ],
    targets: [
        .target(
            name: "googletest",
			path: "googletest",
			exclude: [
				"src/gtest_main.cc",
				"src/gtest-all.cc",
			],
			sources: [
				"src/"
			],
			publicHeadersPath: "include/",
			cSettings: [
				.headerSearchPath("./"),
				.headerSearchPath("include/"),
			]
		),
		.executableTarget(
			name: "gtest",
			dependencies: [
				"googletest",
			],
			path: "googletest",
			sources: [
				"src/gtest_main.cc"
			],
			publicHeadersPath: "include/",
			cSettings: [
				.headerSearchPath("./"),
				.headerSearchPath("include/"),
			]
		),
		.target(
			name: "googlemock",
			dependencies: [
				"googletest",
			],
			path: "googlemock",
			exclude: [
				"src/gmock-all.cc",
				"src/gmock_main.cc",
			],
			sources: [
				"src/"
			],
			publicHeadersPath: "include/",
			cSettings: [
				.headerSearchPath("include/")
			]
		),
		.executableTarget(
			name: "gmock",
			dependencies: [
				"googlemock",
			],
			path: "googlemock",
			sources: [
				"src/gmock_main.cc"
			],
			publicHeadersPath: "include/",
			cSettings: [
				.headerSearchPath("include/"),
			]
		),
    ],
	cLanguageStandard: .gnu11,
	cxxLanguageStandard: .gnucxx20
)

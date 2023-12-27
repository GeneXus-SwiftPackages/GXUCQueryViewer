// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCQueryViewer",
	platforms: [.iOS("12.0")],
	products: [
		.library(
			name: "GXUCQueryViewer",
			targets: ["GXUCQueryViewerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-beta.5")
	],
	targets: [
		.target(name: "GXUCQueryViewerWrapper",
				dependencies: [
					"GXUCQueryViewer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCQueryViewer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-1.4.0-beta.5.xcframework.zip",
			checksum: "4bf20f3fb462d2c6fabf3641a12e1c9e5f73c28167c0602a956017d056a8e9c3"
		)
	]
)
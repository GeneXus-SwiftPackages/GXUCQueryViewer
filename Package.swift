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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", branch: "beta")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-1.0.0-beta+20230509173316.xcframework.zip",
			checksum: "3dea1e92f42cc0233dd5e523880d171a0f21eb6907765e67a61ba6bd2cba8623"
		)
	]
)
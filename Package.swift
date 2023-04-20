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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-1.0.0-beta+20230420132651.xcframework.zip",
			checksum: "1e1802a6a443617da79eb8cddc06283bdc71a5ea568bc415ffdcd8c1de1936a2"
		)
	]
)
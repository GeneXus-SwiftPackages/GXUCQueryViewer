// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCQueryViewer",
	platforms: [.iOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCQueryViewer",
			targets: ["GXUCQueryViewerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.25")
	],
	targets: [
		.target(name: "GXUCQueryViewerWrapper",
				dependencies: [
					"GXUCQueryViewer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCQueryViewer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-2.2.0-beta.25.xcframework.zip",
			checksum: "6fdcf7b6e38cb5d20578b9ed96a650463b1c90be4a4b38cb571e2f946af930a6"
		)
	]
)
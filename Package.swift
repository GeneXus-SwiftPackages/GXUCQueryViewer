// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCQueryViewer",
	platforms: [.iOS("15.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXUCQueryViewer",
			targets: ["GXUCQueryViewerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.12"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "4.2.0-beta.12")
	],
	targets: [
		.target(name: "GXUCQueryViewerWrapper",
				dependencies: [
					"GXUCQueryViewer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .visionOS])),
					.product(name: "GXGAM", package: "GXGAM", condition: .when(platforms: [.iOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCQueryViewer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-4.2.0-beta.12.xcframework.zip",
			checksum: "874a3233920ec42c267faa0cd34e310fc7753e55e79dfb9d7b21585398563daa"
		)
	]
)
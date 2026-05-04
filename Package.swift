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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.11"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXGAM.git", exact: "4.2.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-4.2.0-beta.11.xcframework.zip",
			checksum: "aa5956c08b149417b5d497b272a8c28ef560c5cf0e315f4a864d55a5cdca4537"
		)
	]
)
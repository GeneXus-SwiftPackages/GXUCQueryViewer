// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCQueryViewer",
	platforms: [.iOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCQueryViewer",
			targets: ["GXUCQueryViewerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-beta.36")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCQueryViewer-2.0.0-beta.36.xcframework.zip",
			checksum: "689a9b1761361ab36afa5ba2086bc0d09ab3a7e1e4e95b79a4ac403e886831ea"
		)
	]
)
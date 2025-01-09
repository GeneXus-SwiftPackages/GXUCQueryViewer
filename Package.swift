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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.2")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCQueryViewer-3.0.0-rc.2.xcframework.zip",
			checksum: "17ab207e0fd7713081a78653a185edaff4e503543c22261ec2cf617d69a9f040"
		)
	]
)
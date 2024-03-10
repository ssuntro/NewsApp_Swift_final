// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "@State@Binding_@StateObject@ObservedObject",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "@State@Binding_@StateObject@ObservedObject",
            targets: ["AppModule"],
            bundleIdentifier: "AnnJa.-State-Binding--StateObject-ObservedObject",
            teamIdentifier: "K9N3ERF77J",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .map),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)

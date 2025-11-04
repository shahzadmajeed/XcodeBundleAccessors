import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TuistBundleAccessors",
    targets: [
        .target(
            name: "TuistBundleAccessors",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistBundleAccessors",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UIMainStoryboardFile": "Main",
                    "UILaunchStoryboardName": "LaunchScreen",
                    "UIRequiresFullScreen": "YES",
                    "UIRequiredDeviceCapabilities": .array([]), // Explicitly empty
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": "NO",
                        "UISceneConfigurations": [
                            "UIWindowSceneSessionRoleApplication" : [
                                [
                                    "UILaunchStoryboardName": "LaunchScreen",
                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
                                    "UISceneStoryboardFile": "Main",
                                    "UISceneConfigurationName": "Default Configuration",
                                ],
                            ],
                        ],
                    ]
                ]
            ),
            sources: [
                "../../XcodeNative/App/Sources/**"
            ],
            resources: [
                "../../XcodeNative/App/Resources/***"
            ],
            dependencies: [.external(name: "DesignSystem"), .target(name: "Framework")]
        ),
        
            .target(
                name: "Framework",
                destinations: .iOS,
                product: defaultProductType,
                bundleId: "io.tuist.Framework",
                deploymentTargets: .iOS("16.0"),
                sources: [
                    "../../XcodeNative/Framework/Sources/**"
                ],
                resources: [
                    "../../XcodeNative/Framework/Resources/**"
                ],
                dependencies: [.external(name: "DesignSystem")]
            ),
    ]
)

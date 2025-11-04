# Repo Structure
Repository contains following folders:

### 1. SpmPackage
This is a local swift package with a module called `DesignSystem` that has some assets/images to expose to the consuming code.

### 2. XcodeNative
This is non-Tuist project created with Xcode template. It contains `App` target and `Framework` target. `Framework` uses `DesignSystem` from swift pacakge and returns a list of assets (Framework Assets + SPM Assets).

### 3. Tuist
This folder contains a Tuist project which uses same source and asset files as `XcodeNative` to create a Tuist generated project. This project also contains `TuistBundleAccessors` and `Framework` targets.

### 4. Issue
A directory containing some images to show the issue with static frameworks in Tuist generated project. It contains some more images to show how that problem is fixed after manipulating some build system and Tuist generated code.

# What is the Issue and how To Reproduce Issue?

### Issue
There are basically 2 different issues when Tuist generates a static framework from a swift package module containing assets or a Tuist project target containing assets.

#### Issue 1 - Compile Error
Tuist splits a module/target with assets into `Module.framework` static library and `package_Module.bundle` resource bundle. The generated `Module` source taget has no visibility into it's assets. So, when Xcode starts compiling, it doesn't know about these resources. There is no SPM in the picture so Xcode need explicit reference to assets so that AC can create Assets.car and generate resource accessors. This result into errors like `UIImage(resource: .scoreboardDarkImage)` not compiling because `.scoreboardDarkImage` accessor is not generated.

#### Issue 2 - Runtime Crash
Once above issue is fixed with an explicit reference to the assets, we meet a runtime crash where App is unable to locate the bundle being referenced. This is because static module's code is being called from within the consuming target (static linking) and the consuming target was a Tuist project so it does not contain `SWIFT_PACKAGE` flag. This causes `GeneratedAssetSymbols.swift` to use `Foundation.Bundle(for: ResourceBundleClass.self)` based bundle instead of SPM based `Foundation.Bundle.module`. Adding `SWIFT_PACKAGE` on consuming module forces the app to use correct `Bundle.module` but this is where Tuist again causs an issue. `Bundle.module` is provided by Tuist in case of static fraameworks but this Tuist generated code is missing an important SPM patch in `GeneratedAssetSymbols.swift`. The bundle URL is provided against `PACKAGE_RESOURCE_BUNDLE_URL` environment flag instead of `PACKAGE_RESOURCE_BUNDLE_PATH` which you can see in SPM/Xcode generated code. Adding `ProcessInfo.processInfo.environment["PACKAGE_RESOURCE_BUNDLE_PATH"] ?? ProcessInfo.processInfo.environment["PACKAGE_RESOURCE_BUNDLE_URL"]` fixes this issue too.

### Note: 
One important thing to note is that Xcode is able to generate `GeneratedAssetSymbols.swift` and other metadata files when its compiling such module directly from SPM even though Xcode treats all SPM products as static libraries (unless explicitely specified which is also buggy). This could be because, unlike Tuist, SPM doesn't break such module's source and assets/resources into separate bundles. Xcode does its magic at compile time and generates `package_Module.bundle` directly from SPM target. You can see these artifacts under `DerivedSources` directory of intermediate build artifacts. Xcode might be relying on SPM integration to reliably produce static library and its resource bundle.

## How To Reproduce?
1. cd `Tuist`
2. `tuist install && tuist generate`
3. Build and run `TuistBundleAccessors` scheme
4. Build fails --> Issue # 1
5. Fix step # 4 then you will see a runtime crash

## Xcode Native Project
Xcode native project that usses `DesignSystem` from lcoal spm pacakge is also provided as a comparison. This project works fine.

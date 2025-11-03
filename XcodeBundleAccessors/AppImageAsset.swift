//
//  AppImageAsset.swift
//  XcodeBundleAccessors
//
//  Created by Shahzad Majeed on 11/3/25.
//

import SwiftUI
import DesignSystem

// MARK: - App assets enumeration (manually maintained)
// Update this list to match the exact names in AppAssets.xcassets.
enum AppImageAsset: String, CaseIterable, AssetsResource {
    case arrowDownDarkImage
    case arrowDownLightImage
    case arrowUpDarkImage
    case arrowUpLightImage
    case caretDownImage
    case check12Image
    case circleFilledDarkImage
    case circleFilledLightImage
    case circleUnfilledDarkImage
    case circleUnfilledLightImage
    case closeDarkImage
    case triangleUpwardGreenImage
    
    var resource: ImageResource {
        switch self {
        case .arrowDownDarkImage: .arrowDownDark
        case .arrowDownLightImage: .arrowDownLight
        case .arrowUpDarkImage: .arrowUpDark
        case .arrowUpLightImage: .arrowUpLight
        case .caretDownImage: .caretDown
        case .check12Image: .check12
        case .circleFilledDarkImage: .circleFilledDark
        case .circleFilledLightImage: .circleFilledLight
        case .circleUnfilledDarkImage: .circleUnfilledDark
        case .circleUnfilledLightImage: .circleUnfilledLight
        case .closeDarkImage: .closeDark
        case .triangleUpwardGreenImage: .triangleUpwardGreen
        }
    }
    
    public var image: Image { Image(resource) }
    public var uiImage: UIImage { UIImage(resource: resource) }
    public var displayName: String { rawValue }
}

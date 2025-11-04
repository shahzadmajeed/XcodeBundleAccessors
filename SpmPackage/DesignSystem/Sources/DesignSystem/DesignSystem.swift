import Foundation
import UIKit
import SwiftUI

public protocol AssetsResource {
    var image: Image { get }
    var uiImage: UIImage { get }
    var displayName: String { get }
}

public enum SpmImageAsset: String, CaseIterable, AssetsResource {
    case envelope
    case globe
    case moneyBagDark
    case moneyBagLight
    case scoreboardDark
    case triangleLeftRedLight

    var resource: ImageResource {
        switch self {
        case .envelope: .envelope
        case .globe: .globe
        case .moneyBagDark: .moneyBagDark
        case .moneyBagLight: .moneyBagLight
        case .scoreboardDark: .scoreboardDark
        case .triangleLeftRedLight: .triangleLeftRedLight
        }
    }
    public var image: Image { Image(resource) }
    public var uiImage: UIImage {
    #if SWIFT_PACKAGE
        print("SPM Module: SWIFT_PACKAGE flag exists")
    #else
        print("SPM Module: SWIFT_PACKAGE flag does not exist")
    #endif
        return UIImage(resource: resource)
    }
    public var displayName: String { rawValue }
}

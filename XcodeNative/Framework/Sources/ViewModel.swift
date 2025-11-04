//
//  ViewModel.swift
//  TuistBundleAccessors
//
//  Created by Shahzad Majeed on 11/4/25.
//

import DesignSystem

public enum TableSection: Int, CaseIterable {
    
    case appAssets = 0
    case spmAssets

    public var title: String {
        switch self {
        case .appAssets: return "App Assets"
        case .spmAssets: return "SPM Target Assets"
        }
    }
}

public struct ViewModel {
    public init() {}
    
    public let appAssetItems: [AppImageAsset] = AppImageAsset.allCases
    public let spmAssetItems: [SpmImageAsset] = SpmImageAsset.allCases
}

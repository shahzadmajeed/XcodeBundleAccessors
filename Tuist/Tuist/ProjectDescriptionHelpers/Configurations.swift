// swift-tools-version: 6.0
import ProjectDescription

/// Override product type for spm target "DesignSystem" and "Framework" target of Tuist project
/// This will allow us to use `All Static` or `All Dynamic` product types across entire workspace
public let defaultProductType: Product = .framework

//
//  ZKProgressHUDType.swift
//  YKSwiftKit
//
//  Created by songhe on 2019/7/10.
//  Copyright © 2019 songhe. All rights reserved.
//

import Foundation
/// 显示类型
enum YKProgressHUDType {
    case gif
    case image
    case message
    case progress
    case activityIndicator
}
typealias HUDType = YKProgressHUDType

/// 加载动画样式
public enum YKProgressHUDAnimationStyle {
    /// 圆圈
    case circle
    /// 系统样式（菊花）
    case system
}
typealias AnimationStyle = YKProgressHUDAnimationStyle

/// 遮罩样式
public enum YKProgressHUDMaskStyle {
    /// 隐藏
    case hide
    /// 显示
    case visible
}

typealias MaskStyle = YKProgressHUDMaskStyle


/// HUD 毛玻璃样式
public enum YKProgressHUDEffectStyle {
    case none
    /// 高亮
    case extraLight
    /// 亮
    case light
    /// 暗
    case dark
}
typealias HUDEffectStyle = YKProgressHUDEffectStyle

/// 加载动画样式
public enum YKProgressHUDAnimationShowStyle {
    /// 淡入/淡出（默认）
    case fade
    /// 缩放
    case zoom
    /// 飞入
    case flyInto
}
typealias AnimationShowStyle = YKProgressHUDAnimationShowStyle


/// 情景图片显示类型
enum YKPrigressHUDImageType {
    case mask
    case info
    case error
    case success
}
typealias ImageType = YKPrigressHUDImageType

//
//  YKProgressHUDConfig.swift
//  YKSwiftKit
//
//  Created by songhe on 2019/7/10.
//  Copyright © 2019 songhe. All rights reserved.
//

import UIKit

/// YKProgressHUD 全局配置
final class YKProgressHUDConfig {
    static let margin: CGFloat = 20
    static var maskStyle: MaskStyle = .hide
    static var animationShowStyle: AnimationShowStyle = .fade
    static var maskBackgroundColor: UIColor = .black
    static var foregroundColor: UIColor = .white
    static var effectStyle: HUDEffectStyle = .dark
    static var effectAlpha: CGFloat = 1
    static var backgroundColor: UIColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.8)
    static var font: UIFont = UIFont.boldSystemFont(ofSize: 15)
    static var cornerRadius: CGFloat = 6
    static var animationStyle: AnimationStyle = .circle
    static var autoDismissDelay: Double = 2
    
    static let restorationIdentifier: String = "YKProgressHUD"
    static let YKNSNotificationDismiss = NSNotification.Name(rawValue: "YKNSNotificationDismiss")
    
    private static let imageBundle = Bundle(url: Bundle(for: YKProgressHUD.self).url(forResource: "YKProgressHUD", withExtension: "bundle")!)
    
    static func bundleImage(_ imageType: ImageType) -> UIImage? {
        var imageName: String!
        switch imageType {
        case .mask:
            imageName = "angle-mask"
        case .info:
            imageName = "info"
        case .error:
            imageName = "error"
        case .success:
            imageName = "success"
        }
        return UIImage(contentsOfFile: (imageBundle?.path(forResource: imageName, ofType: "png"))!)
    }
}
typealias Config = YKProgressHUDConfig


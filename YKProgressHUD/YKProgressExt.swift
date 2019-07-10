//
//  StringExt.swift
//  YKSwiftKit
//
//  Created by songhe on 2019/7/10.
//  Copyright © 2019 songhe. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func size(font: UIFont, size: CGSize) -> CGSize {
        let attribute = [ NSAttributedString.Key.font: font ]
        let conten = NSString(string: self)
        return conten.boundingRect(with: CGSize(width: size.width, height: size.height), options: .usesLineFragmentOrigin, attributes: attribute, context: nil).size
    }
}

extension UIView {
    var width: CGFloat {
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
    var x: CGFloat {
        return self.frame.origin.x
    }
    var y: CGFloat {
        return self.frame.origin.y
    }
}

extension UIWindow {
    static var frontWindow: UIWindow? {
        return UIApplication.shared.windows.reversed().first(where: {
            $0.screen == UIScreen.main &&
                !$0.isHidden && $0.alpha > 0 &&
                $0.windowLevel == UIWindow.Level.normal
        })
    }
}


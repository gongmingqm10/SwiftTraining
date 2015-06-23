//
//  DesignTextField.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/19/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

@IBDesignable
class DesignTextField: UITextField {
    
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, insetX, insetY)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, insetX, insetY)
    }
}

//
//  String+Extensions.swift
//  Calculator
//
//  Created by Ming Gong on 6/15/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

extension String {
    func beginsWith (str: String) -> Bool {
        if let range = self.rangeOfString(str) {
            return range.startIndex == self.startIndex
        }
        return false
    }
    
    func endsWith (str: String) -> Bool {
        if let range = self.rangeOfString(str) {
            return range.endIndex == self.endIndex
        }
        return false
    }
    
    mutating func removeCharsFromEnd(removeCount:Int) {
        let stringLength = self.characters.count
        let substringIndex = max(0, stringLength - removeCount)
        self = self.substringToIndex(advance(self.startIndex, substringIndex))
}
    
}
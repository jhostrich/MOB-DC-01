//
//  MyAttributedString.swift
//  harvestDC
//
//  Created by Adam Ostrich on 3/22/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

class MyAttributedString {
    
    class func stringWithLineSpacing(string: String, lineSpacing: CGFloat) -> NSMutableAttributedString {
        // Set the line spacing in the paragraph style
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineSpacing
        
        // Create the string
        var attrString = NSMutableAttributedString(string: string)
        
        // Add the paragraph style to the string
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        return attrString
    }
    
}
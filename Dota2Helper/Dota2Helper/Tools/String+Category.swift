//
//  String+Category.swift
//  SimplerSegmentMenu
//
//  Created by Shvier on 10/2/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

extension String {
    
    func sizeOfContent(font: UIFont) -> CGSize {
        var rect = CGRect()
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20);
        let attributes = [NSFontAttributeName: font]
        let content: NSAttributedString = NSAttributedString(string: self, attributes: attributes)
        rect = content.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil)
        return rect.size
    }
    
}

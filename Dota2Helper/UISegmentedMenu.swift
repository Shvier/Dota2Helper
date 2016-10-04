//
//  UISegmentedMenu.swift
//  SimplerSegmentMenu
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

public protocol UISegmentedMenuDelegate {
    
    func segmentedMenu(didSelectIndex index: NSInteger)
    
}

public enum UISegmentedMenuType: Int {
    // button width by text
    case plain
    // button width by avarage
    case fill
}

public class UISegmentedMenu: UIView {
    
    public var titleDataSource: NSArray?
    public var contentDataSource: NSArray?
    
    let kTag: NSInteger = 1000
    let min = { (float1: CGFloat, float2: CGFloat) -> CGFloat in
        return float1 > float2 ? float2 : float1
    }
    let max = { (float1: CGFloat, float2: CGFloat) -> CGFloat in
        return float1 > float2 ? float1 : float2
    }
    
    var contentView: UIScrollView?
    var selectedIndex: NSInteger?
    var delegate: UISegmentedMenuDelegate?
    var divideView: UIView?
    var divideLineView: UIView?
    var font: UIFont?
    var selectIndex: NSInteger?
    var widthArray: NSArray?
    var totalWidth: CGFloat?
    var type: UISegmentedMenuType?
    
    public func updateContentDateSource(contentDataSource: NSArray?) {
        self.contentDataSource = contentDataSource
    }
    
    public func updateTitleDataSource(titleDataSource: NSArray?, selectedIndex: NSInteger) {
        let widthArray: NSMutableArray = NSMutableArray()
        self.titleDataSource = titleDataSource
        var totalWidth: CGFloat = 0
        var index: NSInteger = 0
        for title in self.titleDataSource as! [String] {
            var buttonWidth: CGFloat
            switch self.type! {
            case .plain:
                buttonWidth = title.sizeOfContent(font: font!).width + 20
                break;
            case .fill:
                buttonWidth = self.bounds.size.width/CGFloat((self.titleDataSource?.count)!)
                break;
            }
            widthArray.add(NSNumber(value: Float(buttonWidth)))
            let button: UIButton = UIButton(frame: CGRect(x: totalWidth, y: 0, width: buttonWidth, height: bounds.size.height))
            button.tag = kTag + index
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.red, for: .selected)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(self.clickSegmentedButton(button:)), for: .touchUpInside)
            self.contentView?.addSubview(button)
            totalWidth += buttonWidth
            
            if index == selectedIndex {
                button.isSelected = true
                divideView?.frame = CGRect(x: 0, y: (contentView?.bounds.size.height)! - 2, width: buttonWidth, height: 2)
                self.selectedIndex = selectedIndex
            }
            index += 1
        }
        
        self.widthArray = NSArray(array: widthArray)
        self.totalWidth = totalWidth
        self.contentView?.contentSize = CGSize(width: totalWidth, height: 0)
        self.divideLineView?.frame = CGRect(x: 0, y: (self.contentView?.bounds.size.height)! - 2, width: totalWidth, height: 2)
    }
    
    public func currentSelectedIndex() -> NSInteger {
        return selectedIndex ?? 0
    }
    
    func clickSegmentedButton(button: UIButton) {
        let lastSelectedButton: UIButton = self.contentView?.viewWithTag(selectedIndex! + kTag) as! UIButton
        lastSelectedButton.isSelected = false
        
        button.isSelected = true
        selectedIndex = button.tag - kTag
        
        var totalWidth: CGFloat = 0
        if selectedIndex! == 0 {
            totalWidth = 0
        } else {
            for i in 0...selectedIndex!-1 {
                totalWidth += CGFloat((widthArray?[i] as! NSNumber).floatValue)
            }
        }
        
        let selectedWidth: CGFloat
        if let width = widthArray?[selectedIndex!] {
            selectedWidth = CGFloat((width as! NSNumber).floatValue)
        } else {
            selectedWidth = 0
        }
        var offsetX: CGFloat = totalWidth + (selectedWidth - self.bounds.size.width) * 0.5
        offsetX = min(self.totalWidth! - self.bounds.size.width, max(0, offsetX))
        
        contentView?.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        delegate?.segmentedMenu(didSelectIndex: selectedIndex!)
        UIView.animate(withDuration: 0.1) {
            self.divideView?.frame = CGRect(x: totalWidth - offsetX, y: (self.divideView?.frame.origin.y)!, width: selectedWidth, height: (self.divideView?.frame.size.height)!)
        }
    }
    
    func didSelectIndex(index: NSInteger) {
        let selectButton: UIButton = contentView?.viewWithTag(kTag + index) as! UIButton
        clickSegmentedButton(button: selectButton)
    }
    
    public init(frame: CGRect, contentDataSource: NSArray, titleDataSource: NSArray, type: UISegmentedMenuType) {
        super.init(frame: frame)
        
        font = UIFont(name: "Helvetica", size: 16)
        self.type = type
        
        contentView = UIScrollView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height - 0.5))
        contentView?.clipsToBounds = true
        contentView?.backgroundColor = UIColor.white
        contentView?.showsHorizontalScrollIndicator = false
        contentView?.showsVerticalScrollIndicator = false
        self.addSubview(contentView!)
        
        divideLineView = UIView()
        divideLineView?.backgroundColor = UIColor.groupTableViewBackground
        self.addSubview(divideLineView!)
        
        divideView = UIView()
        divideView?.backgroundColor = UIColor.red
        self.addSubview(divideView!)
        
        let divideImageView = UIImageView(frame: CGRect(x: 0, y: bounds.size.height - 1, width: bounds.size.width, height: 0.5))
        divideImageView.image = UIImage(named: "divider_line_image")
        self.addSubview(divideImageView)
        
        self.updateContentDateSource(contentDataSource: contentDataSource)
        self.updateTitleDataSource(titleDataSource: titleDataSource, selectedIndex: 0)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

//
//  YPMenuItem.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 24/01/2018.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import UIKit
import Stevia

final class YPMenuItem: UIView {
    
    var textLabel = UILabel()
    var button = UIButton()
    var iconImageView = UIImageView()
    var bottomView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func setup() {
        backgroundColor = .clear
        
        sv(
            iconImageView,
            textLabel,
            button,
            bottomView
        )
        iconImageView.centerInContainer()
        |-(10)-iconImageView-(10)-|
        textLabel.centerInContainer()
        |-(10)-textLabel-(10)-|
        button.fillContainer()
        
        layout(
            |-(10)-bottomView.height(2.0)-(10)-|,
            10
        )
        
        textLabel.style { l in
            l.textAlignment = .center
            l.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
            l.textColor = self.unselectedColor()
            l.adjustsFontSizeToFitWidth = true
            l.numberOfLines = 2
        }
        
        iconImageView.style { l in
            l.contentMode = .center
        }
        
        bottomView.style { l in
            l.backgroundColor = self.unselectedColor()
        }
    }
    
    func selectedColor() -> UIColor {
        return YPImagePickerConfiguration.shared.bottomMenuItemSelectedColour
    }
    
    func unselectedColor() -> UIColor {
        return YPImagePickerConfiguration.shared.bottomMenuItemUnSelectedColour
    }
    
    func select() {
        iconImageView.tintColor = selectedColor()
        textLabel.textColor = selectedColor()
        bottomView.backgroundColor = selectedColor()
    }
    
    func deselect() {
        iconImageView.tintColor = unselectedColor()
        textLabel.textColor = unselectedColor()
        bottomView.backgroundColor = unselectedColor()
    }
}

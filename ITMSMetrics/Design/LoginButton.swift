//
//  LoginButton.swift
//  ITMSMetrics
//
//  Created by ademturkoglu on 9.05.2020.
//  Copyright © 2020 ademturkoglu. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        setShadow()
        backgroundColor = UIColor.marineBlue
        layer.cornerRadius = 27
        
    }
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius  = 43
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.5
    }
    
}


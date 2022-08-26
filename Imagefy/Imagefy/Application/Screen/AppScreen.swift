//
//  AppScreen.swift
//  Imagefy
//
//  Created by Lucca Beurmann on 26/08/22.
//

import Foundation
import UIKit

class AppScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setUpView() {}
    
}

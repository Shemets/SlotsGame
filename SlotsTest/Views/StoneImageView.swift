//
//  StoneImageView.swift
//  SlotsTest
//
//  Created by Shemets on 05/01/2023.
//

import Foundation
import UIKit

class StoneImageView: UIImageView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUIImageView()
    }
    
    func setupUIImageView() {
        contentMode = .scaleAspectFit
        backgroundColor = .clear
    }
    
}

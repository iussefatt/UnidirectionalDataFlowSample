//
//  SampleView.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

class SampleView: UIView {
    
    private(set) lazy var indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .gray
        addSubview(indicator)
        indicator.snp.makeConstraints { $0.center.equalToSuperview() }
        indicator.hidesWhenStopped = true
        return indicator
    }()
}

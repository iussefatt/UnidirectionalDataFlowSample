//
//  LoadableViewController.swift
//  Test
//
//  Created by Ismael Ussefatt on 20/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

class LoadableViewController<CustomView: UIView>: UIViewController {
    
    var containerView = CustomView()
    
    func prepareCustomView() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

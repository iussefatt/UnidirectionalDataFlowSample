//
//  LeagueSeasonCell.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

class LeagueSeasonCell: UICollectionViewCell {
    
    static let identifier = "LeagueSeasonCell"
    
    private lazy var seasonLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .tertiarySystemBackground
    }
}

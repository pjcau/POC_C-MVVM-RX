//
//  CityViewCell.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//
import UIKit

class CityViewCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!

    func setCity(_ name: String) {
        nameLabel.text = name
    }
}

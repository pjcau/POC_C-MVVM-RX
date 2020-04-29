//
//  MVVMController.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import UIKit

protocol BaseViewController {
    func setupUI()
    func setupBindings()
}

class MVVMController: UIViewController, BaseViewController {
    func setupUI() {}

    func setupBindings() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
}

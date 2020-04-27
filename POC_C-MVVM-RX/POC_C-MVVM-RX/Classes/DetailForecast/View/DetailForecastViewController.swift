//
//  DetailForecastViewController.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class DetailForecastViewController: MVVMController, StoryboardInitializable {
    var viewModel: DetailForecastViewModel!

    private let disposeBag = DisposeBag()
}

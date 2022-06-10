//
//  BaseViewController.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxSwift
import UIKit

class BaseViewController<VM: BaseViewModel>: UIViewController {
    let disposeBag = DisposeBag()
    var viewModel: VM!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

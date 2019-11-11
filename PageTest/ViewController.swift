//
//  ViewController.swift
//  PageTest
//
//  Created by qiyizhong on 2019/11/4.
//  Copyright © 2019 qiyizhong. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pageView)
        pageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    lazy var pageView: PageView = {
        let view = PageView()
        view.backgroundColor = .white
        return view
    }()

}


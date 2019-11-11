//
//  WebCell.swift
//  PageTest
//
//  Created by qiyizhong on 2019/11/4.
//  Copyright © 2019 qiyizhong. All rights reserved.
//

import UIKit
import WebKit

class WebCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func update() {
        let url = URL(string: "https://www.baidu.com")
//        webView.loadRequest(URLRequest(url: url!))
        webView.load(URLRequest(url: url!))
    }
    
    lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        let view = WKWebView(frame: .zero, configuration: config)
        return view
    }()
    
//    lazy var webView: UIWebView = {
//        let view = UIWebView()
//        view.allowsInlineMediaPlayback = true
//        return view
//    }()
    
}

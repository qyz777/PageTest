//
//  PageView.swift
//  PageTest
//
//  Created by qiyizhong on 2019/11/4.
//  Copyright © 2019 qiyizhong. All rights reserved.
//

import UIKit

class PageView: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(WebCell.self, forCellWithReuseIdentifier: "WebCell")
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        isPagingEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension PageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 || indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
            cell.backgroundColor = .red
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WebCell", for: indexPath) as! WebCell
            cell.update()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        解决方案
        let sel = Selector("firstResponder")
        let fr = UIApplication.shared.keyWindow?.perform(sel)
        if let view = fr?.takeRetainedValue() as? UIView {
            view.resignFirstResponder()
        }
        if cell.isKind(of: WebCell.self) {
            print("WebCell:willDisplay")
        } else {
            print("other:willDisplay")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell.isKind(of: WebCell.self) {
            print("WebCell:didEndDisplaying")
        } else {
            print("other:didEndDisplaying")
        }
    }
    
}

//
//  Extensions.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 30/07/24.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

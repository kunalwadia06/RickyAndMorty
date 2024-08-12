//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 12/08/24.
//

import UIKit

final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported RMFooterLoadingCollectionReusableView")
    }
    
    private func addConstraints() {
        
    }
    
}

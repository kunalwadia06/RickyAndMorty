//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 30/07/24.
//

import UIKit

/// Single cell for a Character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return containerView
    }()
    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(containerView)
        
        containerView.backgroundColor = .secondarySystemBackground
        containerView.addSubViews(imageView, nameLabel, statusLabel)
        
        addConstraint()
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    /// a built-in func to reload the cell: when we use this func, the cell gets reset. We override this method when we want to do something when the cell resets. In this case, we are nullifying the components of this cell.
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    // MARK: -
    
    private func setShadowColor() {
            // Set the shadow color based on the current user interface style
            if traitCollection.userInterfaceStyle == .dark {
                contentView.layer.shadowColor = UIColor.white.cgColor // Use a light shadow color for dark mode
            } else {
                contentView.layer.shadowColor = UIColor.black.cgColor // Use a dark shadow color for light mode
            }
        }

    
    private func setUpLayer() {
        
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
        
//        containerView.backgroundColor = .red
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
//            
//            nameLabel.heightAnchor.constraint(equalToConstant: 30),
//            statusLabel.heightAnchor.constraint(equalToConstant: 30),
//            
//            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
//            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
//            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
//            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
//            
//            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
//            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),
            
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
//            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
            
            
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 7),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -7),
            statusLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 7),
            statusLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -7),
            
            statusLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
            
        ])
    }
    
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async{
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
    }
}

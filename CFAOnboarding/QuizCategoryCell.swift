//
//  QuizCategoryCell.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/23/23.
//

import UIKit


class QuizCategoryCell: UICollectionViewCell {
    static let reuseID = "Cell"
    
    // Create a UIImageView to display the category image
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    // Create a UILabel to display the category name
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        sv.alignment = .center
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add subviews to the cell's contentView
       
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        
        contentView.addSubview(stackView)
        
        // Add constraints for the image view and name label
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: QuizCategory) {
        imageView.image = category.image
        nameLabel.text = category.title
    }
}


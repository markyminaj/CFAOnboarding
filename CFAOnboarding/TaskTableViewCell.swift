//
//  TaskTableViewCell.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/16/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Bold", size: 18)
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.textColor = .label
        return lb
    }()
    
    private let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Semibold", size: 14)
        lb.textAlignment = .left
        lb.textColor = .secondaryLabel
        lb.lineBreakMode = .byTruncatingTail
        lb.numberOfLines = 0
        return lb
    }()
    
    private let dueDateLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Semibold", size: 14)
        lb.textAlignment = .left
        lb.textColor = .secondaryLabel
        lb.lineBreakMode = .byTruncatingTail
        lb.numberOfLines = 0
        return lb
    }()
    
    private let checkmarkView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.tintColor = .systemGreen
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let progressBar: UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.progress = 0
        pv.tintColor = .systemGreen
        return pv
    }()
    
    
    private let labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()
    
    private let checkmarkAndLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillProportionally
        sv.contentMode = .scaleAspectFill
        sv.spacing = 10
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellID")
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        labelStackView.addArrangedSubview(progressBar)
        
        checkmarkAndLabelStackView.addArrangedSubview(checkmarkView)
        checkmarkAndLabelStackView.addArrangedSubview(labelStackView)
        
        contentView.addSubview(checkmarkAndLabelStackView)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -50),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            labelStackView.widthAnchor.constraint(equalToConstant: 350),
            
            checkmarkAndLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            checkmarkAndLabelStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            checkmarkAndLabelStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            checkmarkAndLabelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            checkmarkAndLabelStackView.heightAnchor.constraint(equalToConstant: 150),
    
            checkmarkView.heightAnchor.constraint(equalToConstant: 40),
            checkmarkView.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func configure(task: Task) {
        titleLabel.text = task.title
        descriptionLabel.text = task.description
        progressBar.progress = task.progress
        
        if task.completed {
            checkmarkView.image = UIImage(systemName: "checkmark.circle.fill")
            print("CELL COMPLETED: \(task.title) is \(task.completed)")
        } else {
            checkmarkView.image = UIImage(systemName: "circle")
            print("CELL NOT COMPLETED: \(task.title) is \(task.completed)")
        }
        
    }
}

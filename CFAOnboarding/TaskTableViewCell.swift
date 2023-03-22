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
    
    private let progressBar: UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.progress = 0
        pv.tintColor = .systemGreen
        return pv
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 8
        
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(progressBar)
        
        accessoryType = .disclosureIndicator
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(task: Task) {
        titleLabel.text = task.title
        descriptionLabel.text = task.description
        progressBar.progress = task.progress
    }
}

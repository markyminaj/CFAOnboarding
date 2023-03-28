//
//  QuizCategoryCVController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/23/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class QuizCategoryCollectionVC: UIViewController {
    static let quizBrain = QuizBrain()
    let categories = quizBrain.categories
    let quizType: String = ""
    
    lazy var quizCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: view.frame.width/2.2, height: view.frame.width/2.2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(QuizCategoryCell.self, forCellWithReuseIdentifier: QuizCategoryCell.reuseID)
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizCategoryCollectionView.dataSource = self
        quizCategoryCollectionView.delegate = self
        
        view.addSubview(quizCategoryCollectionView)
        
        NSLayoutConstraint.activate([
            quizCategoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quizCategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizCategoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizCategoryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension QuizCategoryCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let catCell = categories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizCategoryCell.reuseID, for: indexPath) as! QuizCategoryCell
        cell.contentView.backgroundColor = .systemBackground
        cell.configure(with: catCell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let quizType = categories[indexPath.row].title
        let destinationVC = QuizViewController(with: quizType)
        destinationVC.quizType = quizType
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
}



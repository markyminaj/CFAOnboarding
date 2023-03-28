//
//  QuizCategoryCVController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/23/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class QuizCategoryCollectionVC: UIViewController {
    let quizData = QuizBrain().quizData
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
        let catCell = quizData[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizCategoryCell.reuseID, for: indexPath) as! QuizCategoryCell
        cell.contentView.backgroundColor = .systemBackground
        cell.configure(with: catCell)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = quizData[indexPath.row]
        //print("DEBUG: selected category is: \(selectedCategory.title)")
        let quizVC = QuizViewController()
        quizVC.questions = selectedCategory.questions
        //print("DEBUG: quiz vc questions are: \(quizVC.questions)")
        navigationController?.pushViewController(quizVC, animated: true)
    }
}



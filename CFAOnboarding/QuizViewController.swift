//
//  QuizViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/19/23.
//

import UIKit

class QuizViewController: UIViewController {
    var quizBrain = QuizBrain()
    var quizType: String = ""
    
    
    lazy var answerButtons: [UIButton] = []
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let progressView: UIProgressView = {
        let prog = UIProgressView()
        prog.translatesAutoresizingMaskIntoConstraints = false
        prog.tintColor = .systemGreen
        return prog
    }()
    
    let buttonStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.layer.cornerRadius = 12
        sv.backgroundColor = .systemBackground
        return sv
    }()

    @objc private func updateUI() {
        //let quizQuestionBank: [Question] = []
        
        if quizBrain.questionNumber < quizBrain.allQuestions.count {
            questionLabel.text = quizBrain.getQuestionText()
            updateProgress()
            createAnswerButtons()
            resetButtonsToRed()
            
        }
        updateScore()
    }
    
    private func resetButtonsToRed() {
        for button in answerButtons {
            button.configuration?.baseBackgroundColor = .systemRed
        }
    }
    
    
    private func createAnswerButtons() {
        for (index, option) in
                quizBrain.allQuestions[quizBrain.questionNumber].options.enumerated() {
            let button = UIButton()
            button.configuration = .borderedProminent()
            button.configuration?.baseBackgroundColor = .systemRed
            button.configuration?.cornerStyle = .fixed
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
            button.configuration?.title = option
            answerButtons.append(button)
        }
        updateButtonTitles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    init(with type: String) {
        super.init(nibName: nil, bundle: nil)
        updateUI()
        self.quizType = type
        print("IN QUIZ VC with QuizType: \(self.quizType)")
    }
    
    private func updateScore() {
        scoreLabel.text = "Score: \(quizBrain.score)"
    }
    
    private func updateProgress() {
        progressView.progress = quizBrain.progress / Float(quizBrain.allQuestions.count)
    }
    
    private func blinkAnimation() -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.2
        animation.autoreverses = true
        animation.repeatCount = 2
        return animation
    }
    
    
    @objc private func checkAnswer(_sender: UIButton) {
        if _sender.tag == quizBrain.allQuestions[quizBrain.questionNumber].answerIndex {
            quizBrain.score += 1
            quizBrain.questionNumber += 1
            quizBrain.progress += 1
            
            _sender.configuration?.baseBackgroundColor = .systemGreen
            
            _sender.layer.add(blinkAnimation(), forKey: "opacity")
            

            if quizBrain.questionNumber < quizBrain.allQuestions.count {
//                createAnswerButtons()
                
                Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                
//                UIView.animate(withDuration: 0.1, animations: {
//                    _sender.transform = CGAffineTransform(translationX: 10, y: 0)
//                }, completion: { _ in
//                    UIView.animate(withDuration: 0.1, animations: {
//                        _sender.transform = CGAffineTransform(translationX: -10, y: 0)
//                    }, completion: { _ in
//                        UIView.animate(withDuration: 0.1, animations: {
//                            _sender.transform = CGAffineTransform.identity
//                        })
//                    })
//                })
            } else {
                // if questionNumber goes out of bounds, show an alert or perform some other action
                let alert = UIAlertController(title: "Quiz Complete", message: "You have finished the quiz!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                quizBrain.questionNumber = 0
                quizBrain.score = 0
                updateUI()
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                _sender.transform = CGAffineTransform(translationX: 10, y: 0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    _sender.transform = CGAffineTransform(translationX: -10, y: 0)
                    
                }, completion: { _ in
                    UIView.animate(withDuration: 0.8, animations: {
                        _sender.transform = CGAffineTransform.identity
                        _sender.configuration?.baseBackgroundColor = .systemBackground
                    })
                })
            })
            
            _sender.layer.add(blinkAnimation(), forKey: "opacity")
           
        }
    }

    
    private func updateButtonTitles() {
        for (index, option) in quizBrain.allQuestions[quizBrain.questionNumber].options.enumerated() {
            answerButtons[index].setTitle(option, for: .normal)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubview(questionLabel)
        
        for button in answerButtons {
            buttonStack.addArrangedSubview(button)
        }
        
        view.addSubview(buttonStack)
        view.addSubview(scoreLabel)
        view.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            questionLabel.heightAnchor.constraint(equalToConstant: 150),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 8),
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            buttonStack.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: -8),
            
            scoreLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scoreLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -10),
            
            progressView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 8),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

//
//  QuizViewController.swift
//  CFAOnboarding
//
//  Created by Mark Martin on 3/19/23.
//

import UIKit

class QuizViewController: UIViewController {
    var quizBrain = QuizBrain()
    var questions: [Question] = []
    
    
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
        print("INSIDE UPDATE UI")
        guard quizBrain.questionNumber < questions.count else {
            showResult()
            print(questions.count)
            return
        }
        
        let question = questions[quizBrain.questionNumber]
        questionLabel.text = question.title
        updateProgress()
        createAnswerButtons()
        resetButtonsToRed()
        updateScore()
    }
    
    private func showResult() {
        let alert = UIAlertController(title: "Quiz Complete", message: "You have finished the quiz!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        quizBrain.questionNumber = 0
        quizBrain.score = 0
    }
    
    private func resetButtonsToRed() {
        for button in answerButtons {
            button.configuration?.baseBackgroundColor = .systemRed
        }
    }
    
    
    private func createAnswerButtons() {
        let currentQuestion = questions[quizBrain.questionNumber]
        for i in 0..<currentQuestion.options.count {
            let button = UIButton()
            button.configuration = .borderedProminent()
            button.configuration?.baseBackgroundColor = .systemRed
            button.configuration?.cornerStyle = .fixed
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = i
            button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
            answerButtons.append(button)
        }
        updateButtonTitles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Debug - Questions Array: \(questions)")
        print("DEBUG - Question Count: \(questions.count)")
        updateUI()
        layout()
    }
    
    
    private func updateScore() {
        scoreLabel.text = "Score: \(quizBrain.score)"
    }
    
    private func updateProgress() {
        progressView.progress = quizBrain.progress / Float(questions.count)
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
        if _sender.tag == questions[quizBrain.questionNumber].answerIndex {
            quizBrain.score += 1
            quizBrain.questionNumber += 1
            quizBrain.progress += 1
            
            _sender.configuration?.baseBackgroundColor = .systemGreen
            _sender.layer.add(blinkAnimation(), forKey: "opacity")
            
            if quizBrain.questionNumber < questions.count {
                Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            } else {
                showResult()
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
        for (index, option) in questions[quizBrain.questionNumber].options.enumerated() {
            answerButtons[index].setTitle(option, for: .normal)
        }
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

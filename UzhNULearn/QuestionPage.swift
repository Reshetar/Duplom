//
//  QuestionPage.swift
//  UzhNULearn
//
//  Created by Reshetar Yevhen on 11/29/18.
//  Copyright © 2018 Evgen Reshetar. All rights reserved.
//

import Foundation
import Firebase

class QuestionPage: UIViewController {
    
    var questionValue = ""
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var FirstButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Так", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleFirstButtonContoller), for: .touchUpInside)
        
        return button
    }()
    
    lazy var SecondButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Ні", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleSecondButtonContoller), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Опитування"
        
        view.backgroundColor = UIColor.white
        
        fetchQuestion()
        
        view.addSubview(titleLabel)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-90-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabel]))
        
        view.addSubview(FirstButton)
        view.addSubview(SecondButton)
        
        setupFirstButton()
        setupSecondButton()
        
        print(questionValue)
        
    }
    
    @objc func handleFirstButtonContoller(){
        let newSubjectController = FirstButtonResultController()
        let navController = UINavigationController(rootViewController: newSubjectController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleSecondButtonContoller(){
        let newSubjectController = SecondButtonResultController()
        let navController = UINavigationController(rootViewController: newSubjectController)
        present(navController, animated: true, completion: nil)
    }

    @objc func handleCancel (){
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
    }

    func setupFirstButton() {
        //x,y,width,height
        FirstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        FirstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 335).isActive = true
        FirstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        FirstButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupSecondButton() {
        //x,y,width,height
        SecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SecondButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 390).isActive = true
        SecondButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        SecondButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func fetchQuestion() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("question").observe(.childAdded, with: { (snapshot) in
            if snapshot.key == "title" {
                self.questionValue = snapshot.value as! String
                self.titleLabel.text = self.questionValue
            }
        })
    }
}

class FirstButtonResultController: UIViewController {
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    let resultLabel2: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let resultLabel3: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "До предмету", style: .plain, target: self, action: #selector(done))
        
        navigationItem.title = "Результати"
        
        view.backgroundColor = UIColor.white
        
        var numberYes = 0
        var numberNo = 0
        var titleQuestion = ""
        
        view.addSubview(resultLabel)
        view.addSubview(resultLabel2)
        view.addSubview(resultLabel3)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-75-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))
        
        
        
        FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("question").observe(.childAdded, with: { (snapshot) in
            if snapshot.key == "title" {
                titleQuestion = snapshot.value as! String
                self.resultLabel.text = "\(titleQuestion)\nРезультати:"
            }
            if snapshot.key == "yes" {
                numberYes = snapshot.value as! Int
                numberYes += 1
                let ref = FIRDatabase.database().reference(fromURL: "https://uzhnulearn.firebaseio.com/")
                let ratingDatabase = ref.child("courses").child("subjects3").child("other").child("os").child("question")
                let values = ["yes": numberYes] as [String : Any]
                ratingDatabase.updateChildValues(values, withCompletionBlock: {(error, ref) in
                    if error != nil {
                        print(error!)
                        return
                    }
                })
                self.resultLabel2.text = "Проголосувало \"Так\": \(numberYes)"
            }
            if snapshot.key == "no" {
                numberNo = snapshot.value as! Int
                self.resultLabel3.text = "Проголосувало \"Ні\": \(numberNo)"
            }
            
        })
    }
    
    @objc func done() {
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
}

class SecondButtonResultController: UIViewController {
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    let resultLabel2: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let resultLabel3: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "До предмету", style: .plain, target: self, action: #selector(done))
        
        navigationItem.title = "Результати"
        
        view.backgroundColor = UIColor.white
        
        var numberYes = 0
        var numberNo = 0
        var titleQuestion = ""
        
        view.addSubview(resultLabel)
        view.addSubview(resultLabel2)
        view.addSubview(resultLabel3)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-75-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))

        FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("question").observe(.childAdded, with: { (snapshot) in
            if snapshot.key == "title" {
                titleQuestion = snapshot.value as! String
                self.resultLabel.text = "\(titleQuestion)\nРезультати:"
            }
            if snapshot.key == "no" {
                numberNo = snapshot.value as! Int
                numberNo += 1
                let ref = FIRDatabase.database().reference(fromURL: "https://uzhnulearn.firebaseio.com/")
                let ratingDatabase = ref.child("courses").child("subjects3").child("other").child("os").child("question")
                let values = ["no": numberNo] as [String : Any]
                ratingDatabase.updateChildValues(values, withCompletionBlock: {(error, ref) in
                    if error != nil {
                        print(error!)
                        return
                    }
                })
                self.resultLabel3.text = "Проголосувало \"Ні\": \(numberNo)"
            }
            if snapshot.key == "yes" {
                numberYes = snapshot.value as! Int
                self.resultLabel2.text = "Проголосувало \"Так\": \(numberYes)"
            }
            
        })
    }
    
    @objc func done() {
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
}


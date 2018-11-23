//
//  TestsController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 5/2/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var indexSelectValue: Int?
var trueAnswerValue: String?
var score = 0
var numberQuestion: Int?

class FirstModulTestController: UITableViewController {

    var questions = [QuestionModel]()
    var tests = [TestModel]()
    var trueanswers = [TrueAnswerModel]()
    
    var indexValue: Int?
    var questionValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let indexView = navigationController?.viewControllers.index(of: self)
        
        indexValue = indexView! - 2
        
        navigationItem.title = "Тест з ОС"
        
        tableView.register(QuestionsHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 100
        
        fetchQuestion()
        fetchTest()
        fetchTrueTest()
        
        tableView.tableFooterView = UIView()
        
    }
    
    func fetchQuestion() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("mod1").child("questions").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let question = QuestionModel()
                question.setValuesForKeys(dictionary)
                self.questions.append(question)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
            
        }, withCancel: nil)
    }
    
    func fetchTest() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("mod1").child("answers").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let test = TestModel()
                test.setValuesForKeys(dictionary)
                self.tests.append(test)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
            
        }, withCancel: nil)
    }
    
    func fetchTrueTest() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("mod1").child("answerstrue").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let trueAnswer = TrueAnswerModel()
                trueAnswer.setValuesForKeys(dictionary)
                self.trueanswers.append(trueAnswer)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
            
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tests.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        let test = tests[indexPath.row]
        
        
        
        if indexValue == 0 {
  
            let question = questions[indexPath.startIndex]
            questionValue = question.question
            
            cell.textLabel?.text = test.answer1
        
        }
        
        if indexValue == 1 {
            
            let question = questions[indexPath.startIndex + 1]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer2
            
        }
        
        if indexValue == 2 {
  
            let question = questions[indexPath.startIndex + 2]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer3
            
        }
        
        
        if indexValue == 3 {
            
            let question = questions[indexPath.startIndex + 3]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer4
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "headerId")
        
        cell.textLabel?.text = questionValue
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.backgroundColor = UIColor(r:230,g:230,b:230)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = indexValue {
            
            numberQuestion = indexValue
            
            indexSelectValue = indexPath.row + 1
            
            var oneNumber: Int?
            var twoNumber: Int?
            var threeNumber: Int?
            var fourNumber: Int?
            
            let answerTrue = trueanswers[index]
            
            if answerTrue.answerstrue == "1" {
                let one: Int = Int(answerTrue.answerstrue!)!
                oneNumber = one
                
            }
            
            if answerTrue.answerstrue == "2" {
                let two: Int = Int(answerTrue.answerstrue!)!
                twoNumber = two
            }
            
            if answerTrue.answerstrue == "3" {
                let three: Int = Int(answerTrue.answerstrue!)!
                threeNumber = three
            }
            
            if answerTrue.answerstrue == "4" {
                let four: Int = Int(answerTrue.answerstrue!)!
                fourNumber = four
            }
            
            if indexSelectValue == oneNumber {
                score = score + 1
            }
            
            else {
                score = score + 0
            }
            
            if indexSelectValue == twoNumber {
                score = score + 1
            }
                
            else {
                score = score + 0
            }
            
            if indexSelectValue == threeNumber {
                score = score + 1
            }
                
            else {
                score = score + 0
            }
            
            if indexSelectValue == fourNumber {
                score = score + 1
            }
                
            else {
                score = score + 0
            }
            
            print(score)
            
            
            if index < questions.count - 1 {
                
                let FirstModulController = FirstModulTestController()
                navigationController?.pushViewController(FirstModulController, animated: true)
                
            }
            else {
                
                let controller = ResultController()
                navigationController?.pushViewController(controller, animated: true)
                
            }
            
        }
        
    }
    
}

class ResultController: UIViewController {
    
    
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Вітаю"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let resultLabel2: UILabel = {
        let label = UILabel()
        label.text = "Вітаю"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    let resultLabel3: UILabel = {
        let label = UILabel()
        label.text = "Вітаю"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Завершити", style: .plain, target: self, action: #selector(done))
        
        navigationItem.title = "Результат"
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(resultLabel)
        view.addSubview(resultLabel2)
        view.addSubview(resultLabel3)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-45-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel3]))

        let ball = 100/15*score
        
        resultLabel.text = "Ваш результат:"
        resultLabel2.text = "\(score) правильних з 15 тестів"
        resultLabel3.text = "По 100 шкалі оцінювання: \(ball)"

        
        let ref = FIRDatabase.database().reference(fromURL: "https://uzhnulearn.firebaseio.com/")
        let ratingDatabase = ref.child("courses").child("subjects3").child("tests").child("os").child("result")
        let values = ["name": emailUser, "rating": score, "userUID": uidUser] as [String : Any] 
        ratingDatabase.updateChildValues(values, withCompletionBlock: {(error, ref) in
            
            if error != nil {
                print(error!)
                return
            }
            
        })
        
        score = 0
        
    }
    
    @objc func done() {
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
    
    var tests = [TestModel]()
    
    func fetchTest() {
        
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("mod1").child("answers").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let test = TestModel()
                test.setValuesForKeys(dictionary)
                self.tests.append(test)
                
            }
            
        }, withCancel: nil)
        
    }
    
}

class QuestionsHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.text = "Question"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

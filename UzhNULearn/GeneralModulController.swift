//
//  GeneralModulController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 5/9/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var indexSelectValueGeneral: Int?
var trueAnswerValueGeneral: String?
var scoreGeneral: Float = 0
var numberQuestionGeneral: Int?

class GeneralModulController: UITableViewController {

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
        
        tableView.register(GeneralQuestionsHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 100
        
        fetchGeneralQuestion()
        fetchGeneralTest()
        fetchGeneralTrueTest()
        
        tableView.tableFooterView = UIView()
        
    }
    
    func fetchGeneralQuestion() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("general").child("questions").observe(.childAdded, with: { (snapshot) in
            
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
    
    func fetchGeneralTest() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("general").child("answers").observe(.childAdded, with: { (snapshot) in
            
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
    
    func fetchGeneralTrueTest() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("general").child("answerstrue").observe(.childAdded, with: { (snapshot) in
            
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
        
        if indexValue == 4 {
            
            let question = questions[indexPath.startIndex + 4]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer5
            
        }
        
        if indexValue == 5 {
            
            let question = questions[indexPath.startIndex + 5]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer6
            
        }
        
        if indexValue == 6 {
            
            let question = questions[indexPath.startIndex + 6]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer7
            
        }
        
        if indexValue == 7 {
            
            let question = questions[indexPath.startIndex + 7]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer8
            
        }
        
        if indexValue == 8 {
            
            let question = questions[indexPath.startIndex + 8]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer9
            
        }
        
        if indexValue == 9 {
            
            let question = questions[indexPath.startIndex + 9]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer10
            
        }
        
        if indexValue == 10 {
            
            let question = questions[indexPath.startIndex + 10]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer11
            
        }
        
        if indexValue == 11 {
            
            let question = questions[indexPath.startIndex + 11]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer12
            
        }
        
        if indexValue == 12 {
            
            let question = questions[indexPath.startIndex + 12]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer13
            
        }
        
        if indexValue == 13 {
            
            let question = questions[indexPath.startIndex + 13]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer14
            
        }
        
        if indexValue == 14 {
            
            let question = questions[indexPath.startIndex + 14]
            
            questionValue = question.question
            cell.textLabel?.text = test.answer15
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "headerId")
        
        view.addSubview(textView)
        
        textView.text = questionValue
        
        setupTextLabelView()
        
        cell.textLabel?.text = textView.text
        
        return cell
        
    }
    
    var textView: UITextView = {
        let text = UITextView()
        text.textColor = UIColor.black
        text.backgroundColor = UIColor(r:230,g:230,b:230)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.boldSystemFont(ofSize: 16)
        
        return text
    }()
    
    func setupTextLabelView() {
        //x,y,width,height
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = indexValue {
            
            numberQuestionGeneral = indexValue
            
            indexSelectValueGeneral = indexPath.row + 1
            
            var oneNumber: Int?
            var twoNumber: Int?
            var threeNumber: Int?
            var fourNumber: Int?
            var fiveNumber: Int?
            
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
            
            if answerTrue.answerstrue == "5" {
                let five: Int = Int(answerTrue.answerstrue!)!
                fiveNumber = five
            }
            
            if indexSelectValueGeneral == oneNumber {
                scoreGeneral = scoreGeneral + 1
            }
                
            else {
                scoreGeneral = scoreGeneral + 0
            }
            
            if indexSelectValueGeneral == twoNumber {
                scoreGeneral = scoreGeneral + 1
            }
                
            else {
                scoreGeneral = scoreGeneral + 0
            }
            
            if indexSelectValueGeneral == threeNumber {
                scoreGeneral = scoreGeneral + 1
            }
                
            else {
                scoreGeneral = scoreGeneral + 0
            }
            
            if indexSelectValueGeneral == fourNumber {
                scoreGeneral = scoreGeneral + 1
            }
                
            else {
                scoreGeneral = scoreGeneral + 0
            }
            
            if indexSelectValueGeneral == fiveNumber {
                scoreGeneral = scoreGeneral + 1
            }
                
            else {
                scoreGeneral = scoreGeneral + 0
            }
            
            if index < questions.count - 1 {
                
                let newGeneralModulController = GeneralModulController()
                navigationController?.pushViewController(newGeneralModulController, animated: true)
                
            }
            else {
                
                let controller = GeneralResultController()
                navigationController?.pushViewController(controller, animated: true)
                
            }
            
        }
        
    }
    
}

class GeneralResultController: UIViewController {
 
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
        
        let ballGeneral: Float?
        ballGeneral = 100 / 15 * scoreGeneral
        ballGeneral?.round()
        let intBallGeneral = Int(ballGeneral!)
        let intScoreGeneral = Int(scoreGeneral)
        
        resultLabel.text = "Ваш результат:"
        resultLabel2.text = "\(intScoreGeneral) правильних з 15 тестів"
        resultLabel3.text = "По 100 шкалі оцінювання: \(intBallGeneral)"
        
        
        let ref = FIRDatabase.database().reference(fromURL: "https://uzhnulearn.firebaseio.com/")
        let ratingDatabase = ref.child("courses").child("subjects3").child("tests").child("os").child("general").child("result").child(uidUser)
        let values = ["name": emailUser, "rating": ballGeneral!] as [String : Any]
        ratingDatabase.updateChildValues(values, withCompletionBlock: {(error, ref) in
            
            if error != nil {
                print(error!)
                return
            }
            
        })
        
        scoreGeneral = 0
        
    }
    
    @objc func done() {
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
}

class GeneralQuestionsHeader: UITableViewHeaderFooterView {
    
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    var textView: UITextView = {
//        let text = UITextView()
//        text.textColor = UIColor.black
//        text.translatesAutoresizingMaskIntoConstraints = false
//        text.font = .systemFont(ofSize: 16)
//        
//        return text
//    }()
//    
    
//    func setupViews() {
//        addSubview(textView)
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textView]))
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
}

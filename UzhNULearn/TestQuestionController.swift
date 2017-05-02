//
//  TestQuestionController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/29/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

struct Question {
    var questionString: String?
    var answers: [String]?
    var selectedAnswerIndex: Int?
}

var answerValue: String?

var questionList: [Question] = [Question(questionString: "Речення з питанням", answers: ["Відповідь 1", "Відповідь 2", "Відповідь 3", "Відповідь 4"], selectedAnswerIndex: nil)]

class TestQuestionController: UITableViewController {

    let cellId = "cellId"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Тест з ОС"
        
        tableView.register(AnswerCell.self, forCellReuseIdentifier: cellId)
        tableView.register(QuestionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        
        tableView.sectionHeaderHeight = 50
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AnswerCell
        
        if let index = navigationController?.viewControllers.index(of: self){
            let question = questionList[index]
            cell.nameLabel.text = question.answers?[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! QuestionHeader
        
        if let index = navigationController?.viewControllers.index(of: self){
            let question = questionList[index]
            header.nameLabel.text = question.questionString
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = navigationController?.viewControllers.index(of: self){
            questionList[index].selectedAnswerIndex = indexPath.item
            
            if index < questionList.count - 1 {
                let questionController = TestQuestionController()
                navigationController?.pushViewController(questionController, animated: true)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Завершити", style: .plain, target: self, action: #selector(done))
        
        navigationItem.title = "Результат"
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(resultLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": resultLabel]))
        
        let names = ["1", "2", "3", "4", "5", "6"]
        
        var score = 0
        for question in questionList {
            score += question.selectedAnswerIndex!
        }
        
        let result = names[score % names.count]
        resultLabel.text = "Вітаю, результат \(result)!"
        
    }
    
    func done() {
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
    
}

class QuestionHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Питання"
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

class AnswerCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
    
}

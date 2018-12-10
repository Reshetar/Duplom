//
//  OSLessonsController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/26/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var indexSelectLessonValue: Int?

class OSLessonsController: UITableViewController {

    let cellId = "cellId"
    
    var lessons = [Lesson]()
    
    lazy var InfoSubjectButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Інформація про предмет", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:255,g:255,b:255), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 0
        
        button.addTarget(self, action: #selector(handleInfoSubjectPage), for: .touchUpInside)
        
        return button
    }()
    
    lazy var AttButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Додаткові матеріали предмету", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:255,g:255,b:255), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 0

        button.addTarget(self, action: #selector(handleAttachmentPage), for: .touchUpInside)

        return button
    }()

    lazy var QuestionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Опитування", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:255,g:255,b:255), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 0

        button.addTarget(self, action: #selector(handleQuestionPage), for: .touchUpInside)

        return button
    }()
    
    lazy var ScoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Оцінювання", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:255,g:255,b:255), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 0
        
        button.addTarget(self, action: #selector(handleScorePage), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пройти тест", style: .plain, target: self, action: #selector(handleTest))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Операційні системи"
        
        tableView.contentInset.top = 180
        
        tableView.tableFooterView = UIView()
        
        fetchLesson()
        
        view.addSubview(InfoSubjectButton)
        view.addSubview(AttButton)
        view.addSubview(QuestionButton)
        view.addSubview(ScoreButton)

        setupInfoSubjectButton()
        setupAttButton()
        setupQuestionButton()
        setupScoreButton()
        
    }
    
    func displayErrorLessonOrLabMessage(){
        let errorMessage = UIAlertController(title: "Помилка", message: "Лекція або лабораторна робота на стадії розробки", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton = UIAlertAction(title: "OК", style: UIAlertActionStyle.default, handler: nil)
        
        errorMessage.addAction(okButton)
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    
    @objc func handleAttachmentPage(){
        let newAttachmentPage = AttachmentPage()
        let navController = UINavigationController(rootViewController: newAttachmentPage)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleInfoSubjectPage(){
        let newAttachmentPage = InfoSubjectPage()
        let navController = UINavigationController(rootViewController: newAttachmentPage)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleQuestionPage(){
        let newAttachmentPage = QuestionPage()
        let navController = UINavigationController(rootViewController: newAttachmentPage)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleScorePage(){
        let newAttachmentPage = ScorePage()
        let navController = UINavigationController(rootViewController: newAttachmentPage)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleTest(){
        let newBothTestsController = BothModulesTestController()
        navigationController?.pushViewController(newBothTestsController, animated: true)
    }
    
    func fetchLesson(){
        FIRDatabase.database().reference().child("courses").child("subjects3").child("os").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                let lesson = Lesson()
                lesson.setValuesForKeys(dictionary)
                self.lessons.append(lesson)

                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
            }
        }, withCancel: nil)
    }
    
    func setupInfoSubjectButton() {
        //x,y,width,height
        InfoSubjectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        InfoSubjectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135).isActive = true
        InfoSubjectButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        InfoSubjectButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupAttButton() {
        //x,y,width,height
        AttButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        AttButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        AttButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        AttButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    func setupQuestionButton() {
        //x,y,width,height
        QuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        QuestionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45).isActive = true
        QuestionButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        QuestionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupScoreButton() {
        //x,y,width,height
        ScoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ScoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        ScoreButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        ScoreButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let lesson = lessons[indexPath.row]
        
        
        if lesson.namelesson == "" {
            
            cell.textLabel?.text = lesson.namelab
            
        } else {
            cell.textLabel?.text = lesson.namelesson
        }
        
        return cell
        
    }
    
    @objc func handleCancel (){
        
        let controller = SubjectController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexSelectLessonValue = indexPath.row + 1
        
        let SectionController = OSSectionController()
        navigationController?.pushViewController(SectionController, animated: true)
        
        if indexSelectLessonValue! > 1 {
            self.displayErrorLessonOrLabMessage()
        }
        
    }
    
}





//
//  OSLessonsController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/26/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var myIndex = 0
var itemName: String?
var itemText: String?

class OSLessonsController: UITableViewController {

    let cellId = "cellId"
    
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пройти тест", style: .plain, target: self, action: #selector(handleTest))
        
        navigationItem.title = "Операційні системи"
        
        tableView.register(HeaderLessons.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.sectionHeaderHeight = 50
        
        tableView.tableFooterView = UIView()
        
        fetchLesson()
        
    }
    
    func handleTest(){
        let newTestQuestionController = TestQuestionController()
        let navController = UINavigationController(rootViewController: newTestQuestionController)
        present(navController, animated: true, completion: nil)
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let lesson = lessons[indexPath.row]
        
        cell.textLabel?.text = lesson.name
        
        return cell
        
    }
    
    func handleCancel (){
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let lesson = lessons[indexPath.row]
        
        myIndex = indexPath.row
        itemName = lesson.name
        itemText = lesson.text
        
        let newOSLessonsController = MoreInfoController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
        
    }
    
}

class HeaderLessons: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Лекції та лабораторні роботи з ОС"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    func setupViews(){
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}


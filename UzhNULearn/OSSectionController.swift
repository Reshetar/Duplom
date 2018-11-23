//
//  OSSectionController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 5/4/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var indexSelectSectionValue: Int?
var textValue: String?
var nameValue: String?

class OSSectionController: UITableViewController {

    let cellId = "cellId"
    
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Розділи"

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        fetchLesson()
        
        tableView.tableFooterView = UIView()
        
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let lesson = lessons[indexPath.row]
        
        if indexSelectLessonValue == 1 {
            
            cell.textLabel?.text = lesson.les1sec
            
        }
        
        return cell
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexSelectSectionValue = indexPath.row + 1
        
        let lesson = lessons[indexPath.row]
        
        if indexSelectSectionValue == 1 {
            
            textValue = lesson.les1text1
            nameValue = lesson.les1sec
            
        }
        
        if indexSelectSectionValue == 2 {
            
            textValue = lesson.les1text2
            nameValue = lesson.les1sec
            
        }
        
        if indexSelectSectionValue == 3 {
            
            textValue = lesson.les1text3
            nameValue = lesson.les1sec
            
        }
        
        if indexSelectSectionValue == 4 {
            
            textValue = lesson.les1text4
            nameValue = lesson.les1sec
            
        }
        
        
        
        let moreInfoController = MoreInfoController()
        navigationController?.pushViewController(moreInfoController, animated: true)
        
    }

}

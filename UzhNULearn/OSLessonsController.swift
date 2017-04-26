//
//  OSLessonsController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/26/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

class OSLessonsController: UITableViewController {

    let cellId = "cellId"
    
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.title = "Операційні системи"
        
        fetchLesson()
        
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
            //print(snapshot)
            
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
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

}

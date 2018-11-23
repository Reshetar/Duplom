//
//  BothModulesTestController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 5/4/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

var indexModulValue = 0

class BothModulesTestController: UITableViewController {

    var modules = [NameModulModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Виберіть модуль теста"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)

        fetchNameMod()
        
        tableView.tableFooterView = UIView()
        
    }

    func fetchNameMod() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("tests").child("os").child("namemodul").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let modul = NameModulModel()
                modul.setValuesForKeys(dictionary)
                self.modules.append(modul)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
            
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modules.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        let modul = modules[indexPath.row]
        
        cell.textLabel?.text = modul.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexModulValue = indexPath.row + 1
            
        if indexModulValue == 1 {
            
            let generalModulController = GeneralModulController()
            
            navigationController?.pushViewController(generalModulController, animated: true)
            
        }
        
        if indexModulValue == 2 {
                
            let FirstModulController = FirstModulTestController()
                
                navigationController?.pushViewController(FirstModulController, animated: true)
                
        }
    }
    
}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Опитування"
        
    }
    
    @objc func handleCancel (){
        
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

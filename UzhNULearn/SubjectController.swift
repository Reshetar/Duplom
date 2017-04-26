//
//  SubjectController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/24/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

class SubjectController: UIViewController {

    lazy var OSButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:255,g:255,b:255)
        button.setTitle("Операційні системи", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:80,g:101,b:161), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleLessonsOSContoller), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r:80,g:101,b:161)

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.title = "Предмети"
        
        view.addSubview(OSButton)
        
        setupOSButton()
        
    }
    
    func handleLessonsOSContoller(){
        let newOSLessonsController = OSLessonsController()
        let navController = UINavigationController(rootViewController: newOSLessonsController)
        present(navController, animated: true, completion: nil)
    }
    
    func setupOSButton() {
        //x,y,width,height
        OSButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        OSButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        OSButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        OSButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    
    func handleCancel (){
        dismiss(animated: true, completion: nil)
    }
    
}

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
    
    lazy var MOAButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:255,g:255,b:255)
        button.setTitle("Мова опису апаратури", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:80,g:101,b:161), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorSubjectMessage), for: .touchUpInside)
        
        return button
    }()
    
    lazy var ZIButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:255,g:255,b:255)
        button.setTitle("Захист інформації", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:80,g:101,b:161), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorSubjectMessage), for: .touchUpInside)
        
        return button
    }()
    
    lazy var ARCButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:255,g:255,b:255)
        button.setTitle("Архітектура комп'ютерів", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:80,g:101,b:161), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorSubjectMessage), for: .touchUpInside)
        
        return button
    }()
    
    lazy var CSButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:255,g:255,b:255)
        button.setTitle("Комп'ютерна схемотехніка", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r:80,g:101,b:161), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorSubjectMessage), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r:80,g:101,b:161)

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.title = "Предмети"
        
        view.addSubview(OSButton)
        view.addSubview(MOAButton)
        view.addSubview(ZIButton)
        view.addSubview(ARCButton)
        view.addSubview(CSButton)
        
        setupOSButton()
        setupMOAButton()
        setupZIButton()
        setupARCButton()
        setupCSButton()
        
    }
    
    @objc func displayErrorSubjectMessage(){
        let errorMessage = UIAlertController(title: "Помилка", message: "Предмет на стадії розробки", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton = UIAlertAction(title: "OК", style: UIAlertActionStyle.default, handler: nil)
        
        errorMessage.addAction(okButton)
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    
    @objc func handleLessonsOSContoller(){
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
    
    func setupMOAButton() {
        //x,y,width,height
        MOAButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        MOAButton.topAnchor.constraint(equalTo: OSButton.bottomAnchor, constant: 20).isActive = true
        MOAButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        MOAButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupZIButton() {
        //x,y,width,height
        ZIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ZIButton.topAnchor.constraint(equalTo: MOAButton.bottomAnchor, constant: 20).isActive = true
        ZIButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        ZIButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupARCButton() {
        //x,y,width,height
        ARCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ARCButton.topAnchor.constraint(equalTo: ZIButton.bottomAnchor, constant: 20).isActive = true
        ARCButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        ARCButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupCSButton() {
        //x,y,width,height
        CSButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        CSButton.topAnchor.constraint(equalTo: ARCButton.bottomAnchor, constant: 20).isActive = true
        CSButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        CSButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    
    @objc func handleCancel (){
        dismiss(animated: true, completion: nil)
    }
    
}

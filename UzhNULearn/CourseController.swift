//
//  ViewController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/17/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

class CourseController: UIViewController {
    
    lazy var Course1Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Курс 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorMessage), for: .touchUpInside)
        
        return button
    }()

    lazy var Course2Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("2-ий курс", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorMessage), for: .touchUpInside)
        
        return button
    }()

    lazy var Course3Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Course 3", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleSubjectContoller), for: .touchUpInside)
        
        return button
    }()

    lazy var Course4Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Course 4", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorMessage), for: .touchUpInside)

        return button
    }()

    lazy var Course5Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Course 5", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(displayErrorMessage), for: .touchUpInside)

        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Вийти", style: .plain, target:self, action: #selector(handleLogout))
        
        //user is not logged in
        checkIfUserIsLoggedIn()
        
        view.addSubview(Course1Button)
        view.addSubview(Course2Button)
        view.addSubview(Course3Button)
        view.addSubview(Course4Button)
        view.addSubview(Course5Button)
        
        setupCourse1Button()
        setupCourse2Button()
        setupCourse3Button()
        setupCourse4Button()
        setupCourse5Button()
        
        
        
    }
    
    func displayErrorMessage(){
        let errorMessage = UIAlertController(title: "Помилка", message: "Курс на стадії розробки", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton = UIAlertAction(title: "OК", style: UIAlertActionStyle.default, handler: nil)
        
        errorMessage.addAction(okButton)
        
        self.present(errorMessage, animated: true, completion: nil)
    }
    
    func handleSubjectContoller(){
        let newSubjectController = SubjectController()
        let navController = UINavigationController(rootViewController: newSubjectController)
        present(navController, animated: true, completion: nil)
    }
    
    func setupCourse1Button() {
        //x,y,width,height
        Course1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course1Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        Course1Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course1Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupCourse2Button() {
        //x,y,width,height
        Course2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course2Button.topAnchor.constraint(equalTo: Course1Button.bottomAnchor, constant: 20).isActive = true
        Course2Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course2Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupCourse3Button() {
        //x,y,width,height
        Course3Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course3Button.topAnchor.constraint(equalTo: Course2Button.bottomAnchor, constant: 20).isActive = true
        Course3Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course3Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupCourse4Button() {
        //x,y,width,height
        Course4Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course4Button.topAnchor.constraint(equalTo: Course3Button.bottomAnchor, constant: 20).isActive = true
        Course4Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course4Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupCourse5Button() {
        //x,y,width,height
        Course5Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course5Button.topAnchor.constraint(equalTo: Course4Button.bottomAnchor, constant: 20).isActive = true
        Course5Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course5Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    
    func checkIfUserIsLoggedIn(){
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserAndSetupNavBarTitle()
        }
    }
    
    func fetchUserAndSetupNavBarTitle(){
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        FIRDatabase.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: {(snapshot) in
            
            if let dictinary = snapshot.value as? [String: AnyObject]{
                self.navigationItem.title = dictinary["name"] as? String
            }
            
        }, withCancel: nil)
    }

    func handleLogout(){
        
        do{
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        loginController.courseController = self
        present(loginController, animated: true, completion: nil)
    }
}



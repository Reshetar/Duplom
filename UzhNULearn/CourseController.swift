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
        button.setTitle("Course 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action: #selector(handleLogout))

        //user is not logged in
        checkIfUserIsLoggedIn()
        
        view.addSubview(Course1Button)
        
        setupCourse1Button()
        
        
    }
    
    func setupCourse1Button() {
        //x,y,width,height
        Course1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Course1Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        Course1Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        Course1Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func checkIfUserIsLoggedIn(){
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                
                if let dictinary = snapshot.value as? [String: AnyObject]{
                    self.navigationItem.title = dictinary["name"] as? String
                }
                
            }, withCancel: nil)
        }
    }

    func handleLogout(){
        
        do{
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}



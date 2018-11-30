//
//  InfoSubjectPage.swift
//  UzhNULearn
//
//  Created by Reshetar Yevhen on 11/29/18.
//  Copyright © 2018 Evgen Reshetar. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class InfoSubjectPage: UIViewController {
    
    var userName = ""
    
    var textView: UITextView = {
        let text = UITextView()
        text.textColor = UIColor.black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 16)

        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Інформація про предмет"
        
        fetchLessonInfo()
        
        print("fff " + userName)
        
        textView.text = textValue

        view.addSubview(textView)

        setupTextLabelView()
        
        
        
    }
    
    func fetchLessonInfo(){

        FIRDatabase.database().reference().child("courses").child("subjects3").child("os").child("part 1").observe(.childAdded, with: { (snapshot) in
        
            if !snapshot.exists() { return }
            
            self.userName = snapshot.value as! String
            
            print(self.userName)
            
        })
        
    }
    
    func setupTextLabelView() {
        //x,y,width,height
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @objc func handleCancel (){
        
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

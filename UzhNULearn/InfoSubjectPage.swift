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
    
    var infoList = ""
    
    var infoTextView: UITextView = {
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
        
        fetchInfo()
        
        view.addSubview(infoTextView)
        
    }
    
    func fetchInfo(){

        FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("info").observe(.childAdded, with: { (snapshot) in
            
            if !snapshot.exists() { return }
            
            let textFromFB = snapshot.value as! String
            self.infoList = textFromFB
            
            self.infoTextView.text = textFromFB
            
            self.setupTextInfoLabelView()
            
        })
    
    }
    
    func setupTextInfoLabelView() {
        //x,y,width,height
        infoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoTextView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @objc func handleCancel (){
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

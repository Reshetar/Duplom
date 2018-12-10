//
//  ScorePage.swift
//  UzhNULearn
//
//  Created by Reshetar Yevhen on 12/7/18.
//  Copyright © 2018 Evgen Reshetar. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ScorePage: UIViewController {
    
    var infoFirstTextView: UITextView = {
        let text = UITextView()
        text.textColor = UIColor.black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 16)

        return text
    }()
    
    var infoSecondTextView: UITextView = {
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
        
        navigationItem.title = "Оцінювання"
        
        fetchScoreInfo()
        
        view.addSubview(infoFirstTextView)
        view.addSubview(infoSecondTextView)
        
    }
    
    func fetchScoreInfo(){

        var firstNumberValue =  ""

        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
    FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("score").child(uid).observe(.childAdded, with: { (snapshot) in

            if snapshot.key == "secondmodul" { return }

            firstNumberValue = snapshot.value as! String

            self.infoFirstTextView.text.append("За перший модуль: \(firstNumberValue) балів\n\n")
            self.infoFirstTextView.text.append("За другий модуль: 75  балів\n\n")
            self.infoFirstTextView.text.append("За проходження загального тесту: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №1: 9 балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №2: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №3: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №4: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №5: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №6: - балів\n\n")
            self.infoFirstTextView.text.append("Лабораторна робота №7: - балів\n\n")
            
            self.setupTextFirstInfoLabelView()
            
        })
    }
    
    func setupTextFirstInfoLabelView() {
        //x,y,width,height
        infoFirstTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoFirstTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoFirstTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoFirstTextView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    
    @objc func handleCancel (){
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}


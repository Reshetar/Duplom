//
//  MoreInfoController.swift
//  UzhNULearn
//
//  Created by Evgen Reshetar on 4/29/17.
//  Copyright © 2017 Evgen Reshetar. All rights reserved.
//

import UIKit

class MoreInfoController: UIViewController {

    var textView: UITextView = {
       let text = UITextView()
        text.textColor = UIColor.black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 16)
        
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.title = itemName
        
        textView.text = itemText
        
        view.addSubview(textView)
        
        setupTextLabelView()
        
        
    }
    
    func setupTextLabelView() {
        //x,y,width,height
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        textView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func handleCancel (){
        dismiss(animated: true, completion: nil)
    }
 
}

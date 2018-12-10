//
//  AttachmentPage.swift
//  UzhNULearn
//
//  Created by Reshetar Yevhen on 10/25/18.
//  Copyright © 2018 Evgen Reshetar. All rights reserved.
//

import UIKit
import Firebase

class AttachmentPage: UITableViewController {
    
    let cellId = "cellId"
    
    var files = [Files]()
    
    var imageReference: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Додаткові матеріали"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target:self, action: #selector(handleCancel))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        tableView.register(FileCell.self, forCellReuseIdentifier: cellId)
        
        fetchFiles()
        
    }
    
    func fetchFiles() {
        FIRDatabase.database().reference().child("courses").child("subjects3").child("other").child("os").child("files").observe(.childAdded, with: { (snapshot ) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let file = Files()
                file.setValuesForKeys(dictionary)
                self.files.append(file)
                
                self.tableView.reloadData()
            }
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let file = files[indexPath.row]
        cell.textLabel?.text = file.name
        cell.detailTextLabel?.text = file.type
        
        cell.imageView?.image = UIImage(named: "logo")
        
        if let fileImageUrl = file.imageUrl {
            
            let downloadImageRef = imageReference.child(file.filename!)
            
            let downloadtask = downloadImageRef.data(withMaxSize: 1024 * 1024 * 12) { data, error in
                
                cell.imageView?.image = UIImage(data: data!)
                
            }
            
        }
        
        return cell
        
    }
    
    @objc func handleCancel (){
        let controller = OSLessonsController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

class FileCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




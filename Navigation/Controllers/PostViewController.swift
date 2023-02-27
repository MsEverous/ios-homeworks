//
//  PostViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 16.12.2022.
//

import UIKit

class PostViewController: UIViewController {
  
    var titlePost: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostController()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(saveProfile)), animated: true)
    }
}

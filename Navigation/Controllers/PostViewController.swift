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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

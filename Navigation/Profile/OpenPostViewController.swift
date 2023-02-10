//
//  OpenPostViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 10.02.2023.
//

import UIKit

class OpenPostViewController: UIViewController {
    var postIndex = 0
    
    private lazy var image: UIImage = {
       let img = UIImage()
        return img
    }()
    
    private lazy var exitButton: UIButton = {
        var button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .white
//        button.addTarget(self, action: #selector(returnProfileView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    lazy var newButton:UIButton = {
        var button = UIButton()
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = .lightGray
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(newButton)
        
        NSLayoutConstraint.activate(
                    [profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                     profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                     profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                     profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
                    
                     newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                     newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                     newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
            }
    }
    
 

//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

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
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
        NSLayoutConstraint.activate(
            [profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
             profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
          // profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
    }
}

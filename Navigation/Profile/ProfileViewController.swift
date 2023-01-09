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
        let profileHeaderViewConstraints = profileHeaderViewConstraints()
        NSLayoutConstraint.activate(profileHeaderViewConstraints)
    }

    private func profileHeaderViewConstraints() -> ([NSLayoutConstraint]) {
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        return ([topConstraint, leadingConstraint, trailingConstraint])
    }
}

//
//  ProfilesPhotosViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 18.02.2023.
//

import UIKit

class ProfilesPhotosViewController: UIViewController {
    var name: String?

   private lazy var image: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.isHidden = false
        let imgName = name
        image.image = UIImage(named: imgName ?? "")
        view.addSubview(image)

        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
}

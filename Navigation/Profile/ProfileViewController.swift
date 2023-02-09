//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = false
        self.view.addSubview(self.tableView)
   
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: -UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
           2
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         section == 0 ? 1 : postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return PhotosTableViewCell()
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { fatalError() }
            cell.setupPost(indexPath.row)
            return cell
        }
    }
    
    //MARK: -UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        section == 0 ? ProfileHeaderView() : nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    } //Открытие галереи при нажатии на фото

}
    
//    private lazy var profileHeaderView: ProfileHeaderView = {
//        let profileHeaderView = ProfileHeaderView()
//        profileHeaderView.backgroundColor = .lightGray
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        return profileHeaderView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .lightGray
//        self.navigationItem.title = "Profile"
//        navigationController?.navigationBar.isHidden = false
//        self.view.addSubview(profileHeaderView)
//
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        NSLayoutConstraint.activate(
//            [profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//             profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//             profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
//          // profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//    }

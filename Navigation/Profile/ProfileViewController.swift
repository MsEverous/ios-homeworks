//
//  ProfileViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "My cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var postArray = [Post(author: "Netflix.official", description: "«Элита» — испанский веб-сериал, премьера которого состоялась 5 октября 2018 года на Netflix. Сериал был создан Карлосом Монтеро и Дарио Мадрона.", image: "Elit", likes: 500, views: 587),
        Post(author: "Netflix.official", description: "Половое воспитание» британский комедийно-драматический телесериал, рассказывающий о проблемах учащихся средней школы английского городка Мурдэйл.", image: "Sex education", likes: 748, views: 900),
        Post(author: "Netflix.official", description: "«Ты» — американский драматический сериал с элементами триллера по мотивам книг , разработанный Грегом Берланти и Серой Гэмбл, и спродюсированный студией Warner Bros.", image: "You", likes: 1000, views: 1000),
        Post(author: "Netflix.official", description: "«13 причи́н почему́» — американский драматический телесериал, основанный на одноимённом романе Джея Эшера 2007 года. Книга адаптирована для телеэкрана Брайаном Йорки.", image: "11 reason ", likes: 980, views: 1026),
        Post(author: "Netflix.official", description: "Очень странные дела - это остросюжетная фантастика, рассказывающая о невероятных сверхъестественных событиях, происходивших в восьмидесятые годы прошлого столетия. Оригинальный сюжет начинался с исчезновения одного из местных подростков. Троица друзей собирается разыскать друга. К делу подключается и полиция с матерью и братом пропавшего. Главные действующие лица также сталкиваются с загадочной девочкой, что обладает рядом сверхъестественных способностей. ", image: "Strange things", likes: 3675, views: 6790)]
    
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
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
//MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "My cell", for: indexPath) as? PostTableViewCell else { fatalError() }
        let post = self.postArray[indexPath.row]
        cell.setupPost(post: post)
        return cell
    }
    
//MARK: -UITableViewDelegate
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileHeaderView()
  }
    
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


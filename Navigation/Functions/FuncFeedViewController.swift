//
//  FuncFeedViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 17.12.2022.
//

import UIKit

 
extension FeedViewController {
    func setupButton() {
        self.view.addSubview(self.button) //Добавляет кнопку во вью а все снизу настраивает ее положение
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
}
    @objc func buttonAction() {
        let postViewController = PostViewController() //Создаем вью куда будем переходить
        self.navigationController?.pushViewController(postViewController, animated: true) //действие перехода во вью через навигацию
    }
}

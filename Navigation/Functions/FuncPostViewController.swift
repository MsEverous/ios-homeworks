//
//  FuncPostViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 17.12.2022.
//

import UIKit


extension PostViewController {
    
     func setupPostController() {
        view.backgroundColor = .systemYellow
        navigationItem.title = titlePost
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func saveProfile() {
        let infoViewController = InfoViewController() //Создаем вью куда будем переходить
        self.navigationController?.present(infoViewController, animated: true) //действие перехода во вью через навигацию
       }
}

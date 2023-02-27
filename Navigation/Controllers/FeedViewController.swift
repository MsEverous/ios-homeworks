//
//  FeedViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
        
     lazy var button: UIButton = {
         let button = UIButton() //Создаем кнопку
         button.backgroundColor = .green //Задаем цвет кнопки
         button.layer.cornerRadius = 12 //Скругляем кнопку
         button.setTitle("Перейти на пост", for: .normal) //Надпись внутри кнопки
         button.setTitleColor(.lightGray, for: .normal) //Цвет надписи кнопки
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24) //Толщина и размер кнопки
         button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside) //Добавляем кнопке действие
         button.translatesAutoresizingMaskIntoConstraints = false //Отключаем констрейнты
         return button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupButton()
        buttonAction()
    }
}

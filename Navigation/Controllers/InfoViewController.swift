//
//  InfoViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 16.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system) //Создаем кнопку
        button.backgroundColor = .green //Задаем цвет кнопки
        button.layer.cornerRadius = 12 //Скругляем кнопку
        button.setTitle("Редактировать пост", for: .normal) //Надпись внутри кнопки
        button.setTitleColor(.lightGray, for: .normal) //Цвет надписи кнопки
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24) //Толщина и размер кнопки
        button.translatesAutoresizingMaskIntoConstraints = false 
        button.addTarget(self, action: #selector(createAllertController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.view.addSubview(button)
        setupButton()
    }
}

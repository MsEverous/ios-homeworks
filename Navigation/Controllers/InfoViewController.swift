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
        button.translatesAutoresizingMaskIntoConstraints = false //Отключаем констрейнты
//        button.constraints //Дописать констрейн
        button.addTarget(self, action: #selector(createAllertController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.view.addSubview(button)
        setupButton()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

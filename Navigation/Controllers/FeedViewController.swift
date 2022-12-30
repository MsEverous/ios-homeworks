//
//  FeedViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 15.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
         var title: String
     }
     var post = Post(title: "Мои посты")
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

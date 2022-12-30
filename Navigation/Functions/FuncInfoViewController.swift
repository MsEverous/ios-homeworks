//
//  FuncInfoViewController.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 19.12.2022.
//

import UIKit

extension InfoViewController {
    
    func setupButton() {
           self.view.addSubview(self.button) //Добавляет кнопку во вью а все снизу настраивает ее положение
           self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300).isActive = true
           self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
           self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
           self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
       }
    
    @objc func createAllertController() {
        let alert = UIAlertController(title: "Редактировать", message: "Что вы хотите сделать?", preferredStyle: .alert)
        let edit = UIAlertAction(title: "Редактировать", style: .default) { action in
            print("Пост будет отредактирован")
        }
        let delet = UIAlertAction(title: "Удалить", style: .cancel) { action in
            print("Пост удален")
        }
        alert.addAction(edit)
        alert.addAction(delet)
        self.present(alert, animated: true)
    }
}

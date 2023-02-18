//
//  FuncLoginViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 03.02.2023.
//

import UIKit

extension LogInViewController {
    @objc func buttonPressed() {
        let checkTextFields = checkTextFields()
        if checkTextFields {
            let profileViewController = ProfileViewController() //Создаем вью куда будем переходить
            self.navigationController?.pushViewController(profileViewController, animated: true) //действие перехода во вью через навигацию
            }
    }
    
    func checkTextFields() -> Bool {
        if emailField.text == ""  {
            UIView.animate(withDuration: 0.5, delay: 0.3) {
                self.emailField.backgroundColor = UIColor(named: "errorFieldColor")
                self.emailField.shake()
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.3) {
                self.emailField.backgroundColor = .clear
            }}
        return false
        } else if passwordField.text == "" {
            UIView.animate(withDuration: 0.5, delay: 0.3) {
                self.passwordField.backgroundColor = UIColor(named: "errorFieldColor")
                self.passwordField.shake()
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.3) {
                self.passwordField.backgroundColor = .clear
            }}
        return false
        } else if passwordField.text != "" && !checkCountSymbolsPassword() {
            return false
        } else if !checkCorrectData() {
            return false
        }
    return true
} 
    
    func checkCountSymbolsPassword() -> Bool {
        lazy var minCount: Int = 6
        lazy var countSymbols: Int = passwordField.text!.count
        if countSymbols < minCount {
            UIView.animate(withDuration: 1, delay: 0.1) {
                self.errorPassword.text = "Не менее 6 символов"
                self.errorPassword.isHidden = false
                self.passwordField.rightView = self.errorPassword
                self.passwordField.shake()
                self.passwordField.backgroundColor = UIColor(named: "errorFieldColor")
            } completion: { _ in
                UIView.animate(withDuration: 1, delay: 0.1) {
                    self.errorPassword.isHidden = true
                    self.passwordField.backgroundColor = .clear
                }
            }
            return false
        }
        return true
    } //Проверка на количество символов
    
    func checkCorrectData() -> Bool {
        if emailField.text != "" && emailField.text != "la@ma.ru" {
            UIView.animate(withDuration: 1, delay: 0.3) {
                let alert = UIAlertController(title: "Неверный email", message: "А это верный: la@ma.ru", preferredStyle: .alert)
                let choice = UIAlertAction(title: "Я понял👌", style: .cancel)
                alert.addAction(choice)
                self.present(alert, animated: true)
            }
            return false
        } else if passwordField.text != "" && passwordField.text != "123456" {
            UIView.animate(withDuration: 1, delay: 0.3) {
                let alert = UIAlertController(title: "Неверный пароль", message: "Твой пароль 123456", preferredStyle: .alert)
                let choice = UIAlertAction(title: "Принято🫡", style: .cancel)
                alert.addAction(choice)
                self.present(alert, animated: true)
            }
            return false
        }
        return true
    } //Проверка на правильность введенных данных
}

extension UITextField {
      func shake() {
          let shakeAnimation = CABasicAnimation(keyPath: "position")
          shakeAnimation.duration = 0.05
          shakeAnimation.repeatCount = 6
          shakeAnimation.autoreverses = true
          shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
          shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
          layer.add(shakeAnimation, forKey: "position")
      }
  }


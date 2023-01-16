//
//  LogInViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 13.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
   private lazy var logoViewImage: UIImageView = {
        var logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()

    private lazy var emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email or phone"
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:0))
        emailField.leftViewMode = .always
        emailField.textColor = .black
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.borderWidth = 0.5
        emailField.layer.cornerRadius = 10
        emailField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] //Замаскированные углы
        emailField.autocapitalizationType = .none //Указывает, что нет автоматической заглавной буквы текста.
        emailField.keyboardType = .emailAddress //Определяют тип клавиатуры для отображения текстового представления
        return emailField
    }()
    
    private lazy var passwordField: UITextField = {
        var password = UITextField()
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        password.leftViewMode = .always
        password.placeholder = "Passowrd"
        emailField.textColor = .black
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.autocapitalizationType = .none
        password.isSecureTextEntry = true
        return password
    }()
    
    private lazy var entryProfileButton: UIButton = {
        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor(named: "vk_blue")
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log in", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(entryProfile), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        scrollView.keyboardDismissMode = .interactive //как система отключает клавиатуру при начале перетаскивания в режиме прокрутки.
        self.view.addSubview(scrollView)
        scrollView.addSubview(logoViewImage)
        scrollView.addSubview(stackView)
        scrollView.addSubview(entryProfileButton)
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeybordEvent()
    }
    
    override func viewDidDisappear (_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //Вызов клавиатуры на симуляторе
    private func subscribeKeybordEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keybordWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
    }
    
    @objc private func keybordWillHide(_ notification: NSNotification) {
        self.scrollView.contentInset = .zero
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [logoViewImage.widthAnchor.constraint(equalToConstant: 100),
             logoViewImage.heightAnchor.constraint(equalToConstant: 100),
             logoViewImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
             logoViewImage.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 120),
             
             scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
             scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
             
             stackView.topAnchor.constraint(equalTo: logoViewImage.bottomAnchor, constant: 120),
             stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
             stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
             stackView.heightAnchor.constraint(equalToConstant: 100),

             entryProfileButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
             entryProfileButton.heightAnchor.constraint(equalToConstant: 50),
             entryProfileButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
             entryProfileButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
             ])
    }

    @objc func entryProfile() {
        let profileViewController = ProfileViewController() //Создаем вью куда будем переходить
        self.navigationController?.pushViewController(profileViewController, animated: true) //действие перехода во вью через навигацию
    }
}

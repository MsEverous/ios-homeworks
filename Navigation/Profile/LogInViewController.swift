//
//  LogInViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 13.01.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
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
    
    private lazy var contentView: UIView = {
        let contetView = UIView()
        contetView.backgroundColor = .white
        contetView.translatesAutoresizingMaskIntoConstraints = false
        return contetView
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var emailField: UITextField = {
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
        emailField.delegate = self
//        emailField.rightViewMode = .always
//        emailField.rightView = errorEmail
        return emailField
    }()
    
    lazy var passwordField: UITextField = {
        var password = UITextField()
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        password.leftViewMode = .always
        password.placeholder = "Passowrd"
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.delegate = self
        password.rightViewMode = .always
        password.rightView = errorPassword
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
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
//    private lazy var errorEmail: UILabel = {
//        let error = UILabel()
//        error.text = "Неверный email"
//        error.textColor = .red
//        error.isHidden = false
//        return error
//    }()
//
     lazy var errorPassword: UILabel = {
        let error = UILabel()
        error.textColor = .red
        error.font = UIFont.systemFont(ofSize: 15)
//        error.text = ""
        error.isHidden = true
        return error
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        scrollView.keyboardDismissMode = .interactive //как система отключает клавиатуру при начале перетаскивания в режиме прокрутки.
        hideKeyboardWhenTappedAround() //Функция чтобы клавиатура убиралась
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoViewImage)
        contentView.addSubview(stackView)
        contentView.addSubview(entryProfileButton)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
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
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Констрейнты
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoViewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoViewImage.widthAnchor.constraint(equalToConstant: 100),
            logoViewImage.heightAnchor.constraint(equalToConstant: 100),
            logoViewImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoViewImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            emailField.topAnchor.constraint(equalTo: stackView.topAnchor),
            emailField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            passwordField.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            entryProfileButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            entryProfileButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            entryProfileButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            entryProfileButton.heightAnchor.constraint(equalToConstant: 50),
            entryProfileButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//
//            errorPassword.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
//            errorPassword.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        ])
        }
    
}

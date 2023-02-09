//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лариса Терегулова on 28.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private var profileViewController = ProfileViewController()
    
    private var statusText: String = "Waiting for something...."
    
    //УСТАНОВКА ЭЛЕМЕНТОВ
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3 //Ширина рамки
        imageView.layer.borderColor = UIColor.white.cgColor //Цвет рамки
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Avatar")
        imageView.layer.cornerRadius = avatarSize/2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animationOfAvatar)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Cut seal"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        var statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something...."
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        var statusTextField = UITextField()
        statusTextField.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: 10, height: self.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.textColor = .black
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private var animationView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100))
        view.alpha = 0
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var exitButton: UIButton = {
        var button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(returnProfileView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonPressed() {
               statusLabel.text = statusText
       }
       
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? statusText
    }
    
    private lazy var avatarCenter = avatarImageView.center
    private lazy var avatarBounds = avatarImageView.layer.bounds
    private lazy var tabBar = ((superview as? UITableView)?.dataSource as? UIViewController)?.tabBarController?.tabBar
    private lazy var avatarSize = CGFloat(220 - 3 * 16 - 50.0)
  
       
    @objc func animationOfAvatar() {
        avatarCenter = avatarImageView.center
        avatarBounds = avatarImageView.bounds
        UIView.animate(withDuration: 0.5) { [self] in
            animationView.alpha = 0.8
            avatarImageView.layer.borderWidth = 0
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.center = animationView.center
            avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            tabBar?.frame.origin.y = UIScreen.main.bounds.height
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) { [self] in
                exitButton.alpha = 1
                }
            }
    }
    
    @objc func returnProfileView() {
        UIView.animate(withDuration: 0.3) { [self] in
            exitButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
            animationView.alpha = 0
            avatarImageView.layer.borderWidth = 2
            avatarImageView.layer.cornerRadius = avatarSize / 2
            avatarImageView.center = avatarCenter
            avatarImageView.bounds = avatarBounds
                tabBar?.isHidden = false
            if let bar = tabBar {
                bar.frame.origin.y = UIScreen.main.bounds.height - bar.frame.height
                }
            }
        }
    }
    
//УСТАНОВКА НА ЭКРАН
    
    private func setupView() {
        self.backgroundColor = .systemGray6
        
        self.addSubview(fullNameLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(animationView)
        self.addSubview(avatarImageView)
        self.addSubview(exitButton)

        //Установка констрейнтов
        NSLayoutConstraint.activate(
            [avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
             avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
             avatarImageView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.3),
             avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor),
             
             fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor), //Сверху
             fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 32),
             fullNameLabel.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 0.3),
             fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
             
             statusTextField.heightAnchor.constraint(equalToConstant: 40),
             statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
             statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
             statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

             setStatusButton.heightAnchor.constraint(equalToConstant: 50),
             setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
             setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 32),
            statusLabel.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 0.3),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -50),
             
            exitButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            exitButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
]
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

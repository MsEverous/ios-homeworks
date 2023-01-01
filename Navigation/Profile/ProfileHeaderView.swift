//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лариса Терегулова on 28.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    //УСТАНОВКА ЭЛЕМЕНТОВ
    lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3 //Ширина рамки
        imageView.layer.borderColor = UIColor.white.cgColor //Цвет рамки
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
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
    
    lazy var button: UIButton = {
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
    
    @objc func buttonPressed() {
        if statusLabel.text != nil {
            print(statusLabel.text!)
        }
        
    }
    
    // УСТАНОВКА КОНСТРЕЙНТОВ
    private func avatarConstraints() -> ([NSLayoutConstraint]) {
        let topConstraint = avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingConstraint = avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let widthConstraint = avatar.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.3)
        let heightConstraint = avatar.heightAnchor.constraint(equalTo: self.avatar.widthAnchor)
        return [topConstraint, leadingConstraint, widthConstraint, heightConstraint]
    }
    
    private func nameLabelConstraints() -> ([NSLayoutConstraint]) {
        let topConstraint = self.nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor) //Сверху
        let leadingConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 32)
        let heightConstraint = self.nameLabel.heightAnchor.constraint(equalTo: avatar.heightAnchor, multiplier: 0.3)
        let trailingConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        return [topConstraint, leadingConstraint, heightConstraint, trailingConstraint]
    }
    
    private func buttonConstraints() -> ([NSLayoutConstraint]) {
        let topConstraint = self.button.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16)
        let leadingConstraint = self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let heightConstraint = self.button.heightAnchor.constraint(equalToConstant: 50)
        let trailingConstraint = self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        return [topConstraint, leadingConstraint, heightConstraint, trailingConstraint]
    }
    
    private func statusLabelConstraints() -> ([NSLayoutConstraint]) {
//        let topConstraint = self.statusLabel.topAnchor.constraint(equalTo: avatar.topAnchor) //Сверху
        let leadingConstraint = self.statusLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 32)
        let heightConstraint = self.statusLabel.heightAnchor.constraint(equalTo: avatar.heightAnchor, multiplier: 0.3)
        let trailingConstraint = self.statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottomConstraint = self.statusLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34)
        return [leadingConstraint, heightConstraint, trailingConstraint, bottomConstraint]
    }
    

//УСТАНОВКА НА ЭКРАН
    
    private func setupView() {
        self.backgroundColor = .darkGray
        self.addSubview(avatar)
        self.addSubview(nameLabel)
        self.addSubview(button)
        self.addSubview(statusLabel)
        buttonPressed()
        
        let avatarConstraints = avatarConstraints()
        let nameLabelConstraints = nameLabelConstraints()
        let buttonConstraints = buttonConstraints()
        let statusLabelConstraints = statusLabelConstraints()
        NSLayoutConstraint.activate(avatarConstraints + nameLabelConstraints + buttonConstraints + statusLabelConstraints)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatar.layer.cornerRadius = self.avatar.frame.height/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

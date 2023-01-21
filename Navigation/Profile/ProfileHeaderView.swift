import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = "Waiting for something...."
    
    //УСТАНОВКА ЭЛЕМЕНТОВ
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3 //Ширина рамки
        imageView.layer.borderColor = UIColor.white.cgColor //Цвет рамки
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Avatar")
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
    
    @objc func buttonPressed() {
            statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? statusText
    }
    
//УСТАНОВКА НА ЭКРАН
    
    private func setupView() {
        self.backgroundColor = .lightGray
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        buttonPressed()
  
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
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -50)]
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

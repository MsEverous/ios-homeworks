//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Лариса Терегулова on 20.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var cellAuthor: UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    var cellDescription: UILabel = {
       let description = UILabel()
        description.font = .systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    var cellImage: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var cellLikes: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = .systemFont(ofSize: 16)
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    var cellViews: UILabel = {
        let views = UILabel()
        views.font = .systemFont(ofSize: 16)
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    func addSubviews() {
        self.contentView.addSubview(cellAuthor)
        self.contentView.addSubview(cellImage)
        self.contentView.addSubview(cellDescription)
        self.contentView.addSubview(cellLikes)
        self.contentView.addSubview(cellViews)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            cellAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cellAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellImage.topAnchor.constraint(equalTo: cellAuthor.bottomAnchor, constant: 16),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImage.heightAnchor.constraint(equalTo: cellImage.widthAnchor),

            cellDescription.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 16),
            cellDescription.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),
            cellDescription.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),

            cellLikes.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: 16),
            cellLikes.leadingAnchor.constraint(equalTo: cellAuthor.leadingAnchor),

            cellViews.topAnchor.constraint(equalTo: cellLikes.topAnchor),
            cellViews.trailingAnchor.constraint(equalTo: cellAuthor.trailingAnchor),
            cellViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -16),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPost(post: Post) {
        cellAuthor.text = post.author
        cellImage.image = UIImage(named: post.image)
        cellDescription.text = post.description
        cellLikes.text = "Likes:\(post.likes)"
        cellViews.text = "Views: \(post.views)"
    }
}

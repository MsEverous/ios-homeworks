//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Лариса Терегулова on 23.01.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(systemName: "arrow.forward")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var layoutPhotosCollectionView: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let photos = UICollectionView(frame: .zero, collectionViewLayout: layoutPhotosCollectionView)
        photos.dataSource = self
        photos.delegate = self
        photos.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        photos.translatesAutoresizingMaskIntoConstraints = false
        return photos
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(photosCollectionView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            icon.centerYAnchor.constraint(equalTo: label.centerYAnchor),
        
            photosCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosCollectionView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
            ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       20
    } //Количество фоток
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.setup(image: "\(indexPath.row + 1)")
        cell.clipsToBounds = true
        return cell
    }
    
    //MARK: -UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4 - 8, height: (collectionView.frame.width / 4 - 8) / 1.5)
    } //Функция чтобы задать размер фоточек
}

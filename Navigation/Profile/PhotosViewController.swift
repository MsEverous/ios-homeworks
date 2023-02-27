//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 24.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let animationView: UIView = {
        var animationView = UIView()
        animationView.backgroundColor = .white
        animationView.alpha = 0
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    private lazy var animationImage: UIImageView = {
        var animationImage = UIImageView()
        animationImage.clipsToBounds = true
        animationImage.contentMode = .scaleAspectFill
        animationImage.alpha = 0.0
        animationImage.translatesAutoresizingMaskIntoConstraints = false
        return animationImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photos Gallery"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeImg))
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        self.view.addSubview(collectionView)
        self.view.addSubview(animationView)
        self.view.addSubview(animationImage)

        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.animationImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.animationImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.animationImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.animationImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.animationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.animationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.animationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.animationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    @objc func closeImg() {
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationItem.title = "Photos Gallery"
        navigationItem.hidesBackButton = false
        UIView.animate(withDuration: 0.5) { [self] in
            animationImage.alpha = 0
            animationView.alpha = 0
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.setup(image: "\(indexPath.row + 1)")
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let imgWH = (collectionView.frame.width - 4 * 12) / 3
            return CGSize(width: imgWH, height: imgWH)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            12
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animationImage.image = UIImage(named: "\(indexPath.row + 1)")
        navigationItem.rightBarButtonItem?.isHidden = false
        navigationItem.title = ""
        navigationItem.hidesBackButton = true
        UIView.animate(withDuration: 0.5) { [self] in
            animationImage.alpha = 1
            animationView.alpha = 1
        }
    }
}



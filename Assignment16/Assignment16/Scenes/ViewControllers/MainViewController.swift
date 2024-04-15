//
//  ViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import UIKit

protocol ReceiveDataDelegate {
    func receive(post: PostInfoModel)
}

class MainViewController: UIViewController, ReceiveDataDelegate {
    
    func receive(post: PostInfoModel) {
        posts.append(post)
        collectionView.reloadData()
    }
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "DefaultBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("ახალი პერსონაჟის დამატება", for: .normal)
        addButton.layer.cornerRadius = 23
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupCollectionView()
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(collectionView)
        view.addSubview(addButton)

        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.heightAnchor.constraint(equalToConstant: 448),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            addButton.heightAnchor.constraint(equalToConstant: 48),
        ])

    }
    
    @objc func addNewCard() {
        let addNewCardViewController = AddNewCardViewController()
        addNewCardViewController.delegate = self
        navigationController?.pushViewController(addNewCardViewController, animated: true)
    }
    
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.configure(image: posts[indexPath.row].icon)
        cell.configure(title: posts[indexPath.row].title) 
        cell.configure(description: posts[indexPath.row].description)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 32, height: 192)
    }
}

//extension MainViewController: UICollectionViewDelegate {
//}




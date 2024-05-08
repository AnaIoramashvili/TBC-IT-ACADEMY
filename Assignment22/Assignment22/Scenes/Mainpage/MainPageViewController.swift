//
//  MainPageViewController.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//


import UIKit

class MainPageViewController: UIViewController {
    
    private var viewModel = MainPageViewModel()
    private var photos = [Photo]()
    
    private var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainPageCell.self, forCellWithReuseIdentifier: MainPageCell.identifier)
        return collectionView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "გალერეა"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationTitle()
        setupUI()
        
        viewModel.delegate = self
        viewModel.fetchPhotos()
    }
    
    private func navigationTitle() {
        navigationItem.titleView = titleLabel
    }
    
    private func setupUI() {
        view.addSubview(photosCollectionView)
        view.backgroundColor = .systemBackground

        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self

        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}

extension MainPageViewController: MainPageViewModelDelegate {
    func didFetchPhotos(_ photos: [Photo]) {
        self.photos = photos
        photosCollectionView.reloadData()
    }

    func didFailFetchingPhotos(_ error: Error) {
        print("Failed to fetch photos: \(error.localizedDescription)")
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCell.identifier, for: indexPath) as! MainPageCell
        let photo = photos[indexPath.item]
        if let url = URL(string: photo.urls.regular) {
            cell.configure(with: url)
        }
        return cell
    }
}


extension MainPageViewController: UICollectionViewDelegate {

}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var Width: CGFloat = collectionView.frame.width/3 - 1
        if UIDevice.current.orientation.isLandscape {
            Width = collectionView.frame.width/6 - 1
        }
        return CGSize(width: Width, height: Width)
    }
}

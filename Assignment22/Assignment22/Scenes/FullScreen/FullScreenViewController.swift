//
//  FullScreenViewController.swift
//  Assignment22
//
//  Created by Ana on 5/9/24.
//


import UIKit

final class FullScreenViewController: UIViewController {
    
    private var photos: [Photo]
    private var startIndex: Int
    private var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.register(FullScreenCell.self, forCellWithReuseIdentifier: FullScreenCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(photos: [Photo], startIndex: Int) {
        self.photos = photos
        self.startIndex = startIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupCollectionView()
        createSnapshot()
        collectionView.scrollToItem(at: IndexPath(item: startIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        dataSource = UICollectionViewDiffableDataSource<Int, Photo>(collectionView: collectionView) { collectionView, indexPath, photo in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenCell.identifier, for: indexPath) as? FullScreenCell else {
                fatalError("Cell can not be created")
            }
            cell.configure(with: URL(string: photo.urls.regular))
            return cell
        }
    }
    
    func createSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
        snapshot.appendSections([0])
        snapshot.appendItems(photos)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension FullScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

//
//  MainPageViewController.swift
//  Assignment22
//
//  Created by Ana on 5/8/24.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: MainPageViewModel
    var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    var photos = [Photo]()
    
    private var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initialization
    
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationTitle()
        setupUI()
        
        viewModel.delegate = self
        viewModel.fetchPhotos()
    }
    
    // MARK: - Navigation Title
    
    private func navigationTitle() {
        navigationItem.titleView = titleLabel
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(photosCollectionView)
        photosCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        dataSource = UICollectionViewDiffableDataSource<Int, Photo>(collectionView: photosCollectionView) { collectionView, indexPath, photo in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCell.identifier, for: indexPath) as! MainPageCell
            cell.configure(with: URL(string: photo.urls.regular))
            return cell
        }
    }
}

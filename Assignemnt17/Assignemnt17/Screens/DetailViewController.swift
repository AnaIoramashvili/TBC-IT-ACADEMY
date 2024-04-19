//
//  DetailViewController.swift
//  Assignemnt17
//
//  Created by Ana on 4/19/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    var selectedNewsItem: [String: Any]? 
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO-Regular", size: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO-Bold", size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateData()
        
        title = "Details"
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(timeLabel)
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            timeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            titleLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    
    // MARK: - Populate Data
    private func populateData() {
        if let selectedNewsItem = selectedNewsItem,
           let imageUrlString = selectedNewsItem["PhotoUrl"] as? String,
           let imageUrl = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }.resume()
        }
        
        if let title = selectedNewsItem?["Title"] as? String {
            titleLabel.text = title
        }
        
        if let time = selectedNewsItem?["Time"] as? String {
            timeLabel.text = time
        }
    }
}

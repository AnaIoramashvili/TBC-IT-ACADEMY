//
//  DetailViewController.swift
//  Assignment18
//
//  Created by Ana on 4/22/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var flagImage: UIImage?
    var flagDescription: String?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var flagImageContainer: UIView = {
          let containerView = UIView()
          containerView.translatesAutoresizingMaskIntoConstraints = false
          containerView.layer.shadowColor = UIColor.black.cgColor
          containerView.layer.shadowOpacity = 0.5
          containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
          containerView.layer.shadowRadius = 4
          containerView.layer.cornerRadius = 30
          return containerView
      }()
    
    lazy var aboutFlagLabel: UILabel = {
        let label = UILabel()
        label.text = "About the flag:"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(flagImageContainer)
        flagImageContainer.addSubview(flagImageView)
        contentView.addSubview(aboutFlagLabel)
        contentView.addSubview(descriptionLabel)
        
        if let flagImage = flagImage {
            flagImageView.image = flagImage
        }
        
        if let flagDescription = flagDescription {
            descriptionLabel.text = flagDescription
        } else {
            descriptionLabel.text = "Description not available"
        }
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -60),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, multiplier: 1.1),
            
            flagImageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            flagImageContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            flagImageContainer.widthAnchor.constraint(equalToConstant: 343),
            flagImageContainer.heightAnchor.constraint(equalToConstant: 228),
                        
            
            flagImageView.topAnchor.constraint(equalTo: flagImageContainer.topAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: flagImageContainer.leadingAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: flagImageContainer.trailingAnchor),
            flagImageView.bottomAnchor.constraint(equalTo: flagImageContainer.bottomAnchor),
            
            
            aboutFlagLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            aboutFlagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: aboutFlagLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
        ])
    }
}


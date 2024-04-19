//
//  NewsFeedCell.swift
//  Assignemnt17
//
//  Created by Ana on 4/19/24.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    static let identifier = "NewsFeedCell"
    
    // MARK: - UI Components
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "macBook")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var backColorView: UIView = {
        let backColorView = UIView()
        backColorView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        backColorView.translatesAutoresizingMaskIntoConstraints = false
        return backColorView
    }()
    
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(rectangleView)
        rectangleView.addSubview(newsImageView)
        newsImageView.addSubview(backColorView)
        backColorView.addSubview(titleLabel)
        backColorView.addSubview(timeLabel)
        
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            backColorView.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            backColorView.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor),
            backColorView.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor),
            backColorView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor),

            
            newsImageView.topAnchor.constraint(equalTo: rectangleView.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.centerXAnchor.constraint(equalTo: backColorView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backColorView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backColorView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: backColorView.trailingAnchor, constant: -16),
            
            timeLabel.centerXAnchor.constraint(equalTo: backColorView.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5)

        ])
    }
    
    
}

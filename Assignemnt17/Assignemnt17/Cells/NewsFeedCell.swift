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
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(rectangleView)
        rectangleView.addSubview(titleLabel)
        rectangleView.addSubview(timeLabel)
        rectangleView.addSubview(newsImageView)

        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -8),
            
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 8),
            timeLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -8),
            timeLabel.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -8),
            
            newsImageView.topAnchor.constraint(equalTo: rectangleView.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
//            newsImageView.heightAnchor.constraint(equalTo: rectangleView.heightAnchor, multiplier: 0.1),


        ])
    }
    
    // MARK: - Configure Cell
    func configure(with image: UIImage?, title: String, time: String) {
        newsImageView.image = image
        titleLabel.text = title
        timeLabel.text = time
    }
}

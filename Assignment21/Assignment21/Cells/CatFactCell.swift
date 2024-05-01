//
//  CatFactCell.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import UIKit

class CatFactCell: UITableViewCell {
    
    static let identifier = "CatFactCell"
    
    // MARK: - UI Components
    
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var catImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var factLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        rectangleView.addSubview(catImage)
        rectangleView.addSubview(factLabel)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            rectangleView.heightAnchor.constraint(equalToConstant: 100),
        
            catImage.topAnchor.constraint(equalTo: rectangleView.topAnchor),
            catImage.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor),
            catImage.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor),
            catImage.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor),
            
            factLabel.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 8),
            factLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 80),
            factLabel.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -80),
            factLabel.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -8),
        ])
    }
    
    // MARK: - Configure Cell
    
    func configure(with catFact: CatFact) {
        catImage.image = UIImage(named: "Image")
        
        factLabel.text = catFact.fact
    }
}

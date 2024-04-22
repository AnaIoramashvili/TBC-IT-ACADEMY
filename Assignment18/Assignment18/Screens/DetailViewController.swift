//
//  DetailViewController.swift
//  Assignment18
//
//  Created by Ana on 4/22/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var flagImage: UIImage?
    var flagDescription: String?
    var regionName: String?
    var capitalName: String?
    var currencySymbol: String?
    var unMember: String?
    var officialName: String?
    var googleMapsLink: String?
    var openStreetMapsLink: String?
    
    // MARK: - Views
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
        label.numberOfLines = 15
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var basicInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "Basic information:"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var officialNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Official Name:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Capital:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Currency:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var regionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Region:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var blankLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var blankLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var blankLabel4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var blankLabel5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    
    lazy var line2View: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var linksLabel: UILabel = {
        let label = UILabel()
        label.text = "Useful links:"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var circle1button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image1"), for: .normal)
        button.addTarget(self, action: #selector(openOpenStreetMaps), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var circle2button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image2"), for: .normal)
        button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(flagImageContainer)
        flagImageContainer.addSubview(flagImageView)
        contentView.addSubview(aboutFlagLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(basicInformationLabel)
        contentView.addSubview(officialNameLabel)
        contentView.addSubview(capitalLabel)
        contentView.addSubview(currencyLabel)
        contentView.addSubview(regionLabel)
        contentView.addSubview(blankLabel1)
        contentView.addSubview(blankLabel3)
        contentView.addSubview(blankLabel4)
        contentView.addSubview(blankLabel5)
        contentView.addSubview(line2View)
        contentView.addSubview(linksLabel)
        contentView.addSubview(circle1button)
        contentView.addSubview(circle2button)

        
        if let flagImage = flagImage {
            flagImageView.image = flagImage
        }
        
        if let flagDescription = flagDescription {
            descriptionLabel.text = flagDescription
        }
        
        if let regionName = regionName {
            regionLabel.text = regionName
        }
        
        if let capitalName = capitalName {
            capitalLabel.text = capitalName
        }
        
        if let currencySymbol = currencySymbol {
            currencyLabel.text = currencySymbol
        }
        
        if let officialName = officialName {
            officialNameLabel.text = officialName
        }
        
        if googleMapsLink != nil {
            circle1button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)
        }
        
        if openStreetMapsLink != nil {
            circle2button.addTarget(self, action: #selector(openOpenStreetMaps), for: .touchUpInside)
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


            aboutFlagLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 25),
            aboutFlagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            descriptionLabel.topAnchor.constraint(equalTo: aboutFlagLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            lineView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            lineView.widthAnchor.constraint(equalToConstant: 312),
            lineView.heightAnchor.constraint(equalToConstant: 1),

            basicInformationLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15),
            basicInformationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            officialNameLabel.topAnchor.constraint(equalTo: basicInformationLabel.bottomAnchor, constant: 8),
            officialNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),


            capitalLabel.topAnchor.constraint(equalTo: officialNameLabel.bottomAnchor, constant: 8),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            currencyLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 8),
            currencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            regionLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 8),
            regionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),


            blankLabel1.topAnchor.constraint(equalTo: basicInformationLabel.bottomAnchor, constant: 8),
            blankLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),


            blankLabel3.topAnchor.constraint(equalTo: officialNameLabel.bottomAnchor, constant: 8),
            blankLabel3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

            blankLabel4.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 8),
            blankLabel4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

            blankLabel5.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 8),
            blankLabel5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

            
            line2View.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 15),
            line2View.widthAnchor.constraint(equalToConstant: 312),
            line2View.heightAnchor.constraint(equalToConstant: 1),
            line2View.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            linksLabel.topAnchor.constraint(equalTo: line2View.bottomAnchor, constant: 15),
            linksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            linksLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            circle1button.topAnchor.constraint(equalTo: linksLabel.bottomAnchor, constant: 15),
            circle1button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            circle1button.widthAnchor.constraint(equalToConstant: 50),
            circle1button.heightAnchor.constraint(equalToConstant: 50),

            circle2button.topAnchor.constraint(equalTo: linksLabel.bottomAnchor, constant: 15),
            circle2button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            circle2button.widthAnchor.constraint(equalToConstant: 50),
            circle2button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Button Actions
extension DetailViewController {
    @objc func openGoogleMaps() {
        if let googleMapsLink = googleMapsLink, let url = URL(string: googleMapsLink) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openOpenStreetMaps() {
        if let openStreetMapsLink = openStreetMapsLink, let url = URL(string: openStreetMapsLink) {
            UIApplication.shared.open(url)
        }
    }
}

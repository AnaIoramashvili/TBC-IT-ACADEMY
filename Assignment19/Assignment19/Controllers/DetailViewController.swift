//
//  DetailViewController.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - ViewModel
    var viewModel: DetailViewModel?
    var country: Country?
    
    // MARK: - UI Components
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
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
        label.textColor = UIColor(named: "labelColor")
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "labelColor")
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
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var officialNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Official Name:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Capital:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Currency:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var regionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Region:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var regionNameBlankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var capitalNameBlankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var currencySymbolBlankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var officialNameBlankLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .right
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
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var circle1button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Image1"), for: .normal)
        button.addTarget(self, action: #selector(openOpenStreetMaps), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var circle2button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Image2"), for: .normal)
        button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureContent()
        addConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Setup UI
    private func setupUI() {
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
        contentView.addSubview(regionNameBlankLabel)
        contentView.addSubview(capitalNameBlankLabel)
        contentView.addSubview(currencySymbolBlankLabel)
        contentView.addSubview(officialNameBlankLabel)
        contentView.addSubview(line2View)
        contentView.addSubview(linksLabel)
        contentView.addSubview(circle1button)
        contentView.addSubview(circle2button)
        
    }
    
    // MARK: - Configure Content
    private func configureContent() {
        guard let viewModel = viewModel else { return }
        
        flagImageView.loadImage(from: URL(string: viewModel.flagImage!)!)
        title = viewModel.flagName
        descriptionLabel.text = viewModel.flagDescription
        regionNameBlankLabel.text = viewModel.regionName
        capitalNameBlankLabel.text = viewModel.capitalName
        currencySymbolBlankLabel.text = viewModel.currencySymbol
        officialNameBlankLabel.text = viewModel.officialName
        
        
        if viewModel.openStreetMapsLink != nil {
            circle1button.addTarget(self, action: #selector(openOpenStreetMaps), for: .touchUpInside)
        }
        
        if viewModel.googleMapsLink != nil {
            circle2button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)
        }
    
    }
    
    // MARK: - Add Constraints
     private func addConstraints() {
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
             lineView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),


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


             regionNameBlankLabel.topAnchor.constraint(equalTo: basicInformationLabel.bottomAnchor, constant: 8),
             regionNameBlankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),


             capitalNameBlankLabel.topAnchor.constraint(equalTo: officialNameLabel.bottomAnchor, constant: 8),
             capitalNameBlankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

             currencySymbolBlankLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 8),
             currencySymbolBlankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

             officialNameBlankLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 8),
             officialNameBlankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
             officialNameBlankLabel.widthAnchor.constraint(equalToConstant: 150),

             
             line2View.topAnchor.constraint(equalTo: officialNameBlankLabel.bottomAnchor, constant: 15),
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
    
    // MARK: - Button Actions
    
    @objc func openOpenStreetMaps() {
        viewModel?.openOpenStreetMaps()
    }
    @objc func openGoogleMaps() {
        viewModel?.openGoogleMaps()
    }
    
}

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.sync{
                self?.image = image
            }
        }.resume()
    }
}

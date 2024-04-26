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
    var detailView: DetailPageView
    
    init() {
        self.detailView = DetailPageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Configure Content
    private func configureContent() {
        guard let viewModel = viewModel else {return}
        
        detailView.flagImageView.loadImage(from: URL(string: viewModel.flagImage!)!)
        title = viewModel.flagName
        detailView.descriptionLabel.text = viewModel.flagDescription
        detailView.regionNameBlankLabel.text = viewModel.regionName
        detailView.capitalNameBlankLabel.text = viewModel.capitalName
        detailView.currencySymbolBlankLabel.text = viewModel.currencySymbol
        detailView.officialNameBlankLabel.text = viewModel.officialName
        
        
        if viewModel.openStreetMapsLink != nil {
            detailView.circle1button.addTarget(self, action: #selector(openOpenStreetMaps), for: .touchUpInside)
        }
        
        if viewModel.googleMapsLink != nil {
            detailView.circle2button.addTarget(self, action: #selector(openGoogleMaps), for: .touchUpInside)
        }
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

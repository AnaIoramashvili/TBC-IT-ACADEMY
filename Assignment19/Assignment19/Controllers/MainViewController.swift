//
//  MainViewController.swift
//  Assignment19
//
//  Created by Ana on 4/24/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private var viewModel = MainViewModel()
    private var searchController = UISearchController(searchResultsController: nil)

    
    // MARK: - UI Components
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.frame = view.bounds
        tableView.register(CountriesCell.self, forCellReuseIdentifier: CountriesCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCountries()
        setupSearchController() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationTitle()

    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
    // MARK: - Fetching API
    private func fetchCountries() {
        viewModel.fetchCountries { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Search Controller Setup
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}

// MARK: - Table View Data Source and Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesCell.identifier, for: indexPath) as? CountriesCell else {
            fatalError("Error")
        }
        
         let country = viewModel.countries[indexPath.row]
        cell.countryLabel.text = country.name?.common
            
        if let flagURL = URL(string: (country.flags?.png!)!) {
                let task = URLSession.shared.dataTask(with: flagURL) { data, response, error in
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        cell.countryImageView.image = image
                    }
                }
                task.resume()
            }
        
        
        return cell
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.countries[indexPath.row]
        
        let detailViewModel = DetailViewModel(country: country)
        let detailVC = DetailViewController()
        detailVC.viewModel = detailViewModel
        detailVC.country = country
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        if searchText.isEmpty {
            viewModel.filteredCountries = viewModel.countries
        } else {
            viewModel.filteredCountries = viewModel.countries.filter {
                ($0.name?.common ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
        
        tableView.reloadData()
    }
}

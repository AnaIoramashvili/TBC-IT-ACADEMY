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
    
    // MARK: - UI Components
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.frame = view.bounds
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCountries()
        setupSearchController()
        updateSearchResults(for: searchController)
        setAlert()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAlert()
    }
    
    func setAlert() {
        if UserDefaults.standard.bool(forKey: "FirstLogin") {
            UserDefaults.standard.set(false, forKey: "FirstLogin")
            
            let alert = UIAlertController(title: "მოგესალმებით!", message: "კეთილი იყოს თქვენი მობრძანება ჩემს აპლიკაციაში!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "მადლობა", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        setNavigationTitle()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(tableView)
        view.backgroundColor = UIColor(named: "backgroundColor")
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setNavigationTitle() {
        navigationItem.hidesBackButton = true
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
}

// MARK: - Table View Data Source and Delegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell else {
            fatalError("Error")
        }
        
        let inSearchMode = viewModel.inSearchMode(searchController)
        let country = inSearchMode ? viewModel.filteredCountries[indexPath.row] : viewModel.countries[indexPath.row]
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
        let insearchMode = viewModel.inSearchMode(searchController)
        let country = insearchMode ? viewModel.filteredCountries[indexPath.row] : viewModel.countries[indexPath.row]
        
        let detailViewModel = DetailViewModel(country: country)
        let detailVC = DetailViewController()
        detailVC.viewModel = detailViewModel
        detailVC.country = country
        navigationController?.pushViewController(detailVC, animated: false)
    }
}

// MARK: - Search Controller Functions

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.updateSearchResults(for: searchController.searchBar.text)
        
        tableView.reloadData()
    }
}


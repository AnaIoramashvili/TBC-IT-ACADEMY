//
//  MainViewController.swift
//  Assignment18
//
//  Created by Ana on 4/20/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private var countryNames = [String]()
    private var countryFlags = [String]()
    private var descriptionLabel = [String]()
    
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
        setNavigationTitle()
        fetchCountries()
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
    }
    
    // MARK: - Fetching API
    private func fetchCountries() {
        guard let countriesURL = URL(string: "https://restcountries.com/v3.1/all") else {
            return
        }
        
        URLSession.shared.dataTask(with: countriesURL) { [weak self] data, response, error in
            guard let self = self else { return }
            
            
            guard let data = data else {
                return
            }
            
            do {
                guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                    return
                }
                                
                let countries = jsonArray.compactMap { $0["name"] as? [String: Any] }
                    .compactMap { $0["common"] as? String }
                
                let flags = jsonArray.compactMap { $0["flags"] as? [String: Any] }
                    .compactMap { $0["png"] as? String }
                
                let description = jsonArray.compactMap { $0["flags"] as? [String: Any] }
                    .compactMap { $0["alt"] as? String }
                                
                DispatchQueue.main.async {
                    self.countryNames = countries
                    self.countryFlags = flags
                    self.descriptionLabel = description
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding countries data: \(error)")
            }
        }.resume()
    }
}

// MARK: - Table View Data Source and Delegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesCell.identifier, for: indexPath) as? CountriesCell else {
            fatalError("Error")
        }
                
        cell.countryLabel.text = countryNames[indexPath.row]
                
        let flagURLString = countryFlags[indexPath.row]
        if let flagURL = URL(string: flagURLString) {
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
        let detailVC = DetailViewController()
        if let flagURL = URL(string: countryFlags[indexPath.row]) {
            let task = URLSession.shared.dataTask(with: flagURL) { data, response, error in
                guard let data = data, let flagImage = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    detailVC.flagImage = flagImage
                    self.navigationController?.pushViewController(detailVC, animated: true)
                }
            }
            task.resume()
        }
    }
}



//
//  CatFactViewController.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import UIKit

class CatFactViewController: UIViewController, UITableViewDelegate {
    private let viewModel = CatFactsViewModel()
    private var catFacts: [CatFact] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.frame = tableView.bounds
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CatFactCell.self, forCellReuseIdentifier: CatFactCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchFacts()
        navigationTitle()
        
    }
    
    func navigationTitle(){
        navigationItem.title = "Cat Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchFacts() {
        viewModel.fetchCatFacts { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.catFacts = response.data 
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch cat facts: \(error)")
            }
        }
    }
}

extension CatFactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catFacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatFactCell.identifier, for: indexPath) as? CatFactCell else {
            fatalError("Error dequeuing CatFactCell")
        }
        
        let catFact = catFacts[indexPath.row]
        cell.configure(with: catFact)
        
        return cell
    }
}

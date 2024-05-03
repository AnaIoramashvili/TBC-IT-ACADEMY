//
//  CatFactViewController.swift
//  Assignment21
//
//  Created by Ana on 5/1/24.
//

import UIKit

class CatFactViewController: UIViewController, UITableViewDelegate {
    
    private var viewModel: CatFactsViewModelProtocol
    public var catFacts: [CatFact] = []
    
    func setViewModel(_ viewModel: CatFactsViewModelProtocol) {
        self.viewModel = viewModel
    }
    // MARK: - Initialization
    
    init(viewModel: CatFactsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components

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
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationTitle()
        fetchFacts()
    }
    
    // MARK: -Navigation Title Function
    
    func navigationTitle() {
        navigationItem.title = "Cat Facts ❤️"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Setup UI
    
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
    
    // MARK: - Fetch Facts Function
    
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


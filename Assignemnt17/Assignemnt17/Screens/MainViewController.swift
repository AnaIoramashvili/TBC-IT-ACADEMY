//
//  MainViewController.swift
//  Assignemnt17
//
//  Created by Ana on 4/19/24.
//

import UIKit


class MainViewController: UIViewController {
    
    //MARK: - UI Components
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.frame =  view.bounds
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationTitle()
        fetchNews()
    }

    //MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setNavigationTitle() {
        navigationItem.title = "Panicka News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Fetching API
    var newsData = [[String: Any]]()
    
    func fetchNews() {
        guard let newsDataURL = URL(string: "https://imedinews.ge/api/categorysidebarnews/get") else {
            return
        }

        URLSession.shared.dataTask(with: newsDataURL) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let list = json?["List"] as? [[String: Any]] {
                        DispatchQueue.main.async {
                            self.newsData = list
                            self.tableView.reloadData()
                        }
                    }
                } catch {
                    print("Error decoding categories: \(error)")
                }
            }
        }.resume()
    }

}

    // MARK: - Table View DataSource & Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.identifier, for: indexPath) as? NewsFeedCell else {
            fatalError("Error")
        }
        
        let rowData = newsData[indexPath.row]
        
        if let title = rowData["Title"] as? String {
            cell.titleLabel.text = title
        }
        
        if let time = rowData["Time"] as? String {
            cell.timeLabel.text = time
        }
        
        if let imageUrlString = rowData["PhotoUrl"] as? String, let imageUrl = URL(string: imageUrlString) {
            // Fetch image data synchronously from the URL
            if let imageData = try? Data(contentsOf: imageUrl) {
                // Create UIImage from the fetched data
                let image = UIImage(data: imageData)
                // Set the image to the image view
                cell.imageView?.image = image
            }
        }
        
        return cell
    }
}

//
//  ContactInfoViewController.swift
//  Assignment15
//
//  Created by Ana on 4/13/24.
//

import Foundation
import UIKit

class ContactInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var student: StudentData?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 15
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.rowHeight = 44
        return tableView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setUpIconImageView()
        setUpTableView()
        setUpFullNameLabel()
    }
    
    func setUpIconImageView() {
        view.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        if let studentIcon = student?.icon {
            iconImageView.image = studentIcon
        }
    }
    
    func setUpFullNameLabel() {
        view.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fullNameLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 10)
        ])
        
        if let fullName = student?.fullName {
            fullNameLabel.text = fullName.capitalized
        } else {
            fullNameLabel.text = ""
        }
        
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let totalCellHeight: CGFloat = CGFloat(3) * tableView.rowHeight
        
        tableView.heightAnchor.constraint(equalToConstant: totalCellHeight).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Gender: \(student?.gender.rawValue ?? "")"
        case 1:
            cell.textLabel?.text = "Age: \(student?.age ?? 0)"
        case 2:
            cell.textLabel?.text = "Hobby: \(student?.hobby ?? "")"
        default:
            break
        }
        
        return cell
    }
}

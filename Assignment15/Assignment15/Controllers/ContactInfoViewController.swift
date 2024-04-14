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
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
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
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
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
        
        setUpContentView()
        setUpIconImageView()
        setUpTableView()
        setUpFullNameLabel()
    }
    
    func setUpContentView() {
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    func setUpIconImageView() {
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        if let studentIcon = student?.icon {
            iconImageView.image = studentIcon
        }

    }
    
    func setUpFullNameLabel() {
        contentView.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
            tableView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 100),
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

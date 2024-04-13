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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 15
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView() {
        view.backgroundColor = .lightGray
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 324),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 361),
            tableView.heightAnchor.constraint(equalToConstant: 150)
        ])
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

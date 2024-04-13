//
//  ViewController.swift
//  Assignment15
//
//  Created by Ana on 4/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    let headerViewHeight: CGFloat = 100
    let sectionIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame =  view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: headerViewHeight))
        headerView.backgroundColor = .white
        
        let profileImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
        profileImageView.image = UIImage(named: "MyImageIcon")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        headerView.addSubview(profileImageView)
        
        let nameLabel = UILabel(frame: CGRect(x: 100, y: 40, width: self.view.frame.width - 160, height: 30))
        nameLabel.text = "Ana"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerView.addSubview(nameLabel)
        
        
        let lastNameLabel = UILabel(frame: CGRect(x: 140, y: 45, width: self.view.frame.width - 160, height: 20))
        lastNameLabel.text = "Ioramashvili"
        lastNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerView.addSubview(lastNameLabel)
        
        let arrowButton = UIButton(type: .custom)
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.tintColor = .lightGray
        arrowButton.frame = CGRect(x: self.view.frame.width - 40, y: 40, width: 20, height: 20)
        headerView.addSubview(arrowButton)
        
        return headerView
    }()
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setNavigationTitle()
    }
    
    
    //MARK: Functions
    func setUpTableView() {
        view.addSubview(tableView)
        
        tableView.tableHeaderView = headerView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    func setNavigationTitle() {
        navigationItem.title = "iOS Squad"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func sortStudents() {
        students.sort { $0.fullName < $1.fullName }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sectionIndexTitles[section]
        let studentsInSection = students.filter { $0.fullName.uppercased().hasPrefix(letter) }
        return studentsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let letter = sectionIndexTitles[indexPath.section]
        let studentsInSection = students.filter { $0.fullName.uppercased().hasPrefix(letter) }
        
        let fullName = studentsInSection[indexPath.row].fullName
        let capitalizedFullName = fullName.capitalized
        cell.textLabel?.text = capitalizedFullName
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionIndexTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndexTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let letter = sectionIndexTitles[indexPath.section]
        let studentsInSection = students.filter { $0.fullName.uppercased().hasPrefix(letter) }
        let selectedStudent = studentsInSection[indexPath.row]
        
        let contactInfoViewController = ContactInfoViewController()
        contactInfoViewController.student = selectedStudent
        
        navigationController?.pushViewController(contactInfoViewController, animated: true)
    }


}





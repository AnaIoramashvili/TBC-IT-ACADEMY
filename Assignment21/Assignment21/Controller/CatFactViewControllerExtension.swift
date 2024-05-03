//
//  CatFactViewControllerExtension.swift
//  Assignment21
//
//  Created by Ana on 5/3/24.
//

import UIKit

// MARK: - UI TableView DataSource Extension

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

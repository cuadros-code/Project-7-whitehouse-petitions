//
//  ViewController.swift
//  Project-7-whitehouse-petitions
//
//  Created by Kevin Cuadros on 15/08/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Whitehouse News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Title"
        content.secondaryText = "Subtitle"
        cell.contentConfiguration = content
        return cell
    }


}


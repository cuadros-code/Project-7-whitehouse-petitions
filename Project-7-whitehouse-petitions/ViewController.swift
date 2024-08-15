//
//  ViewController.swift
//  Project-7-whitehouse-petitions
//
//  Created by Kevin Cuadros on 15/08/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Whitehouse News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parse(json: data)
            }
        }
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = petition.title
        content.secondaryText = String(petition.body.prefix(100)) + "..."
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let shareAction = UIAction(
            title: "Share",
            image: UIImage(systemName: "square.and.arrow.up"),
            identifier: nil
        ) { _ in
            print("hello")
        }
        
        let deleteAction = UIAction(
            title: "Delete",
            image: UIImage(systemName: "trash.fill"),
            identifier: nil,
            attributes: .destructive
        ) { _ in
        }
        
        let menu = UIMenu(title: "Menu", children: [shareAction, deleteAction] )
        
        return UIContextMenuConfiguration(identifier: nil, actionProvider:  { _ in
            return menu
        })
        
    }


}


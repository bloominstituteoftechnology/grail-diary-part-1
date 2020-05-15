//
//  GrailTableViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class GrailTableViewController: UITableViewController {
    
    var grailController = GrailController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grailController.grailArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailCell", for: indexPath) as? GrailTableViewCell else {return UITableViewCell()}
        
        let grail = grailController.grailArray[indexPath.row]
        cell.grail = grail


        return cell
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GrailDetailSegue" {
            guard let grailDetailVC = segue.destination as? GrailDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            grailDetailVC.grailController = grailController
            grailDetailVC.grail = grailController.grailArray[indexPath.row]
        }
        if segue.identifier == "AddGrailSegue" {
            guard let addGrailVC = segue.destination as? AddGrailViewController else {return}
            addGrailVC.grailController = grailController
            addGrailVC.tableView = tableView
        }
    }
}

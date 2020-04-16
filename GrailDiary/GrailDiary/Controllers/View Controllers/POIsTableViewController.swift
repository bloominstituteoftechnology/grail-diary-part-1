//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Nonye on 4/16/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

    @IBDesignable
class POIsTableViewController: UIViewController {
    var poiModels: [POI] = [POI(location: "Serene Escape", country: "Mauritius", clues: ["Sand", "Oceans", "Family Friendly"])]
        
        @IBOutlet weak var tableView: UITableView!{

    override func viewDidLoad() {
        super.viewDidLoad()


    // MARK: - Table view data source

    extension POIsTableViewController: UITableViewDataSource {
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return poiModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailCell", for: indexPath)

        let poi = poiModels[indexPath.row]
        cell.poi = poi
        return cell
    }
    
        }
  
        
        
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            let addVC = segue.destination as? AddPOIViewController
            addVC.delegate = self
        }
    }
}


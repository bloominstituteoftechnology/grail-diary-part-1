//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Ufuk Türközü on 07.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

class POIsTableViewController: UITableViewController {
    
    var pois: [POI] = [POI(location: "", country: "", clues: [])]
    
    func poiWasCreated(pois: POI) {
        self.pois.append(pois)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pois.count
        

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
            
            if let contactPOIDetailVC = segue.destination as? AddPOIViewController {
                contactPOIDetailVC.delegate = self
             
            } else if segue.identifier == "ShowPOIDetailSegue" {
                // We know that we are segueing to the FriendDetailViewController
                
                // What friend do we need to pass over?
                if let POIDetailVC = segue.destination as? POIDetailViewController,
                    let indexPath = tableView.indexPathForSelectedRow {
                            
                    let poi = pois[indexPath.row]
                    POIDetailVC.poi = poi
                }
            }
                // Hey I'm (the tble view controller) going to be the person you tell when a new friend is created
        
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
}

extension POIsTableViewController: UITableViewDataSource, {
    func tableView(table View: UITableView, numberOfRowsInSection:) {
        
    }
    func tableView(_:cellForRowAt:indexPath:) {
        
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasCreated(_ pois: POI) {
        pois.append(pois)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
}


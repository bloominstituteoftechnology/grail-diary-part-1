//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    //MARK: - step 7 Created a Variable of type Array to store my [POI] models
    var POIList: [POI] = []
    //MARK: - step 8 This is my wired up outlet to link my Table View Controller to my code.
    @IBOutlet weak var TableViewOutlet: UITableView!
    
}
//MARK: step 9 I am creating an extension now that will cause the table view controller to be the spot I am getting my data from FOR my tableview.
//MARK: step 10 I am adding the function stubs. At which point numberOfRowsInSection returns POILIST's count. The Table view function for cellForRowAt is dequeing to POICell, downcasting it as the custom table view I have made, or else if this does not work correcting, the tableview deques to a blank UITableViewCell. --------> can we make a default cell for this scnenario or is that redundant?

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return  UITableViewCell() }
        
        let poi = POIList[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    //MARK: step 27 - 30 Prepares for segue. 39 - 41 Prepare For Detail Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
            
        else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = TableViewOutlet.indexPathForSelectedRow,
                let showDetailVC = segue.destination as? POIDetailViewController {
                showDetailVC.poi = POIList[indexPath.row]
                
            }
        }
    }
}
//MARK: - step 22-26 I made the POITable conform to the ADDPOIDelegate. so I can append poi to my POIList that is on this file. This is essentially the modular view passing me back the data I asked for! then it is dismissing the view, and reloading the tableviewoutlets data. Which it needs done i believe because its a custom data set we made.
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
        POIList.append(poi)
        dismiss(animated: true, completion: nil)
        TableViewOutlet.reloadData()
        
    }
}


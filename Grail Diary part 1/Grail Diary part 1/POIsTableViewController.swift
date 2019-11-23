//
//  POIsTableViewController.swift
//  Grail Diary part 1
//
//  Created by Osha Washington on 11/21/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

class POIsTableViewController: UITableViewController {

    var poiModels: [POI] = []
    
    // - OUTLETS**
    
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
        return 0
    }

    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "AddPOIModalSegue" {
            guard let addVC = segue.destination as? AddPOIViewController else { return }
            addVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let 
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiModels.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}


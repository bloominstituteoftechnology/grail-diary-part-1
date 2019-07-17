//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Bradley Yin on 7/17/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var POIs : [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   
 

    
}

extension POIsTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else{return UITableViewCell()}
        let POI = POIs[indexPath.row]
        cell.POI = POI
        
        // Configure the cell...
        
        return cell
    }
}

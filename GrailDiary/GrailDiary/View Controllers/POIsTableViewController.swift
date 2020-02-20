//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by dc on 2/18/20.
//  Copyright © 2020 Diego Covarrubias. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    let pois: [POI] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        
        if let poiCell = cell as? POITableViewCell {
            poiCell.poi = pois[indexPath.row]
        }
        
        return cell
    }
}

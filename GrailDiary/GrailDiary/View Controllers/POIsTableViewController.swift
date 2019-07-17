//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 7/17/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    var POIs: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else { return UITableViewCell()}
        
        let POI = POIs[indexPath.row]
        cell.POI = POI
        
        return cell
    }
    

}

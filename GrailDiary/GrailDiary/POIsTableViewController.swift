//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Bronson Mullens on 4/10/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var poi: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var tableView: UITableView!
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let newPOI = poi[indexPath.row]
        cell.poi = newPOI
        return cell
    }
    
    
}

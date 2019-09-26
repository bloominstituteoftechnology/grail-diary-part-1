//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by denis cedeno on 9/26/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POIcell", for: indexPath) as? POITableViewCell else {
            fatalError()
        }
        
        let poi = pois[indexPath.row]
        cell.POI = poi
        
        return cell
    }
    
    
}

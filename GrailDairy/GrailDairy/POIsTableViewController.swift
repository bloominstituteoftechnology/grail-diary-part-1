//
//  ViewController.swift
//  GrailDairy
//
//  Created by Waseem Idelbi on 11/15/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var POIArray: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var tableView: UITableView!
    
    

    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        POIArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = POIArray[indexPath.row]
        cell.poi = poi
        return cell
        
    }
    
    
}


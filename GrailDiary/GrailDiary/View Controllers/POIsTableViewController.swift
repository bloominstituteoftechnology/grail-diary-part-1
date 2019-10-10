//
//  ViewController.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-08.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var pois: [POI] = []
    
    @IBOutlet weak var poiTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
                as? POITableViewCell
            else { return UITableViewCell() }
        
        cell.poi = pois[indexPath.row]
        
        return cell
    }
}

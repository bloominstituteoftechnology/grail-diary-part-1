//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Jonalynn Masters on 9/12/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
        let POI = POIs[indexPath.row]
        cell.POI = POI
        
        return cell
    }
}


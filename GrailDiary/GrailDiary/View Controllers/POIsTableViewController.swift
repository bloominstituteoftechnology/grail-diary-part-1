//
//  ViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_259 on 1/30/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    // MARK: Properties
    var pois: [POI] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var poiTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.poiTableView.delegate = self
        self.poiTableView.datasource = self
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    
    
    
}


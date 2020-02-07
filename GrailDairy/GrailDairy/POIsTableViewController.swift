//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by Lambda_School_Loaner_241 on 2/6/20.
//  Copyright © 2020 Kennedy Samarakody. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var model:[POI] = []
    
    // Mark: - IBOutlets

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
           
    }
    


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = model[indexPath.row]
        
        cell.POI = poi
        
        return cell
        
        
        
        
        
        
    }
    
    
}

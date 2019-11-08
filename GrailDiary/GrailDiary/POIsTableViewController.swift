//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Donella Barcelo on 11/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
        
    var pois: [POI] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            return UITableViewCell()
        }
        
        let poi = pois[indexPath.row]
        
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

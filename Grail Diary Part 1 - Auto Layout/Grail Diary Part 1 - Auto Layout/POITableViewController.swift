//
//  POITableViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Nicolas Rios on 7/17/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var POI: [POI] = []
}
    
extension POITableViewController: UITableViewDataSource {
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



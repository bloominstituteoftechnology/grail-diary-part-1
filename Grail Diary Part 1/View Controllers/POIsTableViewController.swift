//
//  POIsTableViewController.swift
//  Grail Diary Part 1
//
//  Created by Andrew Ruiz on 7/17/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    // Strange that as I'm typing out  @IBOutlet Xcode doesn't auto-complete. Almost as if Apple is saying, "Don't do this programmatically. Use the storyboard method." Maybe Apple has a preference for how things should be done. Or maybe it's just a bug.
    @IBOutlet weak var tableView: UITableView!
    
    var pois : [POI] = []
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
}

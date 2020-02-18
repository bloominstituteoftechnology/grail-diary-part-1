//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Shawn Gee on 2/6/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var pois = [POI]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        
        return cell
    }
}

extension POIsTableViewController: UITableViewDelegate {
    
}

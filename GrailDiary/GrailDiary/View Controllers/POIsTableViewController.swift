//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Chad Parker on 1/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var pointsOfInterest: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsOfInterest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as! POITableViewCell
        let poi = pointsOfInterest[indexPath.row]
        cell.poi = poi
        return cell
    }
}

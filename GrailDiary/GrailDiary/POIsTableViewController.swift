//
//  ViewController.swift
//  GrailDiary
//
//  Created by morse on 10/8/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var POITableView: UITableView!
    
    struct PropertyKeys {
        static let addPOIModalSegue = "AddPOIModalSegue"
        static let showPOIDetailSegue = "ShowPOIDetailSegue"
        static let POICell = "POICell"
    }
    
    var POIs: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.POICell, for: indexPath) as? POITableViewCell else { fatalError("no cell") }
        
        return cell
    }


}


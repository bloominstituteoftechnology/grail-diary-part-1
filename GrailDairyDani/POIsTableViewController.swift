//
//  POIsTableViewController.swift
//  GrailDairyDani
//
//  Created by Danielle Blackwell on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiProperty: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    }

    extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiProperty.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard tableView.dequeueReusableCell(withIdentifier: "GrailDiaryCell", for: indexPath) is POITableViewCell else { return UITableViewCell () }
        
//        let newpoi =
//
        return UITableViewCell()
    }
}

//extension POIsTableViewController: UITableViewDataSource {
//    func tableView
//


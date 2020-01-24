//
//  ViewController.swift
//  GrailDiary
//
//  Created by Nichole Davidson on 1/21/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var listOfPOIs: UITableView!
    
    var delegate: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var POIModels = POI(location: location, country: country, clues: clues)
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

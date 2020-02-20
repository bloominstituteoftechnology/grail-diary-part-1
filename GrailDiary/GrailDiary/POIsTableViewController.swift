//
//  ViewController.swift
//  GrailDiary
//
//  Created by Karen Rodriguez on 2/18/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    var models: [POI] = []
    
    @IBOutlet weak var POITable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


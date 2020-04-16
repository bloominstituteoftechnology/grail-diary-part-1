//
//  POIsViewController.swift
//  GrailDiary
//
//  Created by Aaron Peterson on 4/10/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class POIsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension POIsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}


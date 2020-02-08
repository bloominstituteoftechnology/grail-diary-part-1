//
//  ViewController.swift
//  GrailDiary
//
//  Created by Thomas Sabino-Benowitz on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [PointOfInterest] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
  
        }
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? 
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return POIs.count
    }
}




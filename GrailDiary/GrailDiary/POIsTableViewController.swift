//
//  ViewController.swift
//  GrailDiary
//
//  Created by Ian French on 4/12/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var POIsTableView: UITableView!
    
    var points: [POI] = [
        POI(location: "Banff", country: "Canada", clues: ["Mountains", "Fairmont Hotel", "Cascade Mountain"])
       ]
    
    
}  // class end bracket


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  //  override func viewDidLoad() {
    //    super.viewDidLoad()
        // Do any additional setup after loading the view.
 //   }





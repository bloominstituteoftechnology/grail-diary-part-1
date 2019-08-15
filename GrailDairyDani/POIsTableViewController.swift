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

        // Do any additional setup after loading the view.
    }
    

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



    extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiProperty.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    



    



}

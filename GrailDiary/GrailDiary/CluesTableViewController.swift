//
//  ViewController.swift
//  GrailDiary
//
//  Created by Fabiola S on 7/25/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class CluesTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}


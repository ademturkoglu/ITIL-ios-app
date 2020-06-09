//
//  DetailViewController.swift
//  ITMSMetrics
//
//  Created by ademturkoglu on 9.06.2020.
//  Copyright © 2020 ademturkoglu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var tittleLabel: UILabel!
    var metric: Metric?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.text = metric?.goal
        tittleLabel.text = metric?.name

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

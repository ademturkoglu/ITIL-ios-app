//
//  TableViewCell.swift
//  ITMSMetrics
//
//  Created by ademturkoglu on 8.06.2020.
//  Copyright © 2020 ademturkoglu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var metricNameLabel: UILabel!
    @IBOutlet weak var meticGoalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

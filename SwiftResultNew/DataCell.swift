//
//  DataCell.swift
//  SwiftResultNew
//
//  Created by Bhargava on 05/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var cityLbl:UILabel!
    @IBOutlet weak var pinLbl:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  Contain_Cell.swift
//  Folding_Table
//
//  Created by Yen on 2020/2/23.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit

class Contain_Cell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bg_view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bg_view.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

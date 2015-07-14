//
//  PagosTableViewCell.swift
//  SidebarMenu
//
//  Created by modelo on 14/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit

class PagosTableViewCell: UITableViewCell {

    @IBOutlet weak var lblConcepto: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

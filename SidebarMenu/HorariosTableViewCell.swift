//
//  HorariosTableViewCell.swift
//  SidebarMenu
//
//  Created by modelo on 10/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit

class HorariosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMateria: UILabel!
    @IBOutlet weak var lblLun: UILabel!
    @IBOutlet weak var lblMar: UILabel!
    @IBOutlet weak var lblMie: UILabel!
    @IBOutlet weak var lblJue: UILabel!
    @IBOutlet weak var lblVie: UILabel!
    @IBOutlet weak var lblSab: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  OrdinariosTableViewCell.swift
//  SidebarMenu
//
//  Created by modelo on 14/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit

class OrdinariosTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMateria: UILabel!
    @IBOutlet weak var lblProfesor: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblHora: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

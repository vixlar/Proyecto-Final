//
//  CalificacioinesTableViewCell.swift
//  SidebarMenu
//
//  Created by modelo on 10/07/15.
//  Copyright (c) 2015 Unimodelo. All rights reserved.
//

import UIKit

class CalificacioinesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMateria: UILabel!
    @IBOutlet weak var lblParcial1: UILabel!
    @IBOutlet weak var lblParcial2: UILabel!
    @IBOutlet weak var lblParcial3: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!
    @IBOutlet weak var lblOrdinario: UILabel!
    @IBOutlet weak var lblFinal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class PokemonTableCell: UITableViewCell {
    
    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    @IBOutlet weak var PokemonTypeLabel: UILabel!
    @IBOutlet weak var PokemonIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

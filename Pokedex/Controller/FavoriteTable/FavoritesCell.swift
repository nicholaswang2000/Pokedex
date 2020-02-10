//
//  FavoritesCell.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/10/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var PokemonName: UILabel!
    @IBOutlet weak var PokemonTypes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

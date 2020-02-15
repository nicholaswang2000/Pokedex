//
//  PokemonCollectionCell.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/10/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class PokemonCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var PokemonIDLabel: UILabel!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

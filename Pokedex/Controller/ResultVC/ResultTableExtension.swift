//
//  ResultExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension ResultController: UITableViewDataSource, UITableViewDelegate {
    // Delegate and DataSource protocol stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableCell", for: indexPath) as! PokemonTableCell
        let currPokemon = pokemonArray[indexPath.row]
        cell.PokemonNameLabel.text = currPokemon.name
        let imageURL = URL(string: currPokemon.largeUrl)
        cell.PokemonImage.kf.setImage(with: imageURL)
        cell.PokemonTypeLabel.text = "Type: " + currPokemon.getTypes()
        cell.PokemonIDLabel.text = "#" + String(currPokemon.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToDetailVC", sender: self)
    }
}

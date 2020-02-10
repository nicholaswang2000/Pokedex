//
//  ResultExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension ResultController: UITableViewDataSource, UITableViewDelegate {
    // Delegate and DataSource protocol stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomPokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        let currPokemon = randomPokemonArray[indexPath.row]
        cell.PokemonNameLabel.text = currPokemon.name
        let imageURL = URL(string: currPokemon.imageUrl)
        cell.PokemonImage.image = try? UIImage(withContentsOfUrl: imageURL ?? URL(string: "https://static.thenounproject.com/png/60319-200.png")!)
        cell.PokemonTypeLabel.text = "Type: " + currPokemon.getTypes()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToDetailVC", sender: self)
    }
}

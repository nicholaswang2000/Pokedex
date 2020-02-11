//
//  FavoritesExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/10/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.array(forKey: "favoritesArray")!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        favoritesArray = UserDefaults.standard.array(forKey: "favoritesArray") as! [Int]
        let currPokemon = PokemonHelpers.getPokemonFromID(favoritesArray[indexPath.row])
        cell.PokemonName.text = currPokemon.name
        let imageURL = URL(string: currPokemon.imageUrl)
        cell.PokemonImage.image = try? UIImage(withContentsOfUrl: imageURL ?? URL(string: "https://static.thenounproject.com/png/60319-200.png")!)
        cell.PokemonTypes.text = "Type: " + currPokemon.getTypes()
        cell.PokemonID.text = "#" + String(currPokemon.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "FavoritesSegueToDetail", sender: self)
    }
    
}

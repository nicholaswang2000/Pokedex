//
//  ResultSearchBarExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/12/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension ResultController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pokemonArray = PokemonHelpers.getArrayFromSearchBar(searchText)
        PokemonTable.reloadData()
        PokemonCollection.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}

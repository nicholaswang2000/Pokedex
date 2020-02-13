//
//  ResultController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var pokemonArray: [Pokemon] = []
    var alreadyLoaded = false
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var PokemonTable: UITableView!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var PokemonCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reload for first search without segcontrols
        tableView.isHidden = false
        collectionView.isHidden = true
        PokemonTable.reloadData()
        PokemonCollection.reloadData()
        
        if !alreadyLoaded {
            pokemonArray = PokemonGenerator.getPokemonArray()
            alreadyLoaded = true
        }
        
    }
    
    @IBAction func changedSegControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            tableView.isHidden = false
            collectionView.isHidden = true
        case 1:
            tableView.isHidden = true
            collectionView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func goSearchOptions(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToSearchVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailController {
            var rowNo = 0
            switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                rowNo = (PokemonTable.indexPathForSelectedRow?.row)!
            case 1:
                rowNo = (PokemonCollection.indexPathsForSelectedItems?[0].row)!
            default:
                break
            }
            destinationVC.pokemon = pokemonArray[rowNo]
        }
    }

}

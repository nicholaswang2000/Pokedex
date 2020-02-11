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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var PokemonTable: UITableView!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var PokemonCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reload for first search without segcontrols
        tableView.isHidden = false
        collectionView.isHidden = true
        PokemonTable.reloadData()
        PokemonCollection.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedSegControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            tableView.isHidden = false
            collectionView.isHidden = true
            //print("0")
        case 1:
            tableView.isHidden = true
            collectionView.isHidden = false
            //print("1")
        default:
            break
        }
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
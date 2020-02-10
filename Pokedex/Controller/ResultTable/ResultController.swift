//
//  ResultController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var randomPokemonArray: [Pokemon] = []
    
    @IBOutlet weak var PokemonTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailController {
            let rowNo = (PokemonTable.indexPathForSelectedRow?.row)!
            destinationVC.pokemon = randomPokemonArray[rowNo]
        }
    }

}

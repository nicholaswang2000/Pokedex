//
//  FavoritesController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/10/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var favoritesArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesTableView.reloadData()
    }
    
    @IBAction func clearFavoritesList(_ sender: Any) {
        favoritesArray = []
        UserDefaults.standard.set(favoritesArray, forKey: "favoritesArray")
        favoritesTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? DetailController {
            let rowNo = (favoritesTableView.indexPathForSelectedRow?.row)!
            favoritesArray = UserDefaults.standard.array(forKey: "favoritesArray") as! [Int]
            destinationVC.pokemon = PokemonHelpers.getPokemonFromID(favoritesArray[rowNo])
        }
        
    }

}

//
//  DetailController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    
    var pokemonName: String = ""
    var pokemonImageURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonNameLabel.text = pokemonName
        PokemonImage.image = try? UIImage(withContentsOfUrl: URL(string: pokemonImageURL) ?? URL(string: "https://static.thenounproject.com/png/60319-200.png")!)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

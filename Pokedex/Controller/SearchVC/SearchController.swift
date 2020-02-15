//
//  SearchController.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/9/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var normalView: UIView!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var typeView: UIView!
    
    // Type Button Outlets
    @IBOutlet weak var grassBtn: UIButton!
    @IBOutlet weak var bugBtn: UIButton!
    @IBOutlet weak var psychicBtn: UIButton!
    @IBOutlet weak var dragonBtn: UIButton!
    @IBOutlet weak var iceBtn: UIButton!
    @IBOutlet weak var groundBtn: UIButton!
    @IBOutlet weak var electricBtn: UIButton!
    @IBOutlet weak var fairyBtn: UIButton!
    @IBOutlet weak var normalBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var fightingBtn: UIButton!
    @IBOutlet weak var fireBtn: UIButton!
    @IBOutlet weak var unknownBtn: UIButton!
    @IBOutlet weak var flyingBtn: UIButton!
    @IBOutlet weak var steelBtn: UIButton!
    @IBOutlet weak var darkBtn: UIButton!
    @IBOutlet weak var ghostBtn: UIButton!
    @IBOutlet weak var waterBtn: UIButton!
    @IBOutlet weak var poisonBtn: UIButton!
    
    
    var randomPokemonList:[Pokemon] = []
    var typesToSearch:[PokeType] = []
    var typesPressed:[PokeType: Bool] = [PokeType.Bug:false, PokeType.Dark:false, PokeType.Dragon:false, PokeType.Electric:false, PokeType.Fairy:false, PokeType.Fighting:false, PokeType.Fire:false, PokeType.Flying:false, PokeType.Ghost:false, PokeType.Grass:false, PokeType.Ground:false, PokeType.Ice:false, PokeType.Normal:false, PokeType.Poison:false, PokeType.Psychic:false, PokeType.Rock:false, PokeType.Steel:false, PokeType.Water:false, PokeType.Unknown:false]
    var textToSearch = ""
    var categoryArray: [PokeType] = []
    var searchOrRandom = 0 // 0 means random, 1 means type, 2 means name, 3 means number, 4 means all, 5 means by min attack, 6 means by min health, 7 means by min defense
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        normalView.isHidden = false
        optionsView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = true
        
        // Gets rid of keyboard when tapped elsewhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        normalView.isHidden = false
        optionsView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = true
    }
    
    // function to get rid of keyboard when tapped elsewhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func getRangeArr(_ string: String) ->[Int] {
        let rangeArr = string.split(separator: "-")
        let start = Int(rangeArr[0])!
        let end = Int(rangeArr[1])!
        return Array(start...end)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // All search functionalities are found in Model algorithms
        if segue.identifier == "GoToResultsVC" {
            if searchOrRandom == 0 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = randomPokemonList
            } else if searchOrRandom == 1 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getTypeSearchArray(categoryArray)
            } else if searchOrRandom == 2 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getNameSearchArray(textToSearch)
            } else if searchOrRandom == 3 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getNumberSearchArray(Int(textToSearch) ?? 0)
            } else if searchOrRandom == 4 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonGenerator.getPokemonArray()
            } else if searchOrRandom == 5 {
                let destinationVC = segue.destination as! ResultController
                let rangeArr = getRangeArr(textToSearch)
                destinationVC.pokemonArray = PokemonHelpers.getAttackArray(rangeArr)
            } else if searchOrRandom == 6 {
                let destinationVC = segue.destination as! ResultController
                let rangeArr = getRangeArr(textToSearch)
                destinationVC.pokemonArray = PokemonHelpers.getHealthArray(rangeArr)
            } else if searchOrRandom == 7 {
                let destinationVC = segue.destination as! ResultController
                let rangeArr = getRangeArr(textToSearch)
                destinationVC.pokemonArray = PokemonHelpers.getDefenseArray(rangeArr)
            }
        }
        
        
    }
    

}

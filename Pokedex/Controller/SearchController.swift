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
    var searchOrRandom = 0 // 0 means random, 1 means type, 2 means name, 3 means number, 4 means all, 5 means by min attack, 6 means by min health, 7 means by min defense
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializes favoritesArray to empty when VC loads
        UserDefaults.standard.set([Int](), forKey: "favoritesArray")
        
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
    
    @IBAction func generateRandom(_ sender: Any) {
        randomPokemonList = PokemonHelpers.generateRandomPokemon(20)
        //RandomPokemon.testWorking(randomPokemonList)
        searchOrRandom = 0
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func listAllPokemon(_ sender: Any) {
        searchOrRandom = 4
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func searchByCategory(_ sender: Any) {
        normalView.isHidden = true
        optionsView.isHidden = true
        categoryView.isHidden = false
        typeView.isHidden = true
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        optionsView.isHidden = false
        normalView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = true
    }
    
    
    // Implement category search last
    @IBAction func typeSearch(_ sender: Any) {
        searchOrRandom = 1
        optionsView.isHidden = true
        normalView.isHidden = true
        categoryView.isHidden = true
        typeView.isHidden = false
    }
    
    @IBAction func nameSearch(_ sender: Any) {
        searchOrRandom = 2
        assertTextNotEmpty()
    }
    
    @IBAction func numberSearch(_ sender: Any) {
        searchOrRandom = 3
        assertTextNotEmpty()
    }
    
    @IBAction func minAttackSearch(_ sender: Any) {
        searchOrRandom = 5
        assertTextNotEmpty()
    }
    
    @IBAction func minHealthSearch(_ sender: Any) {
        searchOrRandom = 6
        assertTextNotEmpty()
    }
    
    @IBAction func minDefenseSearch(_ sender: Any) {
        searchOrRandom = 7
        assertTextNotEmpty()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        optionsView.isHidden = true
        normalView.isHidden = false
        categoryView.isHidden = true
        typeView.isHidden = true
    }
    
    func assertTextNotEmpty() {
        if textfield.text == "" {
            presentAlert()
        } else {
            textToSearch = textfield.text ?? ""
            self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
        }
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "No input", message: "Please enter a valid input to search", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // All search functionalities are found in Model algorithms
        if segue.identifier == "GoToResultsVC" {
            if searchOrRandom == 0 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = randomPokemonList
            } else if searchOrRandom == 1 {
                let destinationVC = segue.destination as! ResultController
                //destinationVC.pokemonArray = PokemonHelpers.getTypeSearchArray(textToSearch)
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
                destinationVC.pokemonArray = PokemonHelpers.getMinAttackArray(Int(textToSearch) ?? 20000)
            } else if searchOrRandom == 6 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getMinHealthArray(Int(textToSearch) ?? 20000)
            } else if searchOrRandom == 7 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getMinDefenseArray(Int(textToSearch) ?? 20000)
            }
        }
        
        
    }
    
    @IBAction func grassPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Grass]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Grass)
    }
    @IBAction func bugPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Bug]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Bug)
    }
    @IBAction func pyschicPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Psychic]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Psychic)
    }
    @IBAction func dragonPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Dragon]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Dragon)
    }
    @IBAction func icePressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ice]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ice)
    }
    @IBAction func groundPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ground]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ground)
    }
    @IBAction func electricPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Electric]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Electric)
    }
    @IBAction func fairyPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fairy]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fairy)
    }
    @IBAction func normalPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Normal]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Normal)
    }
    @IBAction func rockPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Rock]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Rock)
    }
    @IBAction func fightingPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fighting]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fighting)
    }
    @IBAction func firePressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Fire]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Fire)
    }
    @IBAction func unknownPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Unknown]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Unknown)
    }
    @IBAction func flyingPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Flying]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Flying)
    }
    @IBAction func steelPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Steel]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Steel)
    }
    @IBAction func ghostPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Ghost]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Ghost)
    }
    @IBAction func darkPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Dark]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Dark)
    }
    @IBAction func waterPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Water]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Water)
    }
    @IBAction func poisonPressed(_ sender: Any) {
        let pressed = typesPressed[PokeType.Poison]
        setBtnColor(pressed!, sender as! UIButton, PokeType.Poison)
    }
    
    func setBtnColor(_ pressed: Bool, _ sender: UIButton, _ poketype: PokeType) {
        if !pressed {
            sender.setTitleColor(UIColor.green, for: .normal)
            typesPressed[poketype] = true
        } else {
            sender.setTitleColor(UIColor.white, for: .normal)
            typesPressed[poketype] = false
            print(pressed)
        }
    }
    
    

}

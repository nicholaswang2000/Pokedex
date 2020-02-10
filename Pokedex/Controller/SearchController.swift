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
    
    var pokemonList:[Pokemon] = []
    var textToSearch = ""
    var searchOrRandom = 0 // 0 means random, 1 means category, 2 means name, 3 means number
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializes favoritesArray to empty when VC loads
        UserDefaults.standard.set([Int](), forKey: "favoritesArray")
        
        normalView.isHidden = false
        optionsView.isHidden = true
        
        // Gets rid of keyboard when tapped elsewhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        normalView.isHidden = false
        optionsView.isHidden = true
    }
    
    // function to get rid of keyboard when tapped elsewhere
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func generateRandom(_ sender: Any) {
        pokemonList = PokemonHelpers.generateRandomPokemon(20)
        //RandomPokemon.testWorking(pokemonList)
        searchOrRandom = 0
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        textToSearch = textfield.text ?? ""
        if textToSearch == "" {
            let alert = UIAlertController(title: "No input", message: "Please enter a valid input to search", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            optionsView.isHidden = false
        }
    }
    
    // Implement category search last
    
    @IBAction func nameSearch(_ sender: Any) {
        searchOrRandom = 2
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func numberSearch(_ sender: Any) {
        searchOrRandom = 3
        self.performSegue(withIdentifier: "GoToResultsVC", sender: self)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        optionsView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToResultsVC" {
            if searchOrRandom == 0 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = pokemonList
            } else if searchOrRandom == 2 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getNameSearchArray(textToSearch)
                print(textToSearch)
            } else if searchOrRandom == 3 {
                let destinationVC = segue.destination as! ResultController
                destinationVC.pokemonArray = PokemonHelpers.getNumberSearchArray(Int(textToSearch) ?? 0)
                print(textToSearch)
            }
        }
        
        
    }

}

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
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var minattTF: UITextField!
    @IBOutlet weak var maxattTF: UITextField!
    @IBOutlet weak var mindefTF: UITextField!
    @IBOutlet weak var maxdefTF: UITextField!
    @IBOutlet weak var minhTF: UITextField!
    @IBOutlet weak var maxhTF: UITextField!
    
    @IBOutlet weak var bugbtn: UIButton!
    @IBOutlet weak var icebtn: UIButton!
    @IBOutlet weak var darkbtn: UIButton!
    @IBOutlet weak var groundbtn: UIButton!
    @IBOutlet weak var dragonbtn: UIButton!
    @IBOutlet weak var grassbtn: UIButton!
    @IBOutlet weak var electricbtn: UIButton!
    @IBOutlet weak var normalbtn: UIButton!
    @IBOutlet weak var flyingbtn: UIButton!
    @IBOutlet weak var poisonbtn: UIButton!
    @IBOutlet weak var fightingbtn: UIButton!
    @IBOutlet weak var psychicbtn: UIButton!
    @IBOutlet weak var firebtn: UIButton!
    @IBOutlet weak var rockbtn: UIButton!
    @IBOutlet weak var fairybtn: UIButton!
    @IBOutlet weak var steelbtn: UIButton!
    @IBOutlet weak var ghostbtn: UIButton!
    @IBOutlet weak var waterbtn: UIButton!
    
    var randomPokemonList:[Pokemon] = []
    var typesToSearch:[PokeType] = []
    var typesPressed:[PokeType: Bool] = [PokeType.Bug:false, PokeType.Dark:false, PokeType.Dragon:false, PokeType.Electric:false, PokeType.Fairy:false, PokeType.Fighting:false, PokeType.Fire:false, PokeType.Flying:false, PokeType.Ghost:false, PokeType.Grass:false, PokeType.Ground:false, PokeType.Ice:false, PokeType.Normal:false, PokeType.Poison:false, PokeType.Psychic:false, PokeType.Rock:false, PokeType.Steel:false, PokeType.Water:false, PokeType.Unknown:false]
    var categoryArray: [PokeType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gets rid of keyboard when tapped elsewhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        nameTextfield.text = ""
        numberTextfield.text = ""
        minattTF.text = ""
        maxattTF.text = ""
        mindefTF.text = ""
        maxdefTF.text = ""
        minhTF.text = ""
        maxhTF.text = ""
        
        // Do any additional setup after loading the view.
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
}

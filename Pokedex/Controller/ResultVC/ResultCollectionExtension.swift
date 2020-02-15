//
//  ResultCollectionExtension.swift
//  Pokedex
//
//  Created by Nicholas Wang on 2/10/20.
//  Copyright © 2020 Nicholas Wang. All rights reserved.
//

import Foundation
import UIKit

extension ResultController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionCell", for: indexPath) as! PokemonCollectionCell
        let currPokemon = pokemonArray[indexPath.row]
        let imageURL = URL(string: currPokemon.imageUrl)
        cell.PokemonImage.image = try? UIImage(withContentsOfUrl: imageURL ?? URL(string: "https://static.thenounproject.com/png/1103191-200.png")!)
        cell.PokemonIDLabel.text = "#" + String(currPokemon.id)
        cell.PokemonNameLabel.text = currPokemon.name
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToDetailVC", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthRatio: CGFloat = 0.485
        let heightRatio: CGFloat = 0.25
        let frameWidth = PokemonCollection.frame.width
        let frameHeight = PokemonCollection.frame.height
        return CGSize(width: frameWidth * widthRatio, height: frameHeight * heightRatio)
    }
    
    
    
}

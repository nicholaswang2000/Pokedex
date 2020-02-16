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
        let imageURL = URL(string: currPokemon.largeUrl)
        cell.PokemonImage.kf.setImage(with: imageURL)
        cell.PokemonIDLabel.text = "#" + String(currPokemon.id)
        cell.PokemonNameLabel.text = currPokemon.name
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
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

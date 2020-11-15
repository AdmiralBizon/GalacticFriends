//
//  CharacterCollectionViewCell.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 14.11.2020.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var characterImageView: UIImageView!
    
    private func setProperties(for imageView: UIImageView) {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
    }
    
    func setCellConfiguration(with character: StarWarsCharacter) {
        
        var characterImage: UIImage?
        
        if let foundedImage = UIImage(named: character.name ?? "") {
            characterImage = foundedImage
        } else {
            if let unknownImage = UIImage(named: "Unknown") {
                characterImage = unknownImage
            }
        }
        
        DispatchQueue.main.async{
            self.characterImageView.image = characterImage
            self.setProperties(for: self.characterImageView)
        }
        
    }
    
}

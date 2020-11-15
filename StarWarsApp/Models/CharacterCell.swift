//
//  CharacterCell.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 14.11.2020.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    
    func setCellConfiguration(with character: StarWarsCharacter) {
        characterNameLabel.text = character.name
        
        if let foundedImage = UIImage(named: character.name ?? "") {
            DispatchQueue.main.async{
                self.characterImage.image = foundedImage
                self.characterImage.layer.cornerRadius = 5
//                self.characterImage.layer.masksToBounds = true
//                self.characterImage.clipsToBounds = true
            }
        } else {
            if let unknownImage = UIImage(named: "Unknown") {
                DispatchQueue.main.async{
                    self.characterImage.image = unknownImage
                    self.characterImage.layer.cornerRadius = 5
//                    self.characterImage.layer.masksToBounds = true
//                    self.characterImage.clipsToBounds = true
                }
            }
        }
        
    }
    
}

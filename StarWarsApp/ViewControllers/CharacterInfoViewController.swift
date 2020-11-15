//
//  CharacterInfoViewController.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 15.11.2020.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    @IBOutlet var characterImageView: UIImageView!
    
    @IBOutlet var characterBirthYearLabel: UILabel!
    @IBOutlet var characterHeightLabel: UILabel!
    @IBOutlet var characterMassLabel: UILabel!
    @IBOutlet var characterGenderLabel: UILabel!
    @IBOutlet var characterHairColorLabel: UILabel!
    @IBOutlet var characterSkinColorLabel: UILabel!
    
    var starWarsCharacter: StarWarsCharacter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCharacterInfo()
    }
    
    private func setCharacterInfo() {
        setImage()
        setText()
    }
    
    private func setImage() {
        
        var characterImage: UIImage?
        
        if let foundedImage = UIImage(named: starWarsCharacter.name ?? "") {
            characterImage = foundedImage
        } else {
            if let unknownImage = UIImage(named: "Unknown") {
                characterImage = unknownImage
            }
        }
        
        characterImageView.image = characterImage
        
    }
    
    private func setText() {
        title = starWarsCharacter.name
        characterBirthYearLabel.text = starWarsCharacter.birth_year
        characterHeightLabel.text = starWarsCharacter.height
        characterMassLabel.text = starWarsCharacter.mass
        characterGenderLabel.text = starWarsCharacter.gender
        characterHairColorLabel.text = starWarsCharacter.hair_color
        characterSkinColorLabel.text = starWarsCharacter.skin_color
    }
     
}

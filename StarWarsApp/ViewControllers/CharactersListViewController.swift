//
//  CharactersViewController.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 14.11.2020.
//

import UIKit

class CharactersListViewController: UIViewController {

    @IBOutlet var charactersCollectionView: UICollectionView!
    @IBOutlet var exitButton: UIButton!
    
    var charactersList: [StarWarsCharacter] = []
    
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch navigationController?.overrideUserInterfaceStyle {
        case .dark:
            exitButton.setTitleColor(.systemRed, for: .normal)
        default:
            exitButton.setTitleColor(.systemGreen, for: .normal)
        }
       
        charactersCollectionView.dataSource = self
        charactersCollectionView.delegate = self
        
        fetchCharactersList()

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let characterInfoVC = segue.destination as! CharacterInfoViewController
            characterInfoVC.starWarsCharacter = sender as? StarWarsCharacter
        }
    }
    
    // MARK: - Networking

    private func fetchCharactersList() {
        networkManager.fetchCharactersList { (result) in
            switch result {
            case .success(let characters):
                self.charactersList = characters
                self.charactersCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

// MARK: - CollectionView

extension CharactersListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charactersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as! CharacterCollectionViewCell
       
        let starWarsCharacter = charactersList[indexPath.item]
        cell.setCellConfiguration(with: starWarsCharacter)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let starWarsCharacter = charactersList[indexPath.item]
        performSegue(withIdentifier: "showDetails", sender: starWarsCharacter)
    }
        
}

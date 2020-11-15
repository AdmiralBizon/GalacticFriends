//
//  StartViewController.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 13.11.2020.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var lightSideButton: UIButton!
    @IBOutlet var darkSideButton: UIButton!
    
    var charactersList: [StarWarsCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
       
        if segue.identifier == "showLightSide" {
            navigationController.overrideUserInterfaceStyle = .light
        } else {
            navigationController.overrideUserInterfaceStyle = .dark
        }
          
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    private func setupUI() {
        if let backgroundImage = UIImage(named: "SkyBackground") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        lightSideButton.clipsToBounds = true
        darkSideButton.clipsToBounds = true
        
        lightSideButton.layer.cornerRadius = lightSideButton.frame.width / 2
        darkSideButton.layer.cornerRadius = darkSideButton.frame.width / 2
        
    }
    
}

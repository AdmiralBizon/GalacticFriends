//
//  NetworkManager.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 15.11.2020.
//

import Foundation

class NetworkManager {
        
    func fetchCharactersList(completion: @escaping (Result<[StarWarsCharacter], Error>) -> Void) {
        
        guard let url = URL(string: "https://swapi.dev/api/people/") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                do {
                    let webSiteDescription = try JSONDecoder().decode(
                        WebSiteDescription.self,
                        from: data
                    )
                    print(webSiteDescription)
                    completion(.success(webSiteDescription.results ?? []))
                    
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
            
        }.resume()
        
    }
    
}

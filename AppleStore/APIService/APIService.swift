//
//  DataManager.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result]) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                print("Failed to fetch Itunes", error.localizedDescription)
            }
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch let error {
                print("Faild to decode JSON",error.localizedDescription)
            }
        }.resume()
    }
}

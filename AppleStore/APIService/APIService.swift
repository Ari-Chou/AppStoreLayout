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
    
    func fetchEditorChoiseGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        fetch(urlStrig: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping(AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        fetch(urlStrig: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping(AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json"
        fetch(urlStrig: urlString, completion: completion)
    }
    
    // For Apps Page Header
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode([SocialApp].self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
    
    // MARK: - Fetching Helper
    fileprivate func fetch(urlStrig: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        guard let url = URL(string: urlStrig) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                print("Can not init the Data task", error.localizedDescription)
                completion(nil, error)
                return
            }
            guard let data = data else { return}
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(appGroup, nil)
            } catch let error {
                print("Can not decode the JSON", error.localizedDescription)
                completion(nil, error)
            }
        }.resume()
    }
}

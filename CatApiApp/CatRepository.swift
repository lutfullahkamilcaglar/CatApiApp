//
//  CatRepository.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 28/09/2022.
//

import Foundation

protocol CatRepositoryDelegate {
    func didUpdateCatData(catData: [CatModel])
    func didFailWithError(error: Error)
}

struct CatRepository {
    
    let urlString = "https://api.thecatapi.com/v1/images/search?limit=100&api_key=live_JxOOMGfIT1WVQSAUOzyUcR9OtwDaih5Tt7ShLFb5f4dxK493UOFDcpAmot1mLx4i"
    
    var delegate: CatRepositoryDelegate?
    
    func getData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                if let safeData = data {
                    if let decodedData: [CatModel] = try? JSONDecoder().decode([CatModel].self, from: safeData) {
                        self.delegate?.didUpdateCatData(catData: decodedData)
                    }
                }
            }
            task.resume()
        }
    }
    
    
}




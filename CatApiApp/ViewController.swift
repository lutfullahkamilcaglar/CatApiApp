//
//  ViewController.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 26/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var catImage: UIImageView!
    let urlString = "https://api.thecatapi.com/v1/images/search?limit=10&api_key=live_JxOOMGfIT1WVQSAUOzyUcR9OtwDaih5Tt7ShLFb5f4dxK493UOFDcpAmot1mLx4i"
    
    
    
//    let urlString2 = "https://api.thecatapi.com/v1/images/0XYvRd7oD"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
        
    }
    
    
    func fetchPhotos(){
        print("asdfaf")
        guard let url = URL(string: urlString) else {
            print("asdfaf2")
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error accessing: \(error)")
                return
            }
            if let responseValue = data {
                print(responseValue)
                if let jsonResult = try? JSONDecoder().decode([APIResponse].self, from: responseValue) {
                    DispatchQueue.main.async{ [weak self] in
                        self?.catImage.image = UIImage(data: jsonResult.first?.url)
                    }
                }
            }
        })
        task.resume()
    }
}


//
//  ViewController.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 26/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var catRepository = CatRepository()
    
    var catDataList: [CatModel] = []
    var currentCatIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catRepository.delegate = self
        catRepository.getData()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let tempIndex = currentCatIndex + 1
        if !(tempIndex >= catDataList.count) {
            currentCatIndex += 1
            updateImage()
        }
    }
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        let tempIndex = currentCatIndex - 1
        if !(tempIndex < 0) {
            currentCatIndex -= 1
            updateImage()
        }
    }
    
    func updateImage() {
        if !catDataList.isEmpty {
            let imageUrl = catDataList[currentCatIndex].url
            downloadImage(imageUrl: imageUrl) { image in
                DispatchQueue.main.async {
                    self.catImage.image = image
                }
            }
        }
    }
    
    func downloadImage(imageUrl: String, loadImage: @escaping (UIImage) -> ()) {
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: imageUrl) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        loadImage(image)
                    }
                }
            }
        }
    }
}

extension ViewController: CatRepositoryDelegate {

    func didUpdateCatData(catData: [CatModel]) {
        catDataList.append(contentsOf: catData)
        updateImage()
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

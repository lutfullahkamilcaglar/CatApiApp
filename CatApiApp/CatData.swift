//
//  CatData.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 27/09/2022.
//

import Foundation

struct APIResponse: Decodable {
    let breeds: [Breeds]
    let id: String
    let url: String
}

struct Breeds: Codable {
    let id: String
    let name: String
    let origin: String
    let description: String
    let reference_image_id: String
}

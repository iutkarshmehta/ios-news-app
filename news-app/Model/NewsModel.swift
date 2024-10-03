//
//  NewsModel.swift
//  news-app
//
//  Created by Mehta, Utkarsh on 03/10/24.
//

import Foundation

struct NewModelResponse : Codable{
    let status: String
    let sources: [NewsModel]
}

struct NewsModel: Codable {
    let id: String
    let name: String
    let description: String
}



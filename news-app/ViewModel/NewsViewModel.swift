//
//  NewsViewModel.swift
//  news-app
//
//  Created by Mehta, Utkarsh on 03/10/24.
//

import Foundation
import SwiftUI

class NewsViewModel : ObservableObject{
    @Published var news = [NewsModel]()
    //function to fetch news
    func fetchNews() async{
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines/sources?apiKey=4b7d4e57ff86425a9faa0ba0ee90f501")else{
            print("Pleae check the URL befor hitting the API")
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedNews = try? JSONDecoder().decode(
                NewModelResponse.self,
                from: data
            ){
                news = decodedNews.sources
                print("The value of newws arête: \(news)")
            }
            
        }catch{
            print("Something went wrong or the data did not get executed")
        }
        
        
    }
}

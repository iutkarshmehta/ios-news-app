//
//  ContentView.swift
//  news-app
//
//  Created by Mehta, Utkarsh on 02/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsViewModel = NewsViewModel()
    var body: some View {
       NavigationView{
            List(newsViewModel.news, id: \.id){
                news in
                VStack(alignment: .leading){
                    Text(news.name)
                    Text(news.description).foregroundColor(.gray)
                }
            }.task {
                await newsViewModel.fetchNews()
            }
            .navigationBarTitle("News").foregroundColor(.black)
       }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  NewsApp
//
//  Created by Prasad D Prabhu on 30/03/20.
//  Copyright © 2020 Prasad D Prabhu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var homeVM = HomeVM()
   
 
    var body: some View {
        NavigationView{

            List (homeVM.news , id :\.title){ news in
            VStack(alignment:.leading){
                
                Text("\(news.title ?? "")").lineLimit(.none).padding().font(.title)
                NavigationLink(destination: NewsDetailView(news: news)){
                   Spacer()
                    Text("")
                }.navigationBarTitle("Home")

               
                 Text("\(news.link ?? "")").lineLimit(.none).padding().font(.subheadline)
            }
                
            
                }
            
            .alert(isPresented: $homeVM.isError) {
                Alert(title: Text("Error"), message: Text(homeVM.error!), dismissButton: .cancel(Text("OK")))
            }
            
//        }
        }
        
    }

    
}

struct NewsDetailView : View{
    var news : HomeNews
    var body: some View {
//        Text("Detail Screen")
        WebView(url: news.link)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

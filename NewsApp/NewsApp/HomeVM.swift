//
//  NetworkService.swift
//  NewsApp
//
//  Created by Prasad D Prabhu on 30/03/20.
//  Copyright © 2020 Prasad D Prabhu. All rights reserved.
//

import Foundation
import FeedKit

class HomeVM : ObservableObject{
    @Published var news = [HomeNews]()
    
    @Published var error : String?
    @Published var isError : Bool = false
    init() {
        load()
    }
    
    func load(){
        let url = "https://www.livemint.com/rss/news"
        APIClient.callNews(url) { (news, errorString) in
            if let homeNews = news{
                DispatchQueue.main.async {
                     self.news = homeNews
                }
               
            }
            if let error = errorString{
                DispatchQueue.main.async {
                    self.error = error
                    self.isError = true
                }
            }
        }
    }
}

struct HomeNews : Identifiable{
    var id: ObjectIdentifier?
    
    var title : String?
    
    var description: String?
    var link : String?
    var error : String?
    init() {}
    init(json: RSSFeedItem) {
       
        title = json.title
        description = json.description
        link = json.link
    }
    
    
    static func getModels(json : [RSSFeedItem]?) -> [HomeNews]?{
//        for rssFeed in json{
//
//        }
        guard let jsonArray = json else{
            return nil
        }
     
           return  jsonArray.map {
                HomeNews(json: $0)
           }
        
    }
}

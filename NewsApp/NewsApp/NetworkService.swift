//
//  NetworkService.swift
//  NewsApp
//
//  Created by Prasad D Prabhu on 30/03/20.
//  Copyright © 2020 Prasad D Prabhu. All rights reserved.
//

import Foundation
import FeedKit

class APIClient{
    
      
    static func callNews(_ urlString: String, completion: @escaping ([HomeNews]?, String?) -> Void){
        let feedUrl = URL(string: urlString)!
          let parser = FeedParser(URL: feedUrl)
        parser.parseAsync { result in
            switch result{
            case .success(let feed):
                print(feed)
                let homeNews = HomeNews.getModels(json: feed.rssFeed?.items)
                print(homeNews)
              
                completion(homeNews, nil)
             
                break
             
            case .failure(let error):
                
                completion(nil,error.localizedDescription)
                break
                
            }
        }
    }
}
enum NetworkError : Error{
    case NoData
    case serverError
    
}
extension NetworkError : LocalizedError{
    var errorDescription: String?{
        switch self {
        case .NoData:
            return "Data is Nil"
        case .serverError:
            
            return "Error from server"
        
    }
    }
}

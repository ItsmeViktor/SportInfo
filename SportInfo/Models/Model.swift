//
//  Model.swift
//  SportInfo
//
//  Created by viktor on 12.04.2022.
//

import Foundation



//https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=3ac819046c0b4281bf15bcbb0554a296
var articles: [Article] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath =  URL(fileURLWithPath: path)
    
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=3ac819046c0b4281bf15bcbb0554a296")
    let session = URLSession(configuration: .default)
   let downloadTask = session.downloadTask(with: url!) {  (urlFile, responce, error) in
    if urlFile != nil {
       
       try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
        
        parseSport ()
        completionHandler?()
        
      }
    }
    downloadTask.resume()
}

func parseSport () {
    
   let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
  
        let AnyrootDictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if AnyrootDictionary == nil {
            return
        }
    
    
   let rootDictionary = AnyrootDictionary as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    
    if  let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        articles = returnArray
    }
   
}

//
//  File.swift
//  SportInfo
//
//  Created by viktor on 12.04.2022.
//
import Foundation

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    
    var publishedAt: String
    var sourceName: String
   
    init (dictionary: Dictionary<String, Any>) {
         author =  dictionary["author"] as? String ?? ""
         title =  dictionary["title"] as? String ?? ""
         description =  dictionary["description"] as? String ?? ""
         url =  dictionary["url"] as? String ?? ""
         publishedAt =  dictionary["publishedAt"] as? String ?? ""
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["" : ""]) ["name"] as? String ?? ""
        
    }
}
/*
 [
 -{
 -"source": {
 "id": null,
 "name": "MLB Trade Rumors"
 },
 "author": "Steve Adams",
 "title": "White Sox Put Lucas Giolito, AJ Pollock On Injured List - MLB Trade Rumors",
 "description": "White Sox ace Lucas Giolito and outfielder AJ Pollock are both headed to the injured list. Read more at MLB Trade Rumors.",
 "url": "https://www.mlbtraderumors.com/2022/04/white-sox-lucas-giolito-aj-pollock-injured-list.html",
 "urlToImage": "https://cdn.mlbtraderumors.com/files/2022/04/lucas-giolito-whitesox-1024x726.jpg",
 "publishedAt": "2022-04-12T18:32:13Z",
 "content": "1:25pm: It’ll be Lambert starting in place of Giolito this week, GM Rick Hahn tells reporters (Twitterlinks via Scott Merkin of MLB.com). Hahn added that the Sox are “not necessarily expecting him to… [+2249 chars]"
 }
 */

//
//  NewsModel.swift
//  BBC
//
//  Created by GlobalTMS on 21/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

let itemKey = "item"
let titleKey = "title"
let descriptionKey = "description"
let publishingDateKey = "pubDate"
let imageKey = "media:thumbnail"
let urlKey = "url"
let externalUrlKey = "link"

class NewsModel: ModelProtocol {
    
    var title: String?
    var description: String?
    var publishingDate: String?
    var image: String?
    var externalUrl: String?
    
    required init(_ dictionary: [String: String]) {
        title = dictionary[titleKey]
        description = dictionary[descriptionKey]
        publishingDate = dictionary[publishingDateKey]
        image = dictionary[imageKey]
        externalUrl = dictionary[externalUrlKey]
    }
    
    init(_ title: String, description: String, publishingDate: String, image: String, externalUrl: String) {
        self.title = title
        self.description = description
        self.publishingDate = publishingDate
        self.image = image
        self.externalUrl = externalUrl
    }
}

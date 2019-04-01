//
//  NewsServices.swift
//  BBC
//
//  Created by GlobalTMS on 21/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

let getNewsURL = "http://feeds.bbci.co.uk/news/world/rss.xml"

class NewsServices {
    func getNews(_ onSuccess: @escaping ([NewsModel]) -> Void, onFailure: @escaping () -> Void) {
        APIClient().request(getNewsURL, method: .get, onSuccess: { (xmlData) in
            let xmlParserHelper = XMLParserHelper.init(xmlData, xmlParserStruct: XMLParserStruct(parentKey: itemKey, childrenKeys: [titleKey, descriptionKey, imageKey, publishingDateKey, externalUrlKey], childrenDictionary: [imageKey: urlKey]))
            xmlParserHelper.createDictionary {
                let news: [NewsModel] = xmlParserHelper.parseToModel()
                onSuccess(news)
            }
        }) {
            onFailure()
        }
    }
}

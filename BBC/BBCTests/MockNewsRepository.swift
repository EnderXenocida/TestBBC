//
//  MockNewsRepository.swift
//  BBCTests
//
//  Created by GlobalTMS on 01/04/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation
@testable import BBC

class MockNewsRepository: NewsRepository {
    var news = [NewsModel]()
    
    func getNews(_ onSuccess: @escaping ([NewsModel]) -> Void) {
        news.append(NewsModel("Turkey local elections: Setback for Erdogan as his party loses capital",
                              description: "The opposition celebrates as the president\'s party loses the mayoralty of Ankara, and possibly Istanbul.",
                              publishingDate: "Mon, 01 Apr 2019 09:50:34 GMT",
                              image: "http://c.files.bbci.co.uk/2E31/production/_106252811_mediaitem106252810.jpg",
                              externalUrl: "https://www.bbc.co.uk/news/world-europe-47764393"))
        news.append(NewsModel("Kim Jong-nam murder: Vietnamese woman pleads guilty to lesser charge",
                              description: "Doan Thi Huong pleads guilty to a lesser charge of causing injury, and could be freed as soon as May.",
                              publishingDate: "Mon, 01 Apr 2019 06:00:44 GMT",
                              image: "http://c.files.bbci.co.uk/122A5/production/_106250447_kjntrial.jpg",
                              externalUrl: "https://www.bbc.co.uk/news/world-asia-47769962"))
        
        onSuccess(news)
    }
}

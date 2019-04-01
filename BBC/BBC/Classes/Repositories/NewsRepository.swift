//
//  NewsRepository.swift
//  BBC
//
//  Created by GlobalTMS on 01/04/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class NewsRepository {
    func getNews(_ onSuccess: @escaping ([NewsModel]) -> Void, onFailure: @escaping () -> Void) {
        NewsServices().getNews(onSuccess, onFailure: onFailure)
    }
}

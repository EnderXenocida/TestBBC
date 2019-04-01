//
//  NewsViewModel.swift
//  BBC
//
//  Created by GlobalTMS on 21/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class NewsViewModel: NewsViewModelProtocol {
    
    var refreshClosure: () -> Void = {}
    
    var news: [NewsModel] = [] {
        didSet {
            refreshClosure()
        }
    }
    
    func getNews(_ onFailure: @escaping () -> Void) {
        NewsRepository().getNews({ [weak self] (newsList) in
            self?.news = newsList
        }, onFailure: onFailure)
    }
    
    func getNew(_ row: Int) -> NewsModel? {
        return news[row]
    }
    
    func getNewsCount() -> Int {
        return news.count
    }
    
    func setRefreshClosure(_ refreshClosure: @escaping () -> Void) {
        self.refreshClosure = refreshClosure
    }
}

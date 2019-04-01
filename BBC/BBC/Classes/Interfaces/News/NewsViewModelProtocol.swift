//
//  NewsViewModelProtocol.swift
//  BBC
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

protocol NewsViewModelProtocol {
    var news: [NewsModel] { get set }
    var refreshClosure: () -> Void { get set }
    
    func getNews(_ onFailure: @escaping () -> Void)
    func getNew(_ row: Int) -> NewsModel?
    func getNewsCount() -> Int
    func setRefreshClosure(_ refreshClosure: @escaping () -> Void)
}

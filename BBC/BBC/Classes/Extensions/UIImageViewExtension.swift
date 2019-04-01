//
//  UIImageViewExtension.swift
//  BBC
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    func loadRemoteImage(_ url: String) {
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                self.image = image
            }
        }
    }
}

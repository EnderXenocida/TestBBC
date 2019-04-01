//
//  UIDeviceExtension.swift
//  BBC
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

extension UIDevice {
    var isPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
    }
    
    var isPortrait: Bool {
        switch self.orientation {
        case .portrait, .portraitUpsideDown:
            return true
        default:
            return false
        }
    }
}

//
//  NewsDetailsViewController.swift
//  BBC
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var wkWebView: WKWebView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadUrl()
    }
    
    func setUrl(_ urlString: String?) {
        self.urlString = urlString
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: private methods
private extension NewsDetailsViewController {
    func loadUrl() {
        if let urlString = self.urlString, let url = URL(string: urlString) {
            wkWebView.load(URLRequest(url: url))
        }
    }
}

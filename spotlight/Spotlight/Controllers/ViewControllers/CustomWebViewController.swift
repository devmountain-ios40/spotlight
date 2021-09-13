//
//  CustomWebViewController.swift
//  Spotlight
//
//  Created by Andrew Saeyang on 9/13/21.
//

import UIKit
import WebKit

class CustomWebViewController: UIViewController, WKNavigationDelegate {
    
    // MARK: - Properties
    var webView: WKWebView!
    var person: Person?
    
    // MARK: - Life Cycle
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentWebView()
    }
    
    func presentWebView(){
        guard let person = person else { return }
        let url = URL(string: "\(person.url ?? "")")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
}

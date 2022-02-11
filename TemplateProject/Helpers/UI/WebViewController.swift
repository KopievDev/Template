//
//  WebViewController.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        if #available(iOS 14.0, *) {
            prefs.allowsContentJavaScript = true
        } else {}
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
                                configuration: config)
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?

    var url: String = "https://www.mustdev.ru"
    override func loadView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sendReguest()
    }
    
    // MARK: - Helpers
    func set(url: String) {
        self.url = url
        sendReguest()
    }
    
    private func sendReguest() {
        guard let url = URL(string: url) else {return}
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
    
    
}

extension  WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {

    }
}

extension WebViewController {
    @objc static func goToTerm() {
        let vc = WebViewController()
        DispatchQueue.global(qos: .userInteractive).async {
            if  let url = Bundle.main.url(forResource: "terms", withExtension: "html")?.absoluteString {
                vc.set(url: url)
            }
            DispatchQueue.main.async {
                if let topVC = UIApplication.getTopViewController() {
                    print(topVC.description)
                    vc.title = "Terms of use"
                    topVC.present(vc, animated: true)
                }
            }
        }
    }
    
    @objc static func goToPrivacy() {
        let vc = WebViewController()
        DispatchQueue.global().async {
            if  let url = Bundle.main.url(forResource: "privacy", withExtension: "html")?.absoluteString {
                vc.set(url: url)
                
                vc.title = "Privacy policy"
                if let topVC = UIApplication.getTopViewController() {
                    print(topVC.description)
                    DispatchQueue.main.async {
                        topVC.present(vc, animated: true)

                    }

                }
            }
        }
        
    }
    
}

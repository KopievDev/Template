//
//  UIImageView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 19.03.2022.
//

import UIKit

extension UIImageView {
    
    typealias ImageCompletion = (UIImage?)->Void

    func setImage(urlString: String, placeholder: UIImage? = nil, withLoader: Bool = true, completion: @escaping ImageCompletion = {_ in }) {
        image = placeholder != nil ? placeholder:image
        loader(isOn: withLoader)
        let cache = URLCache.shared
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        if cache.cachedResponse(for: request) != nil {
            loadImageFromCache(request: request, completion: completion)
        } else {
            downloadImage(request: request, completion: completion)
        }
    }
    
    private func downloadImage(request: URLRequest, completion: @escaping ImageCompletion) {
        URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.loader(isOn: false)
                self.transition(to: image)
                completion(image)
            }
        }.resume()
    }
    
    private func loadImageFromCache(request: URLRequest, completion: @escaping ImageCompletion) {
        let cache = URLCache.shared
        DispatchQueue.global(qos: .userInteractive).async {
            guard let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.loader(isOn: false)
                self.image = image
                completion(image)
            }
        }
    }
    
    func transition(to image: UIImage?) {
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve]) { self.image = image }
    }
    
    func setImage(_ image: UIImage) {
         self.alpha = 0
         self.image = image
        UIView.animate(withDuration: 0.3) { self.alpha = 1 }
     }
    
   private func loader(isOn: Bool = true) {
        if isOn {
            addSubview(UIActivityIndicatorView(frame: bounds))
            (subviews.last as? UIActivityIndicatorView)?.startAnimating()
        } else {
            (subviews.last as? UIActivityIndicatorView)?.removeFromSuperview()
        }
    }
}


extension UIImage {
    
    convenience init?(url: String) {
        guard let url = URL(string: url), let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
}


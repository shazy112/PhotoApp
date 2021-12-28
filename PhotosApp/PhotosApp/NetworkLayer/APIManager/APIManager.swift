//
//  APIManager.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 06/07/2021.
//

import Foundation
public class ApiManager {
    
    private var baseURL = "https://pixabay.com/api/?"
    private var apiKey = "22380042-fec820902350a8e3e351b6121"
    static public var shared = ApiManager()
    private var request: URLRequest?
    init () {}
    
    private func createGetRequestWithURLComponents(url: URL,
                                                   parameters: [String: Any]?) -> URLRequest? {
        // creating url componenets so we can iterate through parameters to append in url request
        var components = URLComponents(string: url.absoluteString)
        var urlParameter: [String: Any] = ["key": "\(apiKey)"]
        // appending parameters with APIKey
        parameters?.forEach({urlParameter[$0.key] = $0.value})
        // appending queryItems to components to create components.url for URL Request
        components?.queryItems = urlParameter.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        // Creating url request to send to our API
        request = URLRequest(url: components?.url ?? url)
        request?.httpMethod = "GET"
        return request
    }
    
    // Sending get request and mapping data to Model
    public func sendRequest<T: Codable>(model: T.Type,
                                        parameters: [String: Any]? = nil,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: "\(baseURL)")!
        guard let urlRequest = createGetRequestWithURLComponents(url: url, parameters: parameters) else {return}
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            do {
                guard let responseData = data else { return }
                let model = try JSONDecoder().decode(model.self, from: responseData)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

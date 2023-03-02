//
//  BooksFetcher.swift
//  GoogleBooksFinder
//
//  Created by David Jangdal on 2023-03-02.
//

import Foundation
import CosyNetwork

final class BooksFetcher {

    private let dispatcher: APIDispatcher

    init(dispatcher: APIDispatcher) {
        self.dispatcher = dispatcher
    }

    func fetchBooks(with query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        let request = BookSearchRequest(search: query)
        dispatcher.dispatch(request) { response in
            switch response {
            case .failure(let error): completion(.failure(error))
            case .success(let response): completion(.success(response.0.items))
            }
        }
    }
}

fileprivate struct BookSearchRequest: APIDecodableRequest {
    typealias ResponseBodyType = MetaData
    typealias ErrorBodyType = BookSearchError

    var baseURLPath: String = "https://www.googleapis.com"
    var path: String {
        "/books/v1/volumes?q=\(search)"
    }
    var search: String

    var method: CosyNetwork.HTTPMethod = .get
    var successStatusCodes: [CosyNetwork.HTTPStatusCode] = [.ok]
    var failingStatusCodes: [CosyNetwork.HTTPStatusCode] = [.badRequest]
    var requestHeaders: [String : String]?
}

struct BookSearchError: Error, Decodable {
    let error: String
}

struct MetaData: Decodable {
    let items: [Book]
}

struct Book: Decodable {
    let kind: String
    let volumeInfo: VolumeInfo

    struct VolumeInfo: Decodable {
        let title: String
        let imageLinks: ImageLinks?

        struct ImageLinks: Decodable {
            let smallThumbnail: String?
        }
    }
}

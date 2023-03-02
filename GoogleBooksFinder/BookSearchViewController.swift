//
//  BookSearchViewController.swift
//  GoogleBooksFinder
//
//  Created by David Jangdal on 2023-03-02.
//

import Foundation
import UIKit

final class BookSearchViewController: UIViewController {
    private let booksFetcher: BooksFetcher

    init(booksFetcher: BooksFetcher) {
        self.booksFetcher = booksFetcher
        super.init(nibName: nil, bundle: nil)
        booksFetcher.fetchBooks(with: "example books") { result in
            switch result {
            case .failure(let error): print("Error while getting books \(error)")
            case .success(let books): print("Got \(books.count) books")
            }
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

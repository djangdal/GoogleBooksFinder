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
    private let tableView = UITableView()

    private var books: [Book] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    init(booksFetcher: BooksFetcher) {
        self.booksFetcher = booksFetcher
        super.init(nibName: nil, bundle: nil)
        booksFetcher.fetchBooks(with: "example books") { result in
            switch result {
            case .failure(let error): print("Error while getting books \(error)")
            case .success(let books): print("Got \(books.count) books")
                self.books = books
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }

    func setupTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookSearchCell.self, forCellReuseIdentifier: BookSearchCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension BookSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension BookSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BookSearchCell.identifier) as? BookSearchCell {
            cell.book = books[indexPath.row]
            return cell
        }

        return UITableViewCell()
    }
}

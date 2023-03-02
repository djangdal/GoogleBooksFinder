//
//  BookSearchCell.swift
//  GoogleBooksFinder
//
//  Created by David Jangdal on 2023-03-02.
//

import Foundation
import UIKit

final class BookSearchCell: UITableViewCell {
    static let identifier = "BookSearchCell"

    let titleLabel: UILabel = UILabel()
    let bookImageView: UIImageView = UIImageView()

    var book: Book? = nil {
        didSet {
            titleLabel.text =  book?.volumeInfo.title
            guard let urlString = book?.volumeInfo.imageLinks.smallThumbnail,
                  let url = URL(string: urlString) else { return }

            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.bookImageView.image = UIImage(data: data)
                }
            }
            dataTask.resume()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
        setupBookImageView()
    }

    func setupBookImageView() {
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(bookImageView)
        contentView.topAnchor.constraint(equalTo: bookImageView.topAnchor, constant: -10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 10).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -20).isActive = true
        contentView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
        titleLabel.textColor = .black
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        bookImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

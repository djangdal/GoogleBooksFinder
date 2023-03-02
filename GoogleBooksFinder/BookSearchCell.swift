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

    var book: Book? = nil {
        didSet {
            titleLabel.text =  book?.volumeInfo.title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
    }

    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -20).isActive = true
        contentView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0).isActive = true
        titleLabel.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

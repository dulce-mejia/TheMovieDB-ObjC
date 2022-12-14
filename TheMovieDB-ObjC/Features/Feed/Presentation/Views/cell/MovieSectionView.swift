//
//  MovieSectionView.swift
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 06/10/22.
//

import UIKit

@objc final class MovieSectionView: UICollectionReusableView {
    static let identifier = "header"

    enum Constants {
        static let fontSize: CGFloat = 18
    }

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .bold)
        return label
    }()

    @objc public var viewModel: MovieSectionViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            configureViews(viewModel: viewModel)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    @objc func configureViews(viewModel: MovieSectionViewModel) {
        titleLabel.text = viewModel.title
    }
}

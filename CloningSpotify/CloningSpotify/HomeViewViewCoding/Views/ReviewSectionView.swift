//
//  ReviewSectionView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: ReviewSectionView

final class ReviewSectionView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .background

        let card = ReviewCardView(
            iconImageName: "reviewIcon",
            subtitle: "#SPOTIFYWRAPPED",
            subtitleColor: UIColor.asset("subtitle"),
            title: "Your 2021 in review",
            titleColor: UIColor.asset("white2"),
            tiles: [
                ReviewTileData(
                    imageName: "review1",
                    label: "Your top Songs 2021",
                    labelColor: UIColor.asset("white2")
                ),
                ReviewTileData(
                    imageName: "review2",
                    label: "Your Artists Revealed",
                    labelColor: UIColor.asset("white2")
                ),
            ]
        )

        addSubview(card)
        activate([
            card.topAnchor.constraint(equalTo: topAnchor),
            card.leadingAnchor.constraint(equalTo: leadingAnchor),
            card.trailingAnchor.constraint(equalTo: trailingAnchor),
            card.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

private struct ReviewTileData {
    let imageName: String; let label: String; let labelColor: UIColor
}

// MARK: ReviewCardView

private final class ReviewCardView: UIView {

    private let iconImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 4
        return img
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2).weighted(.semibold)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0 // quebra a linha
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3).weighted(.bold)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0 // quebra a linha
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    private lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [subtitleLabel, titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        return stack
    }()

    private lazy var headerRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView, textStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()

    // Album grid 2 colunas, sem scroll
    private let albumRow: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .top
        return stack
    }()

    init(iconImageName: String, subtitle: String, subtitleColor: UIColor, title: String, titleColor: UIColor, tiles: [ReviewTileData]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .background

        iconImageView.image = UIImage.asset(iconImageName)
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = subtitleColor
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.accessibilityTraits = .header

        tiles.forEach {
            albumRow.addArrangedSubview(
                ReviewAlbumTileView(
                    imageName: $0.imageName,
                    label: $0.label,
                    labelColor: $0.labelColor
                )
            )
        }

        addSubview(headerRow)
        addSubview(albumRow)

        activate([
            // Ícone: 55 × 55 fixo (largura fixa e aspecto 1:1)
            iconImageView.widthAnchor.constraint(equalToConstant: 55),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor, multiplier: 1),

            // Header row: top + margens laterais
            headerRow.topAnchor.constraint(equalTo: topAnchor),
            headerRow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerRow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            // Grid: logo abaixo do header row
            albumRow.topAnchor.constraint(equalTo: headerRow.bottomAnchor, constant: 12),
            albumRow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumRow.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: ReviewAlbumTileView

private final class ReviewAlbumTileView: UIView {
    
    private static let tileWidth: CGFloat = 145

    private let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1).weighted(.semibold)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    init(imageName: String, label: String, labelColor: UIColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage.asset(imageName)
        nameLabel.text = label
        nameLabel.textColor = labelColor

        isAccessibilityElement = true
        accessibilityLabel = label
        accessibilityTraits = .image

        addSubview(imageView)
        addSubview(nameLabel)

        activate([
            widthAnchor.constraint(equalToConstant: Self.tileWidth),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

//
//  PlaylistSectionView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: PlaylistSectionView

final class PlaylistSectionView: UIView {

    private static let basePattern: [(img: String, label: String)] = [
        ("playlist1", "Ed Sheeran, Big Sean, Juice WRLD, Post Malone"),
        ("playlist2", "Mitski, Tame Impala, Glass Animals, Charli XCX"),
        ("playlist3", "AC/DC, Bon Jovi, Creedence Clearwater"),
    ]

    private let sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Editor's picks"
        label.font = UIFont.preferredFont(forTextStyle: .title2).weighted(.bold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("white2")
        label.numberOfLines = 0
        label.accessibilityTraits = .header
        return label
    }()

    public let hScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.alwaysBounceHorizontal = true
        return scroll
    }()

    public let cardsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 14
        stack.alignment = .top
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .background

        addSubview(sectionTitle)
        addSubview(hScroll)
        hScroll.addSubview(cardsStack)

        activate([
            sectionTitle.topAnchor.constraint(equalTo: topAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sectionTitle.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),

            hScroll.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 14),
            hScroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            hScroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            hScroll.bottomAnchor.constraint(equalTo: bottomAnchor),

            cardsStack.topAnchor.constraint(equalTo: hScroll.topAnchor),
            cardsStack.leadingAnchor.constraint(equalTo: hScroll.leadingAnchor),
            cardsStack.trailingAnchor.constraint(equalTo: hScroll.trailingAnchor),
            cardsStack.bottomAnchor.constraint(equalTo: hScroll.bottomAnchor),
            cardsStack.heightAnchor.constraint(equalTo: hScroll.heightAnchor),
        ])

        // 3 × padrão = 9 cards
        Array(repeating: Self.basePattern, count: 3)
            .flatMap { $0 }
            .forEach {
                cardsStack.addArrangedSubview(
                    PlaylistCardView(imageName: $0.img, label: $0.label)
                )
            }
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: PlaylistCardView

private final class PlaylistCardView: UIView {

    private static let cardWidth: CGFloat = 145

    private let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()

    private let descripitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("subtitle")
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    init(imageName: String, label: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage.asset(imageName)
        descripitionLabel.text  = label

        isAccessibilityElement = true
        accessibilityLabel = label
        accessibilityTraits = [.image, .button]

        addSubview(imageView)
        addSubview(descripitionLabel)

        activate([
            widthAnchor.constraint(equalToConstant: Self.cardWidth),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),

            descripitionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            descripitionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descripitionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descripitionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

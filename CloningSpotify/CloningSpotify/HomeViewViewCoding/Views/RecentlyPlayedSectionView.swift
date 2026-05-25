//
//  RecentlyPlayedSectionView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: RecentlyPlayedSectionView

final class RecentlyPlayedSectionView: UIView {

    private struct ItemSpec {
        let imageName: String
        let label: String
        let alignment: NSTextAlignment
    }

    // cada item especifica o alinhamento de label:
    // músicas: .natural (leading em LTR, trailing em RTL, automático) e artistas: .center
    private static let basePattern: [ItemSpec] = [
        ItemSpec(imageName: "music1", label: "1(Remastered)", alignment: .natural),
        ItemSpec(imageName: "artist1", label: "Lana Del Ray", alignment: .center),
        ItemSpec(imageName: "artist2", label: "Marvin Gaye", alignment: .center),
        ItemSpec(imageName: "music2", label: "Indie Pop", alignment: .natural),
    ]

    public let hScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.alwaysBounceHorizontal = true
        return scroll
    }()

    public let itemsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .top
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .background

        addSubview(hScroll)
        hScroll.addSubview(itemsStack)

        activate([
            hScroll.topAnchor.constraint(equalTo: topAnchor),
            hScroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            hScroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            hScroll.bottomAnchor.constraint(equalTo: bottomAnchor),

            itemsStack.topAnchor.constraint(equalTo: hScroll.topAnchor),
            itemsStack.leadingAnchor.constraint(equalTo: hScroll.leadingAnchor),
            itemsStack.trailingAnchor.constraint(equalTo: hScroll.trailingAnchor),
            itemsStack.bottomAnchor.constraint(equalTo: hScroll.bottomAnchor),
            itemsStack.heightAnchor.constraint(equalTo: hScroll.heightAnchor),
        ])

        // 4 × padrão = 16 itens
        Array(repeating: Self.basePattern, count: 4)
            .flatMap { $0 }
            .forEach {
                itemsStack.addArrangedSubview(
                    RecentlyPlayedItemView(
                        imageName:  $0.imageName,
                        labelText:  $0.label,
                        alignment:  $0.alignment
                    )
                )
            }
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: RecentlyPlayedItemView

private final class RecentlyPlayedItemView: UIView {

    private static let imgSize: CGFloat = 102

    private let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2).weighted(.semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("white2")
        label.numberOfLines = 0 // quebra a linha, sem reticências
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    init(imageName: String, labelText: String, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        imageView.image = UIImage.asset(imageName)
        nameLabel.text = labelText
        nameLabel.textAlignment = alignment 

        isAccessibilityElement = true
        accessibilityLabel = labelText
        accessibilityTraits = .image

        addSubview(imageView)
        addSubview(nameLabel)

        let size = Self.imgSize
        activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: size),
            imageView.heightAnchor.constraint(equalToConstant: size),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            widthAnchor.constraint(equalToConstant: size),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}


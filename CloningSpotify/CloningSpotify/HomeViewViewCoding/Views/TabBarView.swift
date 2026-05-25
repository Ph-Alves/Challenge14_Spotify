//
//  TabBarView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: TabBarView

final class TabBarView: UIView {

    private let topBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appSeparator
        return view
    }()

    private let itemsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .top
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .appBackground

        addSubview(topBorder)
        addSubview(itemsStack)

        activate([
            topBorder.topAnchor.constraint(equalTo: topAnchor),
            topBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBorder.heightAnchor.constraint(equalToConstant: 0.5),

            itemsStack.topAnchor.constraint(equalTo: topBorder.bottomAnchor, constant: 8),
            itemsStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemsStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemsStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4),
        ])

        let tabs: [(icon: String, label: String, colorName: String)] = [
            ("house.fill", "Home", "white2"),
            ("magnifyingglass", "Search", "tabUnselected"),
            ("books.vertical.fill", "Your Library", "tabUnselected"),
        ]
        tabs.forEach {
            itemsStack.addArrangedSubview(
                TabItemView(
                    systemName: $0.icon,
                    label: $0.label,
                    color: UIColor.asset($0.colorName),
                    isSelected: $0.colorName == "white2")
            )
        }
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: TabItemView

private final class TabItemView: UIView {

    private let iconView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0 // quebra a linha
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    init(systemName: String, label: String, color: UIColor, isSelected: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        iconView.image = UIImage(systemName: systemName, withConfiguration: UIImage.SymbolConfiguration(textStyle: .body))
        iconView.tintColor = color
        titleLabel.text = label
        titleLabel.textColor = color

        isAccessibilityElement = true
        accessibilityLabel = label
        accessibilityTraits = isSelected ? [.button, .selected] : .button

        let stack = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        addSubview(stack)

        activate([
            iconView.widthAnchor.constraint(equalToConstant: 24),
            iconView.heightAnchor.constraint(equalToConstant: 24),

            stack.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: MusicTabBar

/// Tab Bar usando UITabBar ao invés de uma View normal
final class TabBar: UITabBar {

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupItems()
        applyAppearance()
        // Atualiza a appearance quando o usuário altera o tamanho do texto
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(contentSizeCategoryDidChange),
            name: UIContentSizeCategory.didChangeNotification,
            object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    deinit { NotificationCenter.default.removeObserver(self) }

    // MARK: Items

    private func setupItems() {
        // SymbolConfiguration com textStyle garante que os ícones também escalem com Dynamic Type
        let cfg = UIImage.SymbolConfiguration(textStyle: .body)

        let home = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill", withConfiguration: cfg),
            tag: 0
        )
        let search = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass", withConfiguration: cfg),
            tag: 1
        )
        let library = UITabBarItem(
            title: "Your Library",
            image: UIImage(systemName: "books.vertical.fill", withConfiguration: cfg),
            tag: 2
        )

        items = [home, search, library]
        selectedItem = home // Home selecionado por padrão
    }

    // MARK: Appearance

    /// Re-executado sempre que Dynamic Type muda para que a fonte dos labels
    private func applyAppearance() {
        let selectedColor = UIColor.asset("white2")
        let normalColor   = UIColor.asset("tabUnselected")

        tintColor = selectedColor
        unselectedItemTintColor = normalColor

        let font = UIFont.preferredFont(forTextStyle: .caption2)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .appBackground

        appearance.shadowColor = .appSeparator

        let configure: (UITabBarItemAppearance) -> Void = { item in
            // Ícone
            item.selected.iconColor = selectedColor
            item.normal.iconColor   = normalColor
            // Label – mesma fonte em ambos os estados; só a cor difere
            item.selected.titleTextAttributes = [
                .foregroundColor: selectedColor,
                .font: font,
            ]
            item.normal.titleTextAttributes = [
                .foregroundColor: normalColor,
                .font: font,
            ]
        }

        // UITabBar usa três variantes de layout dependendo de orientação e tela
        configure(appearance.stackedLayoutAppearance)
        configure(appearance.inlineLayoutAppearance)
        configure(appearance.compactInlineLayoutAppearance)

        standardAppearance = appearance
        if #available(iOS 15.0, *) {
            scrollEdgeAppearance = appearance
        }
    }

    // MARK: Dynamic Type observer

    @objc private func contentSizeCategoryDidChange() {
        applyAppearance()
    }
}

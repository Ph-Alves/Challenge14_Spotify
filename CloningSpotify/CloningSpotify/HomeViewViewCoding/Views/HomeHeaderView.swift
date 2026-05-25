//
//  HomeHeaderView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: HomeHeaderView

final class HomeHeaderView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recently Played"
        label.font = UIFont.preferredFont(forTextStyle: .title3).weighted(.bold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("white2")
        label.numberOfLines = 0 // quebra a linha
        label.setContentHuggingPriority(.defaultLow,  for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.accessibilityTraits = .header
        return label
    }()

    private func makeIconButton(system: String, label: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: system,withConfiguration: UIImage.SymbolConfiguration(textStyle: .title3)),for: .normal)
        button.tintColor = UIColor.asset("white2")
        button.accessibilityLabel = label
        activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
        return button
    }

    private lazy var iconStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeIconButton(system: "bell", label: "Notificações"),
            makeIconButton(system: "clock.arrow.circlepath", label: "Histórico"),
            makeIconButton(system: "gearshape", label: "Configurações"),
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.setContentHuggingPriority(.required, for: .horizontal)
        stack.setContentCompressionResistancePriority(.required, for: .horizontal)
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .background
        addSubview(titleLabel)
        addSubview(iconStack)

        activate([
            // Ícones: trailing fixo, sempre visíveis
            iconStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            iconStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconStack.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),

            // Título: preenche o espaço disponível, quebra a linha se necessário
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: iconStack.leadingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

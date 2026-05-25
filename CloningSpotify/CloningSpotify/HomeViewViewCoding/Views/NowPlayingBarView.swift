//
//  NowPlayingBarView.swift
//  SpotifyHome
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: NowPlayingBarView

final class NowPlayingBarView: UIView {

    // Capa em miniatura
    private let albumMiniCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 6
        img.image = UIImage.asset("music1")
        img.setContentHuggingPriority(.required, for: .horizontal)
        img.setContentCompressionResistancePriority(.required, for: .horizontal)
        return img
    }()

   private let songTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From Me to You - Mono / Remastered"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline).weighted(.semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("white2")
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.required,   for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    private let bluetoothIconView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage.asset("bluetoothHomePlayingBar")
        img.setContentHuggingPriority(.required, for: .horizontal)
        img.setContentCompressionResistancePriority(.required, for: .horizontal)
        return img
    }()

    private let bluetoothLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BEATSPILL+"
        label.font = UIFont.preferredFont(forTextStyle: .caption2).weighted(.semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.asset("spotifyGreen")
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    private lazy var artistRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bluetoothIconView, bluetoothLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()

    private lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [songTitleLabel, artistRow])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        stack.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stack
    }()

    private lazy var bluetoothButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.asset("bluetoothHomePlayingBar").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.asset("spotifyGreen")
        button.accessibilityLabel = "Bluetooth"
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        activate([
            button.widthAnchor.constraint(equalToConstant: 36),
            button.heightAnchor.constraint(equalToConstant: 36),
        ])
        return button
    }()

    private lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pause.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title2)), for: .normal)
        button.tintColor = UIColor.asset("white2")
        button.accessibilityLabel = "Pausar"
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        activate([
            button.widthAnchor.constraint(equalToConstant: 36),
            button.heightAnchor.constraint(equalToConstant: 36),
        ])
        return button
    }()

    private let progressTrack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.asset("progressTrack")
        view.layer.cornerRadius = 1.5
        return view
    }()

    private let progressFill: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.asset("progressFill")
        view.layer.cornerRadius = 1.5
        return view
    }()

    // Horizontal row: Cover - textStack - btButton - pauseButton
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            albumMiniCover,
            textStack,
            bluetoothButton,
            playPauseButton,
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.asset("backgroundPlayingNow")
        layer.cornerRadius = 12
        clipsToBounds = true

        isAccessibilityElement = false
        accessibilityLabel = "Tocando agora: From Me to You / Remastered por BEATSPILL+"

        addSubview(contentStack)
        addSubview(progressTrack)
        progressTrack.addSubview(progressFill)

        activate([
            // ContentStack: margem interna, empurra barra para baixo
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            contentStack.bottomAnchor.constraint(equalTo: progressTrack.topAnchor, constant: -10),

            // Mini cover fixa
            albumMiniCover.widthAnchor.constraint(equalToConstant: 44),
            albumMiniCover.heightAnchor.constraint(equalToConstant: 44),

            // Bluetooth icon conectado
            bluetoothIconView.widthAnchor.constraint(equalToConstant: 14),
            bluetoothIconView.heightAnchor.constraint(equalToConstant: 14),

            // Progress track na base
            progressTrack.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressTrack.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressTrack.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressTrack.heightAnchor.constraint(equalToConstant: 3),

            // Fill: 55 %
            progressFill.topAnchor.constraint(equalTo: progressTrack.topAnchor),
            progressFill.leadingAnchor.constraint(equalTo: progressTrack.leadingAnchor),
            progressFill.bottomAnchor.constraint(equalTo: progressTrack.bottomAnchor),
            progressFill.widthAnchor.constraint(equalTo: progressTrack.widthAnchor, multiplier: 0.55),
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
}

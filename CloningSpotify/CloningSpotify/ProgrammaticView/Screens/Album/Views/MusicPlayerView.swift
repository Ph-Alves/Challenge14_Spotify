//
//  MusicPlayerView.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/20/26.
//

import UIKit

final class MusicPlayerView: UIView {
    
    let musicImg: UIImageView
    let musicName: String
    let musicAuthor: String
    
    let hStack = UIStackView()
    
    let allLabelsVStack = UIStackView()
    
    let labelsStackView = UIStackView()
    let musicNameLabel = UILabel()
    let musicDotLabel = UILabel()
    let musicAuthorLabel = UILabel()
    
    let bluetoothHStack = UIStackView()
    let bluetoothImage = UIImageView()
    let bluetoothLabel = UILabel()
    
    
    let spacer = UIView()
    
    
    let bluetoothAndPauseHStack = UIStackView()
    let bigBluetoothImage = UIImageView()
    let pauseImage = UIImageView()
    
    
    init(music: Music) {
        if let musicImg = UIImage(named: music.image) {
            self.musicImg = UIImageView(image: musicImg)
        } else {
            self.musicImg = UIImageView(image: UIImage(systemName: "music.note"))
            self.musicImg.tintColor = .gray
        }
        
        self.musicName = music.name
        self.musicAuthor = music.author
        
        super.init(frame: .zero)
        
        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) {
            (self: Self, previousTraitCollection: UITraitCollection) in
            
            let isAcessibility = self.traitCollection.preferredContentSizeCategory.isAccessibilityCategory
            
            self.bluetoothLabel.isHidden = isAcessibility
            self.bluetoothImage.isHidden = isAcessibility
        }
        
        
        setupViews()
        setupComponentsSettings()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 15/255, green: 25/255, blue: 41/255, alpha: 1)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        addSubview(hStack)
        
        hStack.addArrangedSubview(musicImg)
        
        hStack.addArrangedSubview(allLabelsVStack)
        
        allLabelsVStack.addArrangedSubview(labelsStackView)
        labelsStackView.addArrangedSubview(musicNameLabel)
        labelsStackView.addArrangedSubview(musicDotLabel)
        labelsStackView.addArrangedSubview(musicAuthorLabel)
        
        allLabelsVStack.addArrangedSubview(bluetoothHStack)
        bluetoothHStack.addArrangedSubview(bluetoothImage)
        bluetoothHStack.addArrangedSubview(bluetoothLabel)
        
        hStack.addArrangedSubview(spacer)
        
        hStack.addArrangedSubview(bluetoothAndPauseHStack)
        
        bluetoothAndPauseHStack.addArrangedSubview(bigBluetoothImage)
        bluetoothAndPauseHStack.addArrangedSubview(pauseImage)
    }

    
    private func setupComponentsSettings() {
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.spacing = 8
        
        allLabelsVStack.axis = .vertical
        allLabelsVStack.alignment = .leading
        allLabelsVStack.spacing = 4
        
        //COISAS DAS LABELS NOME DE MUSICA E NOME DO AUTOR
        musicNameLabel.attributedText = NSAttributedString(
            string: "\(musicName)",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFontMetrics(forTextStyle: .headline)
                    .scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .semibold))

            ])
        musicNameLabel.adjustsFontForContentSizeCategory = true
        musicNameLabel.numberOfLines = 0
        musicNameLabel.lineBreakMode = .byWordWrapping
        
        musicDotLabel.attributedText = NSAttributedString(
            string: "•",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFontMetrics(forTextStyle: .headline)
                    .scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .semibold))

            ])
        musicDotLabel.adjustsFontForContentSizeCategory = true
        musicDotLabel.numberOfLines = 0
        musicDotLabel.lineBreakMode = .byWordWrapping
        
        
        musicAuthorLabel.attributedText = NSAttributedString(
            string: musicAuthor,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFontMetrics(forTextStyle: .subheadline)
                        .scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .regular))
            ])
        musicAuthorLabel.adjustsFontForContentSizeCategory = true
        musicAuthorLabel.numberOfLines = 1
        musicAuthorLabel.lineBreakMode = .byTruncatingTail
        
        labelsStackView.axis = .horizontal
        labelsStackView.spacing = 6
        
        //AS LABELS VERDES EMBAIXO
        bluetoothImage.image = UIImage(named: "bluetoothImage")
        
        bluetoothLabel.attributedText = NSAttributedString(
            string: "BEATSPILL+",
            attributes: [
                .foregroundColor: UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1),
                .font: UIFontMetrics(forTextStyle: .subheadline)
                        .scaledFont(for: UIFont.systemFont(ofSize: 10, weight: .regular))
            ])
        bluetoothLabel.adjustsFontForContentSizeCategory = true
        bluetoothLabel.numberOfLines = 1
        bluetoothLabel.lineBreakMode = .byTruncatingTail
        
        bluetoothHStack.axis = .horizontal
        bluetoothHStack.spacing = 4
        
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        bluetoothAndPauseHStack.axis = .horizontal
        bluetoothAndPauseHStack.spacing = 32
        
        bigBluetoothImage.image = UIImage(named: "bluetoothImage")
        pauseImage.image = UIImage(named: "pauseImage")
    }
    
    private func setupConstraints() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
        musicImg.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            musicImg.widthAnchor.constraint(equalToConstant: 39),
            musicImg.heightAnchor.constraint(equalToConstant: 39),
            
            bluetoothImage.widthAnchor.constraint(equalToConstant: 6),
            bluetoothImage.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
}

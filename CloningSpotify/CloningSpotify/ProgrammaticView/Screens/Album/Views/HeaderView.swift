//
//  HeaderView.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/18/26.
//

import UIKit

final class HeaderView: UIView {
    
    let vStack = UIStackView()
    
    let albumIMG = UIImageView(image: UIImage(named: "albumImage"))
    
    let succintDescriptionLabel = UILabel()
    
    let spotifyIMG = UIImageView(image: UIImage(named: "spotifyImage"))
    let spotifyLabel = UILabel()
    let spotifyHStack = UIStackView()
    
    let likesAndHoursLabel = UILabel()
    
    let playButton = UIButton()
    
    let buttonsHStack = UIStackView()
    let heartButton = UIButton()
    let downloadButton = UIButton()
    let moreOptionsButton = UIButton()
    let spacer = UIView()
    
    let buttonsAndLabelVStack = UIStackView()
    
    let smallButtonsHStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupComponentsSettings()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
//        addSubview(albumIMG)
//        albumIMG.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(succintDescriptionLabel)
//        succintDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(spotifyIMG)
//        spotifyIMG.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(spotifyLabel)
//        spotifyLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(likesAndHoursLabel)
//        likesAndHoursLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(playButton)
//        playButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(heartButton)
//        heartButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(downloadButton)
//        downloadButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(moreOptionsButton)
//        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(vStack)
        
        vStack.addArrangedSubview(albumIMG)
        vStack.addArrangedSubview(succintDescriptionLabel)
        
        vStack.addArrangedSubview(spotifyHStack)
        
        spotifyHStack.addArrangedSubview(spotifyIMG)
        spotifyHStack.addArrangedSubview(spotifyLabel)
        
        vStack.addArrangedSubview(buttonsHStack)
        
        buttonsHStack.addArrangedSubview(buttonsAndLabelVStack)
        
        buttonsAndLabelVStack.addArrangedSubview(likesAndHoursLabel)
        
        buttonsAndLabelVStack.addArrangedSubview(smallButtonsHStack)
        
        smallButtonsHStack.addArrangedSubview(heartButton)
        smallButtonsHStack.addArrangedSubview(downloadButton)
        smallButtonsHStack.addArrangedSubview(moreOptionsButton)
        
        buttonsHStack.addArrangedSubview(spacer)
        buttonsHStack.addArrangedSubview(playButton)
    }
    
    private func setupComponentsSettings() {
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.spacing = 16
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        succintDescriptionLabel.attributedText = NSAttributedString(
            string: "New and approved indie pop. Cover: No Rome",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFontMetrics(forTextStyle: .caption1)
                .scaledFont(for: .systemFont(ofSize: 13, weight: .semibold))
            ])
        succintDescriptionLabel.adjustsFontForContentSizeCategory = true
        succintDescriptionLabel.numberOfLines = 0
        succintDescriptionLabel.lineBreakMode = .byWordWrapping
        
        spotifyHStack.axis = .horizontal
        spotifyHStack.alignment = .leading
        spotifyHStack.spacing = 8
        
        spotifyLabel.attributedText = NSAttributedString(
            string: "Spotify",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFontMetrics(forTextStyle: .headline)
                .scaledFont(for: .systemFont(ofSize: 16, weight: .bold))
            ])
        spotifyLabel.adjustsFontForContentSizeCategory = true
        
        buttonsHStack.axis = .horizontal
        buttonsHStack.alignment = .bottom
        buttonsHStack.distribution = .fill
        buttonsHStack.spacing = 16
        
        buttonsAndLabelVStack.axis = .vertical
        buttonsAndLabelVStack.alignment = .leading
        buttonsAndLabelVStack.spacing = 16
        
        smallButtonsHStack.axis = .horizontal
        smallButtonsHStack.alignment = .fill
        smallButtonsHStack.spacing = 32
        
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        likesAndHoursLabel.attributedText = NSAttributedString(
            string: "1,629,592 likes • 6h 48m",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFontMetrics(forTextStyle: .caption1)
                .scaledFont(for: .systemFont(ofSize: 13, weight: .semibold))
            ])
        likesAndHoursLabel.adjustsFontForContentSizeCategory = true
        likesAndHoursLabel.numberOfLines = 0
        likesAndHoursLabel.lineBreakMode = .byWordWrapping
        
        spotifyIMG.contentMode = .scaleAspectFit
        
        playButton.setImage(UIImage(named: "playButtonImage"), for: .normal)
        playButton.imageView?.contentMode = .scaleAspectFit
        
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        downloadButton.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        moreOptionsButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        
        let baseFont = UIFont.systemFont(ofSize: 22) // base

        let scaledFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: baseFont)

        let config = UIImage.SymbolConfiguration(font: scaledFont)
        
        
        heartButton.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        downloadButton.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        moreOptionsButton.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        
        heartButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        downloadButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        moreOptionsButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        heartButton.tintColor = .lightGray
        downloadButton.tintColor = .lightGray
        moreOptionsButton.tintColor = .lightGray
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            albumIMG.heightAnchor.constraint(equalTo: albumIMG.widthAnchor),

            spotifyIMG.widthAnchor.constraint(equalToConstant: 20),
            spotifyIMG.heightAnchor.constraint(equalToConstant: 20),
           
            playButton.widthAnchor.constraint(equalToConstant: 56),
            playButton.heightAnchor.constraint(equalToConstant: 59)
        ])
    }
}

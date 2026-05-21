//
//  MusicCardView.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/18/26.
//

import UIKit

final class MusicCardView: UIStackView {
    
    let musicImg: UIImageView
    let musicName: String
    let musicAuthor: String
    
    let musicNameLabel = UILabel()
    let musicAuthorLabel = UILabel()
    let labelsStackView = UIStackView()
    
    let spacer = UIView()
    
    let moreOptionsButton = UIButton()
    
    
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
        
        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            
            let isAcessibility = self.traitCollection.preferredContentSizeCategory.isAccessibilityCategory
            self.axis = isAcessibility ? .vertical : .horizontal
            self.alignment = isAcessibility ? .leading : .fill
            self.distribution = .fill
            
            self.alignment = isAcessibility ? .leading : .center
        }
        
        setupViews()
        setupComponentsSettings()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        
        addArrangedSubview(musicImg)
        musicImg.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(labelsStackView)
        labelsStackView.addArrangedSubview(musicNameLabel)
        labelsStackView.addArrangedSubview(musicAuthorLabel)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(spacer)
        
        addArrangedSubview(moreOptionsButton)
        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupComponentsSettings() {
        axis = traitCollection.preferredContentSizeCategory.isAccessibilityCategory ? .vertical : .horizontal
        alignment = traitCollection.preferredContentSizeCategory.isAccessibilityCategory ? .leading : .center
        spacing = 8
        
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        musicNameLabel.attributedText = NSAttributedString(
            string: musicName,
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFontMetrics(forTextStyle: .subheadline)
                    .scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .semibold))
            ])
        musicNameLabel.adjustsFontForContentSizeCategory = true
        musicNameLabel.numberOfLines = 0
        musicNameLabel.lineBreakMode = .byWordWrapping
        
        
        musicAuthorLabel.attributedText = NSAttributedString(
            string: musicAuthor,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFontMetrics(forTextStyle: .subheadline)
                        .scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .regular))
            ])
        musicAuthorLabel.adjustsFontForContentSizeCategory = true
        musicAuthorLabel.numberOfLines = 0
        musicAuthorLabel.lineBreakMode = .byWordWrapping
        
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.alignment = .leading
        
        let baseFont = UIFont.systemFont(ofSize: 22) // base
        let scaledFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: baseFont)
        let config = UIImage.SymbolConfiguration(font: scaledFont)
        
        
        moreOptionsButton.setImage(UIImage(named: "moreOptionsButtonImage"), for: .normal)

        moreOptionsButton.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        moreOptionsButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        moreOptionsButton.tintColor = .lightGray
    }
    
    private func setupConstraints() {
        
    }
    
}

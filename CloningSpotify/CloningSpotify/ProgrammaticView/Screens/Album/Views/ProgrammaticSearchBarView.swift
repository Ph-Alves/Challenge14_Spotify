//
//  ProgrammaticSearchBarView.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/15/26.
//
import UIKit

final class ProgrammaticSearchBarView: UIView {
    
    let iconImageView = UIImageView()
    let textField = UITextField()
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func setupView() {
        backgroundColor = .white.withAlphaComponent(0.15)
        
        layer.cornerRadius = 6
        
        
        iconImageView.image = UIImage(named: "searchImage")
        iconImageView.tintColor = .white
        
        textField.textColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "Find in playlist",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFontMetrics(forTextStyle: .subheadline)
                .scaledFont(for: .systemFont(ofSize: 14, weight: .bold))
            ]
        )
        textField.adjustsFontForContentSizeCategory = true
        textField.textAlignment = .natural
        
        textField.font = UIFontMetrics(forTextStyle: .subheadline)
            .scaledFont(for: .systemFont(ofSize: 14, weight: .bold))
//        textField.font = .systemFont(ofSize: 14, weight: .bold)
        
        stackView.axis = .horizontal
        stackView.spacing = 9
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(textField)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 18),
            iconImageView.heightAnchor.constraint(equalToConstant: 18),
            
            
            heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        
    }
}

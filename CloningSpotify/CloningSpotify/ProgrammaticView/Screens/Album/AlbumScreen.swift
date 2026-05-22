//
//  AlbumScreen.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/14/26.
//

import UIKit

let musics: [Music] = [
    Music(image: "easyMusic", name: "Easy", author: "Troye Sivan"),
    Music(image: "chanceMusic", name: "chance with you", author: "mehro"),
    Music(image: "nirvanaMusic", name: "Nirvana", author: "ELLIANA")
]

class AlbumScreen: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    
    let backButton = UIButton(type: .system)
    
    let searchButtonsHStack = UIStackView()
    let searchBarView = ProgrammaticSearchBarView()
    let sortButtonView = SortButtonView()
    
    let headerView = HeaderView()
    
    let musicsVStack = UIStackView()
    
    let musicPlayerView = MusicPlayerView(music: musics[0])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGradient(initialColor: UIColor.brown.cgColor, finalColor: UIColor.black.cgColor)
        setupBackButton()
        
        view.addSubview(musicPlayerView)
        musicPlayerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            musicPlayerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            musicPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            musicPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            musicPlayerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = view.bounds
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let isLandscape = size.width > size.height
    
        stackView.axis = isLandscape ? .horizontal : .vertical
        stackView.alignment = isLandscape ? .top : .fill
    }
    
    
    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: musicPlayerView.topAnchor, constant: -16)
        ])
        
        setupContentView()
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView)
        setupSearchButtonsContainer()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        setupStackView()
    }
    
    func setupStackView(){
        contentView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchButtonsHStack.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        stackView.addArrangedSubview(headerView)
        setupMusicCards()
    }
    
    func setupGradient(initialColor: CGColor, finalColor: CGColor) {
        view.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [initialColor, finalColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.7)
    }
    
    func setupSearchButtonsContainer() {
        contentView.addSubview(searchButtonsHStack)
        
        searchButtonsHStack.addArrangedSubview(searchBarView)
        searchButtonsHStack.addArrangedSubview(sortButtonView)
        
        searchButtonsHStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchButtonsHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchButtonsHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchButtonsHStack.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
        
        searchButtonsHStack.axis = .horizontal
        searchButtonsHStack.distribution = .fill
        searchButtonsHStack.spacing = 8
    }
    
    func setupBackButton() {
        view.addSubview(backButton)
        
        let isRTL = view.effectiveUserInterfaceLayoutDirection == .rightToLeft
        
        let imageName = isRTL ? "chevron.right" : "chevron.left"
        
        backButton.setImage(UIImage(systemName: imageName), for: .normal)
        backButton.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(pointSize: 16, weight: .regular),
            forImageIn: .normal
        )
        
        backButton.tintColor = .white
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            backButton.widthAnchor.constraint(equalToConstant: 32),
            backButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setupMusicCards() {
        musicsVStack.axis = .vertical
        musicsVStack.alignment = .leading
        musicsVStack.spacing = 16
        
        stackView.addArrangedSubview(musicsVStack)
        
        for music in musics {
            for music in musics {
                let card = MusicCardView(music: music)
                
                musicsVStack.addArrangedSubview(card)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

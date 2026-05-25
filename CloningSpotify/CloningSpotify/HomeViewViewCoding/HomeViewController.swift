//
//  HomeViewController.swift
//  Spotify
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: HomeViewController

final class HomeViewController: UIViewController {

    // MARK: Sub-views

    private lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .background
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()

    private lazy var pageStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 32
        stack.alignment = .fill
        return stack
    }()

    private lazy var headerView = HomeHeaderView()
    private lazy var recentlyPlayedView = RecentlyPlayedSectionView()
    private lazy var reviewSectionView = ReviewSectionView()
    private lazy var playlistSection = PlaylistSectionView()
    private lazy var nowPlayingBar = NowPlayingBarView()
    private lazy var tabBarView = TabBarView()
//    private lazy var tabBarView = TabBar() // tab bar nativa

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        navigationController?.setNavigationBarHidden(true, animated: false)
        buildLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard nowPlayingBar.frame.minY > 0 else { return }

        let bottom = (mainScrollView.frame.maxY - nowPlayingBar.frame.minY) + 16
        guard mainScrollView.contentInset.bottom != bottom else { return }

        mainScrollView.contentInset.bottom = bottom
        mainScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: 0)
    }
    
    // MARK: Layout

    private func buildLayout() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(pageStack)
        
        // inverte a rolagem do scroll horizontal
        if UIView.userInterfaceLayoutDirection(for: view.semanticContentAttribute) == .rightToLeft {
            recentlyPlayedView.hScroll.transform = CGAffineTransform(scaleX: -1, y: 1)
            recentlyPlayedView.itemsStack.transform = CGAffineTransform(scaleX: -1, y: 1)
            playlistSection.hScroll.transform = CGAffineTransform(scaleX: -1, y: 1)
            playlistSection.cardsStack.transform = CGAffineTransform(scaleX: -1, y: 1)
        }

        activate([
            // ScrollView
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            /*
            Leading / Trailing: safeAreaLayoutGuide
            Em landscape, o UIKit empurra automaticamente a âncora
            leading/trailing para o lado que a Dynamic Island ocupa.
            LTR + landscape-right: DI à esquerda (leading) → leading recua
            RTL + landscape-left : DI à direita (leading RTL) → leading recua
            O caso contrário permanece sem recuo extra (trailing da DI).
            */
            mainScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            // PageStack dentro do scrollView
            pageStack.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            pageStack.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            pageStack.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            pageStack.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            // Força scroll apenas vertical
            pageStack.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
        ])

        [
            headerView,
            recentlyPlayedView,
            reviewSectionView,
            playlistSection
        ].forEach { pageStack.addArrangedSubview($0) }

        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        activate([spacer.heightAnchor.constraint(equalToConstant: 8)])
        pageStack.addArrangedSubview(spacer)

        // Sections fixas
        view.addSubview(tabBarView)
        view.addSubview(nowPlayingBar)

        activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nowPlayingBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            nowPlayingBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            nowPlayingBar.bottomAnchor.constraint(equalTo: tabBarView.topAnchor, constant: -6),
            
            // Altura mínima; cresce com Dynamic Type graças às constraints internas
            nowPlayingBar.heightAnchor.constraint(greaterThanOrEqualToConstant: 64),
        ])
    }
}

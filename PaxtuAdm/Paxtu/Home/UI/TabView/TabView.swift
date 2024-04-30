//
//  TabView.swift
//  PaxtuAdm
//
//  Created by Mabel Kruger de Souza on 28/04/24.
//

import UIKit

enum Tabs {
    case main
    case other
}

protocol TabNavigationDelegate: AnyObject {
    func didTapTab(tab: Tabs)
}

final class TabView: UIView {
    private let mainTab: UIControl
    private let otherTab: UIControl
    private let mainTabTitle: UILabel
    private let otherTabTitle: UILabel
    private let collectionLayout: UICollectionViewFlowLayout
    private let collectionView: UICollectionView
    
    weak var delegate: TabNavigationDelegate?
    private var cardItems: [InformationOfCard] = []
    
    init(tab: Tabs) {
        mainTab = UIControl()
        otherTab = UIControl()
        mainTabTitle = UILabel()
        otherTabTitle = UILabel()
        collectionLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        
        super.init(frame: .zero)
        
        setupConstraint()
        renderView(tab: tab)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubviews(mainTab, otherTab, collectionView)
        
        mainTab.addSubview(mainTabTitle)
        otherTab.addSubview(otherTabTitle)
        
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        mainTab.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        otherTab.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            mainTab.topAnchor.constraint(equalTo: topAnchor),
            mainTab.leftAnchor.constraint(equalTo: leftAnchor),
            mainTab.widthAnchor.constraint(equalToConstant: 181),
            
            otherTab.topAnchor.constraint(equalTo: topAnchor),
            otherTab.leftAnchor.constraint(equalTo: mainTab.rightAnchor),
            otherTab.rightAnchor.constraint(equalTo: rightAnchor),
            otherTab.widthAnchor.constraint(equalToConstant: 181),
            
            mainTabTitle.topAnchor.constraint(equalTo: mainTab.topAnchor, constant: 4),
            mainTabTitle.leftAnchor.constraint(equalTo: mainTab.leftAnchor, constant: 4),
            mainTabTitle.rightAnchor.constraint(equalTo: mainTab.rightAnchor, constant: -4),
            mainTabTitle.bottomAnchor.constraint(equalTo: mainTab.bottomAnchor, constant: -4),
            
            otherTabTitle.topAnchor.constraint(equalTo: otherTab.topAnchor, constant: 4),
            otherTabTitle.leftAnchor.constraint(equalTo: otherTab.leftAnchor, constant: 4),
            otherTabTitle.rightAnchor.constraint(equalTo: otherTab.rightAnchor, constant: -4),
            otherTabTitle.bottomAnchor.constraint(equalTo: otherTab.bottomAnchor, constant: -4),
            
            collectionView.topAnchor.constraint(equalTo: mainTab.bottomAnchor, constant: 16),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func renderView(tab: Tabs) {
        mainTab.backgroundColor = tab == .main ? .greenMain : .lightGray
        mainTab.layer.maskedCorners = [.layerMinXMinYCorner,  .layerMinXMaxYCorner]
        mainTab.layer.cornerRadius = 5
        
        mainTabTitle.font = .HelveticaNeueRegularTwelve
        mainTabTitle.textColor = tab == .main ? .white : .black
        mainTabTitle.numberOfLines = 0
        mainTabTitle.text = "principais".uppercased()
        mainTabTitle.textAlignment = .center
        
        otherTab.backgroundColor = tab == .other ? .greenMain : .lightGray
        otherTab.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        otherTab.layer.cornerRadius = 5
        
        otherTabTitle.font = .HelveticaNeueRegularTwelve
        otherTabTitle.textColor = tab == .other ? .white : .black
        otherTabTitle.text = "outras".uppercased()
        otherTabTitle.textAlignment = .center
        
        
        collectionLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionLayout.itemSize = CGSize(width: 176, height: 83)
        collectionLayout.scrollDirection = .vertical
        
        collectionView.register(CardTabViewCell.self, forCellWithReuseIdentifier: CardTabViewCell.identifier)
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.backgroundColor = .systemPink
        collectionView.showsHorizontalScrollIndicator = false
        
        
        setupAction()
    }
    
    private func setupData(with model: TabsViewModel) {
        cardItems = model.tabsItems
        collectionView.reloadData()
    }
    
    private func setupAction() {
        mainTab.addTarget(self, action: #selector(didTabOfMainTab), for: .touchUpInside)
        otherTab.addTarget(self, action: #selector(didTapOfOtherTab), for: .touchUpInside)
    }
    
    @objc
    private func didTabOfMainTab() {
        delegate?.didTapTab(tab: .main)
    }
    
    @objc
    private func didTapOfOtherTab() {
        delegate?.didTapTab(tab: .other)
    }
}



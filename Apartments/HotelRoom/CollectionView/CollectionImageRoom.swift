//
//  CollectionImageRoom.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionImageRoom: UIView {
    
    var model: Room? {
        didSet {
            collectionView.reloadData()
        }
    }
    
//MARK: - collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 400, height: 257)
        layout.minimumLineSpacing = 0
        return layout
    }()
     lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentMode = .scaleAspectFit
        collectionView.layer.cornerRadius = 15
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
//MARK: - padeControl
     var padeControl: UIPageControl = {
       let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.currentPage = 0
        page.hidesForSinglePage = true
        page.layer.cornerRadius = 5
        page.currentPageIndicatorTintColor = .black
        page.backgroundColor = UIColor(named: "textGrey")
        return page
    }()
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension CollectionImageRoom {
    func initialization() {
        self.addSubview(collectionView)
        self.addSubview(padeControl)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionView.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        padeControl.snp.makeConstraints { make in
            make.top.equalTo(225)
            make.centerX.equalToSuperview()
        }
    }
}

extension CollectionImageRoom: UICollectionViewDataSource, UICollectionViewDelegate {
//MARK: - numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        model?.imageUrls.count ?? 0
    }
//MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                      for: indexPath) as! ImageCollectionView
        

        guard let images = model?.imageUrls else { return UICollectionViewCell() }
        let url = URL(string: images[indexPath.row])
        
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: url,
                                   placeholder: UIImage(named: "AppIcon"))
        padeControl.numberOfPages = model?.imageUrls.count ?? 0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        padeControl.currentPage = indexPath.row
    }
}

//
//  CollectionView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit
import SDWebImage

class CollectionView: UIView {
    
    var model: HotelModel? {
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
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0,
                                    left: -4,
                                    bottom: 0,
                                    right: 5)
        return layout
    }()
     lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentMode = .scaleAspectFill
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
private extension CollectionView {
    func initialization() {
        self.addSubview(collectionView)
        self.addSubview(padeControl)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionView.self,
                                forCellWithReuseIdentifier: "viewCell")
        self.layer.cornerRadius = 7
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
//MARK: - extension CollectionView
extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        model?.imageUrls.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                      for: indexPath) as! ImageCollectionView
        guard let model = model else { return UICollectionViewCell() }
        padeControl.numberOfPages = model.imageUrls.count
        let images = model.imageUrls[indexPath.row]
        let url = URL(string: images)
        cell.imageView.sd_setImage(with: url,
                                   placeholderImage: UIImage(named: "AppIcon"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        padeControl.currentPage = indexPath.row
    }
}

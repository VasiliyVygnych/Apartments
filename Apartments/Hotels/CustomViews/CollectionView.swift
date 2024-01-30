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
        layout.minimumLineSpacing = 0
        return layout
    }()
     lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentMode = .scaleAspectFill
        collectionView.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
        collectionView.clipsToBounds = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
//MARK: - UIPageControl
     var padeControl: UIPageControl = {
       let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_5)
        page.currentPageIndicatorTintColor = .black
        page.backgroundColor = .white
        page.pageIndicatorTintColor = .lightGray
        page.hidesForSinglePage = true
        return page
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
        self.clipsToBounds = true
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
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_7)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        padeControl.snp.makeConstraints { make in
            make.top.equalTo(230)
            make.centerX.equalToSuperview()
            make.height.equalTo(17)
        }
    }
}
extension CollectionView: UICollectionViewDataSource,
                            UICollectionViewDelegate,
                            UICollectionViewDelegateFlowLayout {
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
        guard let model = model else { return UICollectionViewCell() }
        let images = model.imageUrls[indexPath.item]
        let url = URL(string: images)
        cell.imageView.sd_setImage(with: url,
                                   placeholderImage: UIImage(named: "AppIcon"))
        padeControl.numberOfPages = model.imageUrls.count
        return cell
    }
//MARK: - willDisplay
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        padeControl.currentPage = indexPath.row
    }
//MARK: - sizeForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width  = collectionView.frame.width
        return CGSize(width: width,
                      height: height)
    }
}

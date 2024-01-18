//
//  TableViewHotelCell.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class TableViewHotelCell: UITableViewCell {
    
    var model: HotelModel? {
        didSet {
            collectionView.reloadData()
        }
    }
//MARK: - UIView
    var hotelPreviewView: HotelPreviewView = {
        let view = HotelPreviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var buttonView: ButtonView = {
        let view = ButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var infoHotelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
//MARK: - UILabel
    private var aboutHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 22,
                                 weight: .regular)
        label.text = "Об отеле"
        return label
    }()
     var infoHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        return label
    }()
//MARK: - collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 5,
                                    left: 5,
                                    bottom: 5,
                                    right: 5)
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "backgroundGray")
        collectionView.contentMode = .scaleAspectFit
        collectionView.layer.cornerRadius = 7
        return collectionView
    }()
//MARK: - UIButton
     var cellButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("К выбору номера",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = UIColor(named: "primaryButtons")
        button.layer.cornerRadius = 15
        button.isUserInteractionEnabled = false
        return button
    }()
//MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupeView()
        setupeConstraint()
//        contentView.backgroundColor = UIColor(named: "gray")
        contentView.isUserInteractionEnabled = true
        contentView.layer.cornerRadius = 15
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5,
                                                                     left: 0,
                                                                     bottom: 25,
                                                                     right: 0))
    }
}
private extension TableViewHotelCell {
//MARK: - setupeView
    func setupeView() {
        self.backgroundColor = UIColor(named: "gray")
        contentView.addSubview(hotelPreviewView)
        contentView.addSubview(infoHotelView)
        contentView.addSubview(cellButton)
        infoHotelView.addSubview(collectionView)
        infoHotelView.addSubview(aboutHotelLabbel)
        infoHotelView.addSubview(infoHotelLabbel)
        infoHotelView.addSubview(buttonView)
        collectionView.dataSource = self
        collectionView.register(ViewCollectionCell.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        hotelPreviewView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(460)
        }
        infoHotelView.snp.makeConstraints { make in
            make.top.equalTo(hotelPreviewView.snp.bottom).inset(-5)
            make.height.equalTo(428)
            make.width.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelLabbel.snp.bottom).inset(-15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(184)
        }
        aboutHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(16)
        }
        infoHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).inset(-10)
            make.height.lessThanOrEqualTo(120)
            make.width.equalTo(400)
            make.left.equalTo(16)
        }
        cellButton.snp.makeConstraints { make in
            make.width.equalTo(385)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
//MARK: - CollectionViewDataSource
extension TableViewHotelCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        model?.aboutTheHotel.peculiarities.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                      for: indexPath) as! ViewCollectionCell
        let model = model?.aboutTheHotel.peculiarities[indexPath.row]
        cell.titleLabel.text = model
        return cell
    }
}

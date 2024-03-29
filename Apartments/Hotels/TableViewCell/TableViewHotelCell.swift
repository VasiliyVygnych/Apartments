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
//MARK: - custom UIView
    var hotelPreviewView: HotelPreviewView = {
        let view = HotelPreviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var buttonView: ButtonView = {
        let view = ButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "backgroundGray")
        return view
    }()
    var cellButton: CellButtonView = {
        let view = CellButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
//MARK: - UIView
    private var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray")
        return view
    }()
    private var conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        return view
    }()
    var contentViewButton: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
        return view
    }()
    private var infoHotelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_10)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
//MARK: - UILabel
    private var aboutHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: CGFloat(Integers.FontSize.size_22),
                                 weight: .regular)
        label.text = Constants.Text.aboutHotelLabbel
        return label
    }()
     var infoHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: CGFloat(Integers.FontSize.size_16),
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
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_7)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
//MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupeView()
        setupeConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension TableViewHotelCell {
//MARK: - setupeView
    func setupeView() {
        self.backgroundColor = UIColor(named: "gray")
        contentView.addSubview(hotelPreviewView)
        contentView.addSubview(infoHotelView)
        contentView.addSubview(buttonView)
        contentView.addSubview(contentViewButton)
        contentViewButton.addSubview(conteinerView)
        conteinerView.addSubview(separatorView)
        contentViewButton.addSubview(cellButton)
        infoHotelView.addSubview(collectionView)
        infoHotelView.addSubview(aboutHotelLabbel)
        infoHotelView.addSubview(infoHotelLabbel)
        collectionView.dataSource = self
        collectionView.register(ViewCollectionCell.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        hotelPreviewView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(530)
        }
        infoHotelView.snp.makeConstraints { make in
            make.top.equalTo(hotelPreviewView.snp.bottom).inset(-5)
            make.height.equalTo(428)
            make.width.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(Integers.Constraints.sideMargins)
        }
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelLabbel.snp.bottom).inset(-15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(184)
        }
        aboutHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(Integers.Constraints.sideMargins)
        }
        infoHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).inset(-10)
            make.height.lessThanOrEqualTo(120)
            make.width.equalToSuperview().inset(Integers.Constraints.sideMargins)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        separatorView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1.5)
            make.bottom.equalTo(conteinerView.snp.top)
        }
        conteinerView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        contentViewButton.snp.makeConstraints { make in
            make.top.equalTo(infoHotelView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(70)
        }
        cellButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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

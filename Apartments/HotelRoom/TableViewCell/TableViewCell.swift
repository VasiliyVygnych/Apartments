//
//  TableViewCell.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    var model: Room? {
        didSet {
            collectionView.reloadData()
        }
    }
//MARK: - custom view
    var collectionImageRoom: CollectionImageRoom = {
        let view = CollectionImageRoom()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
        return view
    }()
//MARK: - UILabel
     var infoRoomLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_22),
                                   weight: .regular)
        return label
    }()
     var priseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_30),
                                   weight: .bold)
        return label
    }()
     var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .light)
        return label
    }()
     var moreButtonLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primaryButtons")
        label.text = Constants.Text.moreButtonLabel
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        return label
    }()
//MARK: - collectionView & FlowLayout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = .init(top: 0,
                                    left: 5,
                                    bottom: 0,
                                    right: 5)
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "gray")
        collectionView.contentMode = .scaleAspectFit
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 7
        return collectionView
    }()
//MARK: - UIButton
    private var moreInfoBotton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.backgroundColor = UIColor(named: "primaryButtons2")
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_5)
        return view
    }()
    var cellButton: UIButton = {
      let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.setupeButtonCell,
                       for: .normal)
       button.setTitleColor(.white,
                            for: .normal)
       button.backgroundColor = UIColor(named: "primaryButtons")
       button.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
       button.isUserInteractionEnabled = false
       return button
   }()
//MARK: - UIView
    var optionsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
        return view
    }()
//MARK: - UIImageView
    private var imageButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "moreButton")
        return image
    }()
//MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        initialization()
        setupeConstraint()
        contentView.insetsLayoutMarginsFromSafeArea = true
        moreInfoBotton.addTarget(self,
                                 action: #selector(didTap),
                                 for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - @objc func didTap
    @objc func didTap() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.moreInfoBotton.transform = CGAffineTransform(scaleX: 0.70,
                                                              y: 0.70)
        })
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.moreInfoBotton.transform = CGAffineTransform(scaleX: 1,
                                                              y: 1)
        }, completion: { finished in
            print("tap moreInfoRoom")
        })
    }
//MARK: - сonfigures
    func сonfigures(model: Room) {
        let prise = "\(model.price) \(Constants.Text.currency)"
        priseLabel.text = prise
        infoRoomLabel.text = model.name
        infoLabel.text = model.pricePer
    }
}
//MARK: - extension
private extension TableViewCell {
    func initialization() {
        self.backgroundColor = UIColor(named: "gray")
        self.addSubview(optionsView)
        self.addSubview(cellButton)
        optionsView.addSubview(collectionImageRoom)
        optionsView.addSubview(infoRoomLabel)
        optionsView.addSubview(moreInfoBotton)
        moreInfoBotton.addSubview(imageButton)
        moreInfoBotton.addSubview(moreButtonLabel)
        optionsView.addSubview(priseLabel)
        optionsView.addSubview(infoLabel)
        optionsView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ViewCollectionCell.self,
                                forCellWithReuseIdentifier: "viewCell")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        optionsView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
        }
        collectionImageRoom.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.height.equalTo(257)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        infoRoomLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(255)
            make.height.equalTo(100)
            make.width.equalTo(343)
            make.leading.equalTo(16)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(340)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        priseLabel.snp.makeConstraints { make in
            make.top.equalTo(440)
            make.left.equalTo(16)
            make.width.equalTo(160)
            make.height.equalTo(36)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(450)
            make.height.equalTo(19)
            make.left.equalTo(170)
        }
        moreInfoBotton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.left.equalTo(16)
            make.width.equalTo(200)
            make.height.equalTo(29)
        }
        cellButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.bottom.equalTo(-20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        moreButtonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
            make.left.equalTo(10)
        }
        imageButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.right.equalTo(0)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension TableViewCell: UICollectionViewDataSource,
                            UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        model?.peculiarities.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell",
                                                           for: indexPath) as! ViewCollectionCell
        cell.titleLabel.text = model?.peculiarities[indexPath.row]
        return cell
    }
}

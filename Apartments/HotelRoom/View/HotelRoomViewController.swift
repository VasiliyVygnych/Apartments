//
//  HotelRoomViewController.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class HotelRoomViewController: UITableViewController {
    
    var presenter: HotelRoomPresenterProtocol?
    
    var model: [Room]? {
        didSet {
            tableView.reloadData()
        }
    }
    
//MARK: - navigationTitle
    private var navigationTitle: UILabel = {
        let label = UILabel()
        label.font = .sFProDisplay(ofSize: 13,
                                   weight: .bold)
        return label
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.titleView = navigationTitle
        presenter?.viewDidLoad()
        setupeTableView()
        setupeBackButoon()
    }
//MARK: - setupeTableView
    private func setupeTableView() {
        tableView.rowHeight = 539
        tableView.separatorColor = .clear
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: "viewCell")
    }
//MARK: - setupeBackButoon
    private func setupeBackButoon() {
        let backButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(back))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
//MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        model?.count ?? 0
    }
//MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell",
                                                       for: indexPath) as! TableViewCell
        guard let model = model?[indexPath.row] else { return  UITableViewCell() }
        cell.model = model
        cell.collectionImageRoom.model = model
        cell.сonfigures(model: model)
        return cell
    }
//MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        guard let model = model?[indexPath.row] else { return }
        let cell = self.tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.75,
                                                y: 0.75)
        }, completion: { finished in
            self.presenter?.goBookingRoomView(model: model)
        })
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            cell?.transform = CGAffineTransform(scaleX: 1,
                                                y: 1)
        }, completion: nil)
    }
}
//MARK: - extension HotelRoomViewProtocol
extension HotelRoomViewController: HotelRoomViewProtocol {
    func dataSet(model: [Room]) {
        self.model = model
    }
    func giveDataToView(model: HotelModel) {
        self.navigationTitle.text = model.name
    }
}

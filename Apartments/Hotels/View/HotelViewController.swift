//
//  HotelViewController.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

class HotelViewController: UITableViewController {

    var presenter: HotelPresenterProtocol?
    
    var model: HotelModel? {
        didSet {
            tableView.reloadData()
        }
    }
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Text.navTitleHotel
        setupeTableView()
        presenter?.viewDidLoad()
    }
//MARK: - setupeTableView
    private func setupeTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 1045
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.register(TableViewHotelCell.self,
                           forCellReuseIdentifier: "cell")
    }
//MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        model?.id ?? 0
    }
//MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                  for: indexPath) as? TableViewHotelCell
        guard let model = model else { return UITableViewCell() }
        cell?.model = model
        cell?.infoHotelLabbel.text = model.aboutTheHotel.description
        cell?.hotelPreviewView.dataSet(model: model)
        return cell ?? UITableViewCell()
    }
//MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        guard let model = model else { return }
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.75,
                                                y: 0.75)
        }, completion: { finished in
            self.presenter?.goHotrlRoomViews(model: model)
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
//MARK: - extension HotelViewProtocol
extension HotelViewController: HotelViewProtocol {
    func dataSet(model: HotelModel) {
        self.model = model
    }
}

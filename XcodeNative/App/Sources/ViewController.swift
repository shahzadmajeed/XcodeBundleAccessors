//
//  ViewController.swift
//  XcodeBundleAccessors
//
//  Created by Shahzad Majeed on 11/3/25.
//

import UIKit
import DesignSystem
import Framework

class ViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let cellIdentifier = "ArrowCell"

    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Arrows"

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 56
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { TableSection.allCases.count }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        TableSection(rawValue: section)?.title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = TableSection(rawValue: section) else { return 0 }
        switch section {
        case .appAssets: return viewModel.appAssetItems.count
        case .spmAssets: return viewModel.spmAssetItems.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let section = TableSection(rawValue: indexPath.section) else { return cell }

        let item: AssetsResource
        let bgColor: UIColor
        switch section {
        case .appAssets:
            item = viewModel.appAssetItems[indexPath.row]
            bgColor = .green
        case .spmAssets:
            item = viewModel.spmAssetItems[indexPath.row]
            bgColor = .blue
        }
        
        let templateImage = item.uiImage.withRenderingMode(.alwaysTemplate)
        cell.imageView?.image = templateImage
        cell.imageView?.tintColor = bgColor
        cell.textLabel?.text = "\(item.displayName)"

        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

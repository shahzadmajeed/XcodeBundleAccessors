//
//  ViewController.swift
//  XcodeBundleAccessors
//
//  Created by Shahzad Majeed on 11/3/25.
//

import UIKit
import DesignSystem

class ViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let cellIdentifier = "ArrowCell"

    // Section model
    private enum Section: Int, CaseIterable {
        case appAssets = 0
        case spmAssets

        var title: String {
            switch self {
            case .appAssets: return "App Assets"
            case .spmAssets: return "SPM Target Assets"
            }
        }
    }
    
    private let appAssetItems: [AppImageAsset] = AppImageAsset.allCases
    private let spmAssetItems: [SpmImageAsset] = SpmImageAsset.allCases

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
    func numberOfSections(in tableView: UITableView) -> Int { Section.allCases.count }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .appAssets: return appAssetItems.count
        case .spmAssets: return spmAssetItems.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let section = Section(rawValue: indexPath.section) else { return cell }

        let item: AssetsResource
        let bgColor: UIColor
        switch section {
        case .appAssets:
            item = appAssetItems[indexPath.row]
            bgColor = .green
        case .spmAssets:
            item = spmAssetItems[indexPath.row]
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

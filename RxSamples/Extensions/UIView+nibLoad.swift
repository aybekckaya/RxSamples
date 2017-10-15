//
//  UIView+nibLoad.swift
//  MstStrangle
//
//  Created by aybek can kaya on 19/07/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

/// THIS EXTENSION IS MADE BY SERHAN AKSÜT 

import Foundation
import UIKit


// MARK: - Load Nib
protocol ViewIdentifier: class {
    static var identifier: String { get }
}

extension ViewIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView: ViewIdentifier {}

extension UIView {
    class func loadNib<T: ViewIdentifier>() -> T {
        guard let view = Bundle.main.loadNibNamed(T.identifier, owner: nil, options: nil)?[0] as? T else { fatalError("can not find view with identifier \(T.identifier) \(self)") }
        return view
    }
}


// MARK: - UITableView deque
extension UITableView {
    func deque<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError("can not deque cell with identifier \(T.identifier) from tableView \(self)") }
        return cell
    }
}


extension UICollectionView {
    func deque<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError("can not deque cell with identifier \(T.identifier) from tableView \(self)") }
        return cell
    }
}


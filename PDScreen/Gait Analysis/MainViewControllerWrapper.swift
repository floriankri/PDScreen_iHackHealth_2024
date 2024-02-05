//
//  File.swift
//  PDScreen
//
//  Created by Florian Kristof on 04.02.24.
//

import SwiftUI

struct MainViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<MainViewControllerWrapper>) -> UIViewController {
        let viewController = MainViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MainViewControllerWrapper>) {
    }
}

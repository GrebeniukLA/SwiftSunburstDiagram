//
//  SceneDelegate.swift
//  SunburstDiagramDemo
//
//  Created by Ludovic Landry on 6/10/19.
//  Copyright © 2019 Ludovic Landry. All rights reserved.
//

import UIKit
import SunburstDiagram
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let configuration = SunburstConfiguration(nodes: sampleNodes(), calculationMode: .ordinalFromLeaves)
        configuration.expandedArcThickness = 52.0
        configuration.maximumExpandedRingsShownCount = 2
        configuration.maximumRingsShownCount = 4

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: RootView(configuration: configuration))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    private func sampleNodes() -> [Node] {
        let nodes = [
            Node(name: "Walking", showName: true, image: UIImage(named: "walking"), value: 10.0, backgroundColor: .systemBlue),
            Node(name: "Restaurant", showName: true, image: UIImage(named: "eating"), value: 30.0, backgroundColor: .systemRed, children: [
                Node(name: "Dessert", showName: true, image: UIImage(named: "croissant"), value: 10.0, backgroundColor: .systemYellow, children: [
                    Node(name: "Creme Brulee", showName: true, value: 3.0, backgroundColor: .systemYellow),
                    Node(name: "Crepes", showName: true, value: 6.0, backgroundColor: .systemYellow, children: [
                        Node(name: "Nutella Crepe", showName: true, value: 4.0, backgroundColor: .systemYellow),
                    ]),
                ]),
                Node(name: "Dinner", showName: true, image: UIImage(named: "poultry"), value: 5.0, backgroundColor: .systemOrange, children: [
                    Node(name: "Pizza", showName: true, value: 4.0, backgroundColor: .systemOrange),
                ]),
            ]),
            Node(name: "Transport", showName: true, image: UIImage(named: "sailing"), value: 10.0, backgroundColor: .systemPurple),
            Node(name: "Home", showName: true, image: UIImage(named: "house"), value: 45.0, backgroundColor: .systemTeal, children: [
                Node(name: "San Francisco", showName: true, image: UIImage(named: "house"), value: 15.0, backgroundColor: .systemTeal, children: [
                    Node(name: "Twin Peaks", showName: true, value: 3.0, backgroundColor: .systemTeal),
                    Node(name: "Hayes Valley", showName: true, value: 1.5, backgroundColor: .systemTeal),
                    Node(name: "Nob Hill", showName: true, value: 8.0, backgroundColor: .systemTeal),
                ]),
                Node(name: "Lyon", showName: true, image: UIImage(named: "house"), value: 6.0, backgroundColor: .systemTeal),
            ]),
        ]

        return nodes
    }
}

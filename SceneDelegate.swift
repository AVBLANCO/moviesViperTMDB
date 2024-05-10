//
//  SceneDelegate.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 6/05/24.
//


import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let router = TopRatedMoviesRouter()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: router.listMovies(context: context))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

import UIKit
import MainFeature
import CounterFeature

import TMAShared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dependency = AppDependency.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        // 루트 뷰 컨트롤러 설정
        let mainFactoryImpl = MainFactoryImpl(external: self.dependency)
        let mainViewController = mainFactoryImpl.makeViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        // Navigator 설정
        if let tabBarController = mainViewController as? UITabBarController {
            dependency.setNavigator(with: tabBarController)
        }
        
        // DeepLink 처리
        if let urlContext = connectionOptions.urlContexts.first {
            _ = dependency.navigator?.handleDeepLink(urlContext.url)
        }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        _ = dependency.navigator?.handleDeepLink(url)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
    }
}

//
//  FirePerfectApp.swift
//  FirePerfect
//
//  Created by Abduqaxxor on 24/4/22.
//

import SwiftUI
import Firebase

@main
struct FirePerfectApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StarterScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(SessionStore())
        }
    }
    
    class AppDelegate: NSObject,UIApplicationDelegate {
        func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
            FirebaseApp.configure()
            return true
        }
    }
}




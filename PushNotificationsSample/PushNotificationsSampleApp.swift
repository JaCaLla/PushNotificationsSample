//
//  PushNotificationsSampleApp.swift
//  PushNotificationsSample
//
//  Created by Javier Calatrava on 5/2/25.
//

import SwiftUI
import FirebaseCore
import UserNotifications
import FirebaseMessaging

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permiso concedido para notificaciones")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Permiso denegado para notificaciones")
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Token de APNs: \(token)")
        
        // Pasar el token de APNs a Firebase
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // Manejar la actualización del token de FCM
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let fcmToken = fcmToken {
            print("Token de FCM: \(fcmToken)")
        }
    }
    
    // Manejar notificaciones en primer plano
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    // Manejar la interacción del usuario con la notificación
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

@main
struct PushNotificationsSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  //  @StateObject var notificationHandler = NotificationHandler()

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environmentObject(notificationHandler)
        }
    }
  }

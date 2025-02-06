//
//  ContentView.swift
//  PushNotificationsSample
//
//  Created by Javier Calatrava on 5/2/25.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var notificationHandler: NotificationHandler

    var body: some View {
        VStack {
            Text("PushNotificationsSample iOS App")
                .font(.title)
        }/*.onAppear {
            if let fcmToken = Messaging.messaging().fcmToken {
                print("Token FCM: \(fcmToken)")
            } else {
                print("No se pudo obtener el token FCM")
            }
        }*/
    }
}

#Preview {
    ContentView()
}

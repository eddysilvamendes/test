/*import UIKit
import Flutter
import GoogleMaps
import Firebase
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
 FirebaseApp.configure()
    
    UNUserNotificationCenter.current().delegate=self
    GeneratedPluginRegistrant.register(with: self)
    
    GMSServices.provideAPIKey("AIzaSyBDbhBCCIq4wgO13PgrGSzs4_kdDxnEeqI")
    if #available(iOS 10.0, *) {
         UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, _ in
        guard success else {
            return
        }
        print("Success in APNS registry")
    }
    application.registerForRemoteNotifications()
    
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
  
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Registered for Apple Remote Notifications")
        Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token{ token, _ in
            guard let token = token else{
                return
            }
            print("Token: \(token)")

        }
    }
    override func application(_ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

     Messaging.messaging().apnsToken = deviceToken
        print("Token: \(deviceToken)")
     super.application(application,
     didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
   }
}

*/

/*
import UIKit
import FirebaseMessaging
import UserNotifications
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        Messaging.messaging().delegate=self
        UNUserNotificationCenter.current().delegate=self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, _ in
            guard success else {
                return
            }
            print("Success in APNS registry")
        }
        application.registerForRemoteNotifications()
        return true
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token{ token, _ in
            guard let token = token else{
                return
            }
            print("Token: \(token)")

        }
    }


}*/
import GoogleMaps
import UIKit
import Flutter
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
 [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
      GMSServices.provideAPIKey("AIzaSyBDbhBCCIq4wgO13PgrGSzs4_kdDxnEeqI")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions:
  launchOptions)
  }
  override func application(_ application: UIApplication,
  didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

   Messaging.messaging().apnsToken = deviceToken
      print("Token: \(deviceToken)")
   super.application(application,
   didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
 }
}

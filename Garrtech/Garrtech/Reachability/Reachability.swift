




import Alamofire

public class Reachability {
    
    
    var manager = NetworkReachabilityManager()
    
    public class var sharedInstance: Reachability {
        struct Singleton {
            static let instance: Reachability = Reachability()
        }
        return Singleton.instance
    }
    
    init() {
        
    }
    
    func checkReachability() {
        
        manager = NetworkReachabilityManager(host: "www.google.com")
        
        manager?.listener = { status in
            print("Network Status Changed: \(status)")
            
            if self.manager!.isReachable == false {
                Alert.displayAlert(title: APP_NAME, message: "Please check your internet connection.", otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
            } else {
                
            }
            
        }
        manager?.startListening()
    }
    
    func isReachable() -> Bool {
        
        if self.manager!.isReachable == false {
            Alert.displayAlert(title: APP_NAME, message: "Please check your internet connection.", otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
            return false
        } else {
            return true
        }
    }
}

//
//  UserDefaultsManager.swift
//  CAMSfinserv
//
//  Created by Macbook on 26/10/21.
//

import Foundation

class UserDefaultsManager{
    static let shared:UserDefaultsManager = {
        let instance = UserDefaultsManager()
        return instance
    }()
    
    var MOBILE: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.MOBILE) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.MOBILE)
        }
    }
    var UUID: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.UUID) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.UUID)
        }
    }
    var SESSION_ID: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.SESSION_ID) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.SESSION_ID)
        }
    }
    var EMAIL: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.EMAIL) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.EMAIL)
        }
    }
    
    var FCM_TOKEN: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.FCM_TOKEN) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.FCM_TOKEN)
        }
    }
    
    var USER_ID: String{
            get{
                UserDefaults.standard.string(forKey: UserManagerKeys.USER_ID) ?? ""
            }set{
                UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.USER_ID)
            }
        }
    var PIN: String{
               get{
                   UserDefaults.standard.string(forKey: UserManagerKeys.PIN) ?? ""
               }set{
                   UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.PIN)
               }
           }
    var USERNAME: String{
               get{
                   UserDefaults.standard.string(forKey: UserManagerKeys.USERNAME) ?? ""
               }set{
                   UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.USERNAME)
               }
           }
    var ISLOGIN: Bool{
        get{
            UserDefaults.standard.bool(forKey: UserManagerKeys.ISLOGIN) ?? false
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.ISLOGIN)
        }
    }
    var I_SECONDARY_MOBILE_NUMBER: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.I_SECONDARY_MOBILE_NUMBER) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.I_SECONDARY_MOBILE_NUMBER)
        }
    }
    
    var USER_IMAGE: String{
        get{
            UserDefaults.standard.string(forKey: UserManagerKeys.USER_IMAGE) ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: UserManagerKeys.USER_IMAGE)
        }
    }
        
         func resetDefaults() {
                if let bundleID = Bundle.main.bundleIdentifier {
                    UserDefaults.standard.removePersistentDomain(forName: bundleID)
                }
            }
}

struct UserManagerKeys{
    static let UUID = "UUID"
    static let SESSION_ID = "SESSION_ID"
    static let MOBILE = "MOBILE"
    static let EMAIL = "EMAIL"
    static let FCM_TOKEN = "FCM_TOKEN"
    static let ISLOGIN = "ISLOGIN"
    static let USER_ID = "USER_ID"
    static let PIN = "PIN"
    static let USERNAME = "USERNAME"
    static let I_SECONDARY_MOBILE_NUMBER = "I_SECONDARY_MOBILE_NUMBER"
    static let USER_IMAGE = "USER_IMAGE"
}





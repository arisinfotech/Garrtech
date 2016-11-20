//
//  APIManager.swift
//  tabtendr
//
//  Created by Doug Andrew on 6/22/16.
//  Copyright © 2016 Tabtendr. All rights reserved.
//

import Foundation
import Alamofire

public var MAIN_URL = "http://192.168.1.106/garrtech/api/"

// swiftlint:disable type_body_length
public class APIManager {
    
    
    public var AUTH_HEADER = [String:String]()
    
    
    public class var sharedInstance: APIManager {
        struct Singleton {
            static let instance: APIManager = APIManager()
        }
        return Singleton.instance
    }
    
    init() {
        
    }

    //MARK: -------------------- Register ---------------------
    
    func RegisterUser(user: Register, completion: @escaping (_ registeredUser: Register?, _ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "register", method: .post, parameters: user.toJsonDictionary()).responseJSON { response in

            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                
                    print(JSON_[kData]!.firstObject!)
                    
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(nil,SPErrors.EmptyResultError)
                }
                
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: -------------------- Login ---------------------
    
    func LoginUser(user: Login, completion: @escaping (_ error: NSError?) -> ()) {
        
        print(user.toJsonDictionary())
        Alamofire.request(MAIN_URL + "login", method: .post, parameters: user.toJsonDictionary()).responseJSON { response in
            
            if let JSON = response.result.value {
               
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    let tempDict = JSON_[kData]!.firstObject! as! JSONDictionary
                    UserDefaults.standard.set(nil, forKey: kUSERLOGIN)
                    UserDefaults.standard.set(tempDict, forKey: kUSERLOGIN)
                    CurrentUser.sharedInstance.populateWithJSON(dict:tempDict)
                    print(CurrentUser.sharedInstance.toJsonDictionary())
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    
    //MARK: -------------------- Change Password ---------------------
    
    func ChangePassword(password:ChangePassword, completion: @escaping (_ error: NSError?) -> ()) {
        
        
        Alamofire.request(MAIN_URL + "change_password", method: .post, parameters: password.toJsonDictionary(), encoding: URLEncoding.default, headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
                
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: -------------------- Update Profile ---------------------
    
    
    func UpdateProfile(profile:Profile, completion: @escaping (_ updatedProfile: Profile?, _ error: NSError?) -> ()) {
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(UIImageJPEGRepresentation(profile.image!, 1)!, withName: kUser_avatar, fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            for key in profile.toJsonDictionary()
            {
                multipartFormData.append(key.value.data as Data, withName: key.key as String)
            }
            }, to:MAIN_URL + "update_profile", method: .post, headers:CurrentUser.sharedInstance.setAuthHeader())
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                })
                
                upload.responseJSON { response in
                    //print response.result
                }
                
            case .failure(let encodingError): break
                //print encodingError.description
            }
        }
    }
    
    
    //MARK: -------------------- Logout User ---------------------
    
    func LogoutUser(completion:@escaping (_ error:NSError?) -> ()) {
     //
        
        Alamofire.request(MAIN_URL + "logout", method: .post, headers:CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    print(JSON_[kData]!.firstObject!)
                    
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
                
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
        
    }
    
    //MARK: -------------------- LoanOptions User ---------------------
    
    func LoanOption(completion:@escaping (_ annualRevenue:[LoanOptions], _ craditScore:[LoanOptions], _ loanAmountNeed:[LoanOptions], _ timeInBusiness:[LoanOptions]) -> (), error:@escaping ( _ error:NSError?) -> ())  {
        
        Alamofire.request(MAIN_URL + "app_manager/option_apply_loan", method: .get ,headers:CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            if let JSON = response.result.value {
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let loanOptionData = JSON_[kData] as? JSONDictionary {
                        var annualRevenueArrTemo = [LoanOptions]()
                        var cradit_scoreArrTemp = [LoanOptions]()
                        var loanAmountNeedArrTemp = [LoanOptions]()
                        var timeinBusinessArrTemp = [LoanOptions]()
                        
                        if let annual_revenueTemp = loanOptionData[kAnnual_revenue] as? [JSONDictionary] {
                            
                            for dict in annual_revenueTemp {
                                let tempDict = LoanOptions()
                                tempDict.populateWithJson(dic: dict)
                                annualRevenueArrTemo.append(tempDict)
                            }
                        }
                        
                        if let cradit_scoreTemp = loanOptionData[kcredit_score] as? [JSONDictionary] {
                            for dict in cradit_scoreTemp {
                                let tempDict = LoanOptions()
                                tempDict.populateWithJson(dic: dict)
                                cradit_scoreArrTemp.append(tempDict)
                            }
                        }
                        
                        if let loanAmountNeed = loanOptionData[kloan_amt_need] as? [JSONDictionary] {
                            for dict in loanAmountNeed {
                                let tempDict = LoanOptions()
                                tempDict.populateWithJson(dic: dict)
                                loanAmountNeedArrTemp.append(tempDict)
                            }
                        }
                        
                        if let timeinBusiness = loanOptionData[ktime_in_business] as? [JSONDictionary] {
                            for dict in timeinBusiness {
                                let tempDict = LoanOptions()
                                tempDict.populateWithJson(dic: dict)
                                timeinBusinessArrTemp.append(tempDict)
                            }

                        }
                        
                        completion(annualRevenueArrTemo, cradit_scoreArrTemp, loanAmountNeedArrTemp, timeinBusinessArrTemp)
                        
                    } else {
                        error(SPErrors.EmptyResultError)
                    }
                    
                } else {
                    error(SPErrors.EmptyResultError)
                }
                
            } else {
                error(SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- Step 1 Mehtods -----
    //MARK:
    
    func loanStepOne(stepOne: LoanStepOne, completion:@escaping (_ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "app_step_one", method: .post, parameters: stepOne.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in

            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
                
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
        
    }
    
    //MARK: ----- Step 2 Mehtods -----
    //MARK:
    
    func loanStepTwo(stepTwo: LoanStepTwo, completion:@escaping (_ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "app_step_two", method: .post, parameters: stepTwo.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- step 3 Mehtods -----
    //MARK:
    
    func loanStepThree(stepThree: LoanStepThree, completion:@escaping (_ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "app_step_three", method: .post, parameters: stepThree.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- step 4 Mehtods -----
    //MARK:
    
    func loanStepFour(stepFour: LoanStepFour, completion:@escaping (_ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "app_step_four", method: .post, parameters: stepFour.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    completion(nil)
                } else {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    
    
}

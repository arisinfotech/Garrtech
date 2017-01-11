//
//  APIManager.swift
//  tabtendr
//
//  Created by Doug Andrew on 6/22/16.
//  Copyright © 2016 Tabtendr. All rights reserved.
//

import Foundation
import Alamofire

public var MAIN_URL = "http://garrtech-group.com/application/api/"

public typealias JSONDictionary = [String: AnyObject]
typealias APIParams = [String : AnyObject]?

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
                    
                    print(JSON_[kData]!)
                    completion(nil,nil)
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
                
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: -------------------- Login ---------------------
    
    func LoginUser(user: Login, completion: @escaping (_ error: NSError?) -> ()) {
        
        showHUD()
        
        print(user.toJsonDictionary())
        Alamofire.request(MAIN_URL + "login", method: .post, parameters: user.toJsonDictionary()).responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    
                    let tempDict = JSON_[kData]! as! JSONDictionary
                    UserDefaults.standard.set(nil, forKey: kUSERLOGIN)
                    UserDefaults.standard.set(tempDict, forKey: kUSERLOGIN)
                    CurrentUser.sharedInstance.populateWithJSON(dict:tempDict)
                    print(CurrentUser.sharedInstance.toJsonDictionary())
                    hideHUD()
                    completion(nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    hideHUD()
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                hideHUD()
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    
    //MARK: -------------------- Change Password ---------------------
    
    func ChangePassword(password:ChangePassword, completion: @escaping (_ error: NSError?) -> ()) {
        
        showHUD()
        
        Alamofire.request(MAIN_URL + "change_password", method: .post, parameters: password.toJsonDictionary(), encoding: URLEncoding.default, headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            //            print(response.request)  // original URL request
            //            print(response.response) // HTTP URL response
            //            print(response.data)     // server data
            //            print(response.result)   // result of response serialization
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                
                    
                    completion(nil)
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
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
            
            multipartFormData.append(UIImageJPEGRepresentation(profile.image!, 0.5)!, withName: kUser_avatar, fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            
            for (key, value) in profile.toJsonDictionary()
            {
                if key != kUser_avatar {
                    multipartFormData.append("\(value)".data(using: .utf8, allowLossyConversion: false)! , withName: key)
                }
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
                    
                    if let JSON = response.result.value {
                        
                        print("JSON: \(JSON)")
                        
                        let JSON_ = JSON as! JSONDictionary
                        
                        if JSON_[kStatus] as? String == kSuccess {
                            
                            let profile = Profile()
                            profile.populateWithJSON(dict: JSON_[kData]! as! JSONDictionary)
                            
                            CurrentUser.sharedInstance.first_name = profile.first_name
                            CurrentUser.sharedInstance.last_name = profile.last_name
                            CurrentUser.sharedInstance.image = profile.imageURL
                            
                            UserDefaults.standard.set(nil, forKey: kUSERLOGIN)
                            UserDefaults.standard.set(CurrentUser.sharedInstance.toJsonDictionary(), forKey: kUSERLOGIN)
                            CurrentUser.sharedInstance.populateWithJSON(dict:CurrentUser.sharedInstance.toJsonDictionary())
                            print(CurrentUser.sharedInstance.toJsonDictionary())
                            
                            completion(profile,nil)
                            Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                            hideHUD()
                        } else {
                            if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                            hideHUD()
                        }
                        
                    } else {
                        hideHUD()
                        completion(nil,SPErrors.EmptyResultError)
                    }
                    
                }
                
            case .failure(let encodingError):
                //print encodingError.description
                print(encodingError.localizedDescription)
                completion(nil,SPErrors.EmptyResultError)
                break
            }
        }
    }
    
    
    //MARK: -------------------- Logout User ---------------------
    
    func LogoutUser(completion:@escaping (_ error:NSError?) -> ()) {
        //
        
        Alamofire.request(MAIN_URL + "logout", method: .get, headers:CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    appDelegate.clearUserDefault()
                    completion(nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
        
    }
    
    //MARK: ----- Forgot Pass Mehtods -----
    //MARK:
    
    
    func ForgotPassword(forgotPass: ForgotPassword, completion: @escaping (_ error: NSError?) -> ()) {
        
        
        showHUD()
        
        Alamofire.request(MAIN_URL + "forgot_password", method: .post, parameters: forgotPass.toJsonDict()).responseJSON { response in
            
            hideHUD()
            if let JSON = response.result.value {
                
                let JSON_ = JSON as! JSONDictionary
                
                print(JSON_)
                
                if JSON_[kStatus] as? String == kSuccess {
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    completion(nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }

    }
    
    //MARK: ----- Apply For loan Mehtods -----
    //MARK:
    
    func ApplyForLoan(options: ApplyForLoan, completion: @escaping (_ loanDetails: LoanDetails?, _ error:
        NSError?) -> ()) {
        
        showHUD()
        
        Alamofire.request(MAIN_URL + "apply_for_loan", method: .post, parameters: options.toJsonDict(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    let details = LoanDetails()
                    
                    details.populateWithJson(dict: (JSON_[kData] as? JSONDictionary)!)
                    
                    hideHUD()
                    completion(details,nil)
                    
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    hideHUD()
                    completion(nil,SPErrors.EmptyResultError)
                }
                
            } else {
                hideHUD()
                completion(nil,SPErrors.EmptyResultError)
            }
        }
        
    }
    
    //MARK: -------------------- LoanOptions User ---------------------
    
    func LoanOption(completion:@escaping (_ annualRevenue:[LoanOptions], _ craditScore:[LoanOptions], _ loanAmountNeed:[LoanOptions], _ timeInBusiness:[LoanOptions]) -> (), error:@escaping ( _ error:NSError?) -> ())  {
        
        //show loader
        showHUD()

        
        // call api
        Alamofire.request(MAIN_URL + "app_manager/option_apply_loan", method: .get ,headers:CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            hideHUD()
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
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
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
        
        showHUD()
        Alamofire.request(MAIN_URL + "app_step_one", method: .post, parameters: stepOne.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value
            {
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let loanOptionData = JSON_[kData]![kAPP_Pending] as? JSONDictionary {
                        
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                        let pendingApp = PendingApp()
                        pendingApp.populateWithJSON(dict: loanOptionData)
                        CurrentUser.sharedInstance.pendingApp = pendingApp
                        CurrentUser.sharedInstance.saveToDEfault()
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                    }
                    hideHUD()
//                    UserDefaults.standard.setValue(CompleteStep.BusinessInfo.hashValue, forKey: kCompletedStep)
                    completion(nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    hideHUD()
                    completion(SPErrors.EmptyResultError)
                }
                
            } else {
                hideHUD()
                completion(SPErrors.EmptyResultError)
            }
        }
        
    }
    
    
    
    func getStepOneData(appID: String, stepId: String, completion:@escaping (_ stepOne:LoanStepOne?, _ errror: NSError?) -> ()) {
        
        showHUD()
        print([kApplication_id: appID, kAPP_application_step: stepId])
        Alamofire.request(MAIN_URL + "application/application_detail", method: .post, parameters: [kApplication_id: appID, kAPP_application_step: stepId], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let loanOptionData = JSON_[kData] as? JSONDictionary {
                        let stepOneData = LoanStepOne()
                        stepOneData.populateWithJSON(dict: loanOptionData)
                        completion(stepOneData,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                }else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- Step 2 Mehtods -----
    //MARK:
    
    func loanStepTwo(stepTwo: LoanStepTwo, completion:@escaping (_ error: NSError?) -> ()) {
        
        showHUD()
        Alamofire.request(MAIN_URL + "app_step_two", method: .post, parameters: stepTwo.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    if let loanOptionData = JSON_[kData]![kAPP_Pending] as? JSONDictionary {
                        
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                        let pendingApp = PendingApp()
                        pendingApp.populateWithJSON(dict: loanOptionData)
                        CurrentUser.sharedInstance.pendingApp = pendingApp
                        CurrentUser.sharedInstance.saveToDEfault()
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                    }
                    hideHUD()
                    completion(nil)
//                    UserDefaults.standard.setValue(CompleteStep.CompanyInfo.hashValue, forKey: kCompletedStep)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    func getStepTwoData(appID: String, stepId: String, completion:@escaping (_ stepTwo:LoanStepTwo?, _ errror: NSError?) -> ()) {
        
        showHUD()
        print([kApplication_id: appID, kAPP_application_step: stepId])
        Alamofire.request(MAIN_URL + "application/application_detail", method: .post, parameters: [kApplication_id: appID, kAPP_application_step: stepId], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let loanOptionData = JSON_[kData] as? JSONDictionary {
                        let stepOneData = LoanStepTwo()
                        stepOneData.populateWithJSON(dict: loanOptionData)
                        completion(stepOneData,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                }else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- step 3 Mehtods -----
    //MARK:
    
    func loanStepThree(stepThree: LoanStepThree, completion:@escaping (_ error: NSError?) -> ()) {
        
        showHUD()
        Alamofire.request(MAIN_URL + "app_step_three", method: .post, parameters: stepThree.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            hideHUD()
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let loanOptionData = JSON_[kData]![kAPP_Pending] as? JSONDictionary {
                        
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                        let pendingApp = PendingApp()
                        pendingApp.populateWithJSON(dict: loanOptionData)
                        CurrentUser.sharedInstance.pendingApp = pendingApp
                        CurrentUser.sharedInstance.saveToDEfault()
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                    }
                    hideHUD()
                    completion(nil)
//                    UserDefaults.standard.setValue(CompleteStep.OwnerInfo.hashValue, forKey: kCompletedStep)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    func getStepThreeData(appID: String, stepId: String, completion:@escaping (_ stepThree:LoanStepThree?, _ errror: NSError?) -> ()) {
        
        showHUD()
        print([kApplication_id: appID, kAPP_application_step: stepId])
        Alamofire.request(MAIN_URL + "application/application_detail", method: .post, parameters: [kApplication_id: appID, kAPP_application_step: stepId], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    if let loanOptionData = JSON_[kData] as? JSONDictionary {
                        let stepOneData = LoanStepThree()
                        stepOneData.populateWithJSON(dict: loanOptionData)
                        completion(stepOneData,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                }else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- step 4 Mehtods -----
    //MARK:
    
    func loanStepFour(stepFour: LoanStepFour, completion:@escaping (_ error: NSError?) -> ()) {
        
        showHUD()

        
        Alamofire.request(MAIN_URL + "app_step_four", method: .post, parameters: stepFour.toJsonDictionary(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            hideHUD()
            
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                
                let JSON_ = JSON as! JSONDictionary
                
                if JSON_[kStatus] as? String == kSuccess {
                    completion(nil)
                    if let loanOptionData = JSON_[kData]![kAPP_Pending] as? JSONDictionary {
                        
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                        let pendingApp = PendingApp()
                        pendingApp.populateWithJSON(dict: loanOptionData)
                        CurrentUser.sharedInstance.pendingApp = pendingApp
                        CurrentUser.sharedInstance.saveToDEfault()
                        print(CurrentUser.sharedInstance.toJsonDictionary())
                    }
                    hideHUD()
                    UserDefaults.standard.setValue(nil, forKey: kCompletedStep)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    
    func getStepFourData(appID: String, stepId: String, completion:@escaping (_ stepThree:LoanStepFour?, _ errror: NSError?) -> ()) {
        
        showHUD()
    
        Alamofire.request(MAIN_URL + "application/application_detail", method: .post, parameters: [kApplication_id: appID, kAPP_application_step: stepId], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    if let loanOptionData = JSON_[kData] as? JSONDictionary {
                        let stepOneData = LoanStepFour()
                        stepOneData.populateWithJSON(dict: loanOptionData)
                        completion(stepOneData,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                }else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }

    
    //MARK: ----- Pending app Mehtods -----
    //MARK:
    
    
    func getPendingApp(completion:@escaping (_ pendingApp:PendingApp?, _ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "app_manager", method: .post, parameters: [KUser_id:CurrentUser.sharedInstance.id!], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print(JSON)
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let pendingAppDict = JSON_[kData]![kAPP_Pending] as? JSONDictionary {
                        let pendingApptemp = PendingApp()
                        pendingApptemp.populateWithJSON(dict: pendingAppDict)
                        print(pendingApptemp.toJsonDict())
                        completion(pendingApptemp,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- LoanDetails Mehtods -----
    //MARK:
    
    
    
    
    func getLoanInformation(completion:@escaping (_ loanDetails:[LoanDetails]?, _ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "loan_information", method: .post, parameters: [KUser_id:CurrentUser.sharedInstance.id!], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            if let JSON = response.result.value {
                
                print(JSON)
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    
                    var loanArrTemp = [LoanDetails]()
                    
                    if let loanDetails = JSON_[kData]![kLoanType] as? [JSONDictionary] {
                        
                        for loandetailObj in loanDetails {
                            let loanDetail = LoanDetails()
                            loanDetail.populateWithJson(dict: loandetailObj)
                            loanArrTemp.append(loanDetail)
                        }
                        completion(loanArrTemp,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    //MARK: ----- Get My Applications Mehtods -----
    //MARK:
    
    func myApplications(completion:@escaping (_ myApplication:[MyApplication]?, _ error: NSError?) -> ()) {
        
        Alamofire.request(MAIN_URL + "application/my_application", method: .post, parameters: [KUser_id:CurrentUser.sharedInstance.id!], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            
            
            print(response.result.value)
            
            if let JSON = response.result.value {
                
                print(JSON)
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    
                    var myAppArrTemp = [MyApplication]()
                    
                    if let myAppDetails = JSON_[kData] as? [JSONDictionary] {
                        
                        for myApp in myAppDetails {
                            let myAppTemp = MyApplication()
                            myAppTemp.populateWithJson(dict: myApp)
                            myAppArrTemp.append(myAppTemp)
                        }
                        completion(myAppArrTemp,nil)
                    } else {
                        completion(nil,SPErrors.EmptyResultError)
                    }
                } else {
                    
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }

                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    
    func setscheduleCall(scheduleCall: ScheduleCall, completion: @escaping(_ error: NSError?) -> ()) {
        showHUD()
        Alamofire.request(MAIN_URL + "schedule_call/add_schedule_call", method: .post, parameters: scheduleCall.toJsonDict(), headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            
            print(response.result.value)
            
            if let JSON = response.result.value {
                
                print(JSON)
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    completion(nil)
                    Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                } else {
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(SPErrors.EmptyResultError)
                }
            } else {
                completion(SPErrors.EmptyResultError)
            }
        }
    }
    
    
    func ScoreBiz(completion: @escaping(_ scoreBiz:ScorBiz?,_ error: NSError?) -> ()) {
        showHUD()
        Alamofire.request(MAIN_URL + "app_manager/get_scorebiz", method: .post, parameters: [KUser_id:CurrentUser.sharedInstance.id!], headers: CurrentUser.sharedInstance.setAuthHeader()).responseJSON { response in
            hideHUD()
            
            print(response.result.value)
            
            if let JSON = response.result.value {
                
                print(JSON)
                let JSON_ = JSON as! JSONDictionary
                if JSON_[kStatus] as? String == kSuccess {
                    
                    if let data = JSON_[kData] as? JSONDictionary {
                        let scorBiz = ScorBiz()
                        scorBiz.populateWithJson(dict: data)
                        completion(scorBiz,nil)
                    }
                } else {
                    
                    if JSON_[kapiKey] as? String == kInvalid {
                        Alert.displayInvalidApiKey()
                    } else {
                        Alert.displayAlert(title: APP_NAME, message: JSON_[kMessage] as! String, otherButtonTitles: nil, preferredAlertStyle: .alert, withCompletion: nil)
                    }
                    completion(nil,SPErrors.EmptyResultError)
                }
            } else {
                completion(nil,SPErrors.EmptyResultError)
            }
        }
    }
    
    /*
     "application_id" = 4;
     "bankruptcy_protection" = Y;
     "business_classification" = Retail;
     "business_email" = "";
     "business_fax" = "";
     "business_mobile" = "";
     "business_phone" = "";
     "business_tax_number" = "";
     "business_website" = "";
     "date_business_eslablished" = "0000-00-00";
     "dba_name" = "";
     id = 4;
     "landlord_company_name" = "";
     "landlord_contact_name" = "";
     "landlord_contact_number" = "";
     "legal_business_name" = "";
     "legal_entity" = Crop;
     "mail_apt" = "";
     "mail_city" = "";
     "mail_state" = "";
     "mail_street_name" = "";
     "mail_street_num" = "";
     "mail_zip" = "";
     "months_in_control" = "";
     "phy_apt" = "";
     "phy_city" = "";
     "phy_state" = "";
     "phy_street_name" = "";
     "phy_street_num" = "";
     "phy_zip" = "";
     "product_sold" = "";
     "property_ownership" = Lease;
     "rent_payment" = "";
     "tax_liens_agains_business" = Y;
     "terminal_model" = "";
     "user_id" = 1;
     "years_in_control" = "";
     */
    
}

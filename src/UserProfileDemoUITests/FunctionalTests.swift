//
//  UserProfileDemoUITestsLaunchTests.swift
//  Copyright © 2022 Couchbase Inc. All rights reserved.
//

import XCTest

struct TestingHelper {
    
    static let TESTUSERNAME: String = "demo@example.com"
    static let TESTUSERNAME2: String = "demo1@example.com"
    static let TESTPASSWORD: String = "password"
    static let TESTFULLNAME: String  = "John Doe"
    static let TESTADDRESS:  String = "123 nowhere street"
    
    static let IDUSERNAME: String = "idUsername"
    static let IDPASSWORD: String = "idPassword"
    static let IDLOGIN: String = "idLogin"
}

class FunctionalTests:
    XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApp() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        addScreenshot(application: app, name: "App Launch")
        
        //login demo user
        loginDemoUser(application: app)
       
        //update profile
        UpdateUserProfile(application: app)
        
        //logout
        logout(application: app)
        
        //login demo user  - assert profile was updated
        
        
        //logout
        
        //login user without profile
        
        
        //asert fields are empty

    }
    
    func loginDemoUser(application: XCUIApplication) {
        
        let username = application.textFields[TestingHelper.IDUSERNAME].firstMatch
        let password = application.secureTextFields[TestingHelper.IDPASSWORD].firstMatch
        let btn = application.buttons[TestingHelper.IDLOGIN].firstMatch
            
        username.tap()
        username.typeText(TestingHelper.TESTUSERNAME)
        password.tap()
        password.typeText(TestingHelper.IDPASSWORD)
            
        btn.tap()
    }
    
    func UpdateUserProfile(application: XCUIApplication){
            
    }
    
    func logout(application: XCUIApplication){
        
    }
    
    func addScreenshot(application: XCUIApplication, name: String) {
        let attachment = XCTAttachment(screenshot: application.screenshot())
        attachment.name =  name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

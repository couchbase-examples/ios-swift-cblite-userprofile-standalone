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
    
    static let IDUSERNAME: String = "Username"
    static let IDPASSWORD: String = "Password"
    static let IDLOGIN: String = "idLogin"
    
    static let IDNAME: String = "idName"
    static let IDADDRESS: String = "idAddress"
    static let IDUPDATEIMAGE: String = "idUpdateImage"
    static let NAVIGATIONBAR: String = "Your Profile"
    static let UPDATEIMAGEBUTTONTEXT: String = "Update Image"
    static let DONEBUTTON: String = "Done"
    static let LOGOFFBUTTON: String = "Log Off"
    static let OKBUTTON: String = "OK"
    static let SELECTPHOTOBUTTON: String = "Select From Photo Album"
    static let PHOTONAMESELECT: String = "Photo, August 08, 2012, 5:55 PM"
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
        
        //login demo user
        loginDemoUser(application: app)
       
        //update profile
        UpdateUserProfile(application: app)
        
        //login demo user  - assert profile was updated
        
        
        //logout
        
        //login user without profile
        
        
        //asert fields are empty

    }
    
    func loginDemoUser(application: XCUIApplication) {
        
        let username = application.textFields[TestingHelper.IDUSERNAME]
        let password = application.secureTextFields[TestingHelper.IDPASSWORD]
        let btn = application.buttons[TestingHelper.IDLOGIN]
            
        username.tap()
        username.typeText(TestingHelper.TESTUSERNAME)
        password.tap()
        password.typeText(TestingHelper.IDPASSWORD)
        
        btn.tap()
        sleep(5)
    }
    
    func UpdateUserProfile(application: XCUIApplication){
        let name = application.textFields[TestingHelper.IDNAME]
        let address = application.textFields[TestingHelper.IDADDRESS]
        let btnUpdateImage = application.buttons[TestingHelper.IDUPDATEIMAGE]
        let navBar = application.navigationBars[TestingHelper.NAVIGATIONBAR]
        let doneButton = navBar.buttons[TestingHelper.DONEBUTTON]
        let logOffButton = navBar.buttons[TestingHelper.LOGOFFBUTTON]
        
        name.tap()
        name.typeText(TestingHelper.TESTFULLNAME)
        sleep(1)
        
        //dismiss keyboard
        application.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        address.tap()
        address.typeText(TestingHelper.TESTADDRESS)
        sleep(1)
        
        //dismiss keyboard
        application.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        //update image
        btnUpdateImage.tap()
        sleep(3)
        application.sheets.scrollViews.otherElements.buttons[TestingHelper.SELECTPHOTOBUTTON].tap()
        
        sleep(1)
        application.scrollViews.otherElements.images[TestingHelper.PHOTONAMESELECT].tap()
        
        
        doneButton.tap()
        sleep(1)
        application.alerts.scrollViews.otherElements.buttons[TestingHelper.OKBUTTON].tap()
        
        sleep(1)
        logOffButton.tap()
        
    }
    
    func addScreenshot(application: XCUIApplication, name: String) {
        let attachment = XCTAttachment(screenshot: application.screenshot())
        attachment.name =  name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func recordTesting() {
        let app = XCUIApplication()
        app.launch()
        
    }
}

//  UserProfileDemoUITests
//  Copyright © 2022 Couchbase Inc. All rights reserved.

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
    static let IDEMAIL: String = "idEmail"
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
        
        //arrange - login demo user
        loginDemoUser(application: app)
       
        //act - update profile
        updateUserProfile(application: app)
        
        //arrange - login demo user
        loginDemoUser1(application: app)
        
        //assert - fields are blank because we should be loading a new user
        assertUserProfileDemoUser1(application: app)
       
        //arrange - log back in as demo user and assert values were pulled from db
        loginDemoUser(application: app)
        
        //assert - data was retreived from the database
        assertUserProfileDemoUser(application: app)
    }
    
    //arrange
    func loginDemoUser(application: XCUIApplication) {
        
        let username = application.textFields[TestingHelper.IDUSERNAME]
        let password = application.secureTextFields[TestingHelper.IDPASSWORD]
        let btn = application.buttons[TestingHelper.IDLOGIN]
        let systemVersion = UIDevice.current.systemVersion
        
        username.tap()
        username.typeText(TestingHelper.TESTUSERNAME)
        
        //fix for older IOS versions than 15.x
        if (systemVersion.contains("15.")) {
            password.tap()
            password.typeText(TestingHelper.TESTPASSWORD)
        } else {
            UIPasteboard.general.string = TestingHelper.TESTPASSWORD
            password.press(forDuration: 1.1)
            application.menuItems["Paste"].tap()
            sleep(3)
        }

        btn.tap()
        sleep(3)
    }
    
    //arrange
    func loginDemoUser1(application: XCUIApplication) {
        
        let username = application.textFields[TestingHelper.IDUSERNAME]
        let password = application.secureTextFields[TestingHelper.IDPASSWORD]
        let btn = application.buttons[TestingHelper.IDLOGIN]
        let systemVersion = UIDevice.current.systemVersion
        
        username.tap()
        username.typeText(TestingHelper.TESTUSERNAME2)
        
        //fix for older IOS versions than 15.x
        if (systemVersion.contains("15.")) {
            password.tap()
            password.typeText(TestingHelper.TESTPASSWORD)
        } else {
            UIPasteboard.general.string = TestingHelper.TESTPASSWORD
            password.press(forDuration: 1.1)
            application.menuItems["Paste"].tap()
            sleep(3)
        }
        
        btn.tap()
        sleep(5)
    }
    
    //assert
    func assertUserProfileDemoUser(application: XCUIApplication) {
        let name = application.textFields[TestingHelper.IDNAME].value as! String
        let address = application.textFields[TestingHelper.IDADDRESS].value as! String
        let email = application.staticTexts[TestingHelper.IDEMAIL].label 
        
        let navBar = application.navigationBars[TestingHelper.NAVIGATIONBAR]
        let logOffButton = navBar.buttons[TestingHelper.LOGOFFBUTTON]
       
        //asert
        XCTAssertEqual(name, TestingHelper.TESTFULLNAME)
        XCTAssertEqual(address, TestingHelper.TESTADDRESS)
        XCTAssertEqual(email, TestingHelper.TESTUSERNAME)
        
        logOffButton.tap()
        sleep(5)
    }
    
    //assert
    func assertUserProfileDemoUser1(application: XCUIApplication) {
        let name = application.textFields[TestingHelper.IDNAME].value as! String
        let address = application.textFields[TestingHelper.IDADDRESS].value as! String
        
        let navBar = application.navigationBars[TestingHelper.NAVIGATIONBAR]
        let logOffButton = navBar.buttons[TestingHelper.LOGOFFBUTTON]
       
        //asert
        XCTAssertEqual(name, "Name")
        XCTAssertEqual(address, "Address")
        
        logOffButton.tap()
        sleep(5)
    }
    
    //act
    func updateUserProfile(application: XCUIApplication){
        let name = application.textFields[TestingHelper.IDNAME]
        let address = application.textFields[TestingHelper.IDADDRESS]
        let btnUpdateImage = application.buttons[TestingHelper.IDUPDATEIMAGE]
        let navBar = application.navigationBars[TestingHelper.NAVIGATIONBAR]
        let doneButton = navBar.buttons[TestingHelper.DONEBUTTON]
        let logOffButton = navBar.buttons[TestingHelper.LOGOFFBUTTON]
        
        name.tap()
        sleep(2)
        name.typeText(TestingHelper.TESTFULLNAME)
        sleep(1)
        
        //dismiss keyboard
        application.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        address.tap()
        sleep(2)
        address.typeText(TestingHelper.TESTADDRESS)
        sleep(1)
        
        //dismiss keyboard
        application.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        //update image - only testing on 15.x because UI is different in older OS
        let systemVersion = UIDevice.current.systemVersion
        
        if (systemVersion.contains("15.")) {
            btnUpdateImage.tap()
            sleep(3)
            application.sheets.scrollViews.otherElements.buttons[TestingHelper.SELECTPHOTOBUTTON].tap()
        
            sleep(1)
            
            application.scrollViews.otherElements.images.firstMatch.tap()
            
            sleep(2)
        }
        
        doneButton.tap()
        sleep(2)
        
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
}

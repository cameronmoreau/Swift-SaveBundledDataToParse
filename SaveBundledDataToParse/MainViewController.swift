//
//  ViewController.swift
//  SaveBundledDataToParse
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UITableViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            var cellID: AnyObject! = (cell.textLabel?.text == nil) ? "" : cell.textLabel?.text
            
            switch cellID as! String {
            case "Save single":
                saveSingle(User())
                break
                
            case "Save bundle":
                saveBundle()
                break
                
            default:
                break
            }
        }
    }
    
    func saveSingle(user: User) {
        let object = PFObject(className: "user")
        object["name"] = user.name
        object["email"] = user.email
        object["phone"] = user.phone
        
        object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            self.savedSuccessAlert()
        }
    }
    
    func saveBundle() {
        var object = PFObject(className: "fileTestSave")
        object["testFile"] = PFFile(data: generateUserBundleJson().dataUsingEncoding(NSUTF8StringEncoding)!)
        object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            self.savedSuccessAlert()
        }
    }
    
    func savedSuccessAlert() {
        let alert = UIAlertController(title: "Saved", message: "Data was successfully saved, go check Parse!!", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "k thx bye", style: .Default, handler: nil)
        
        alert.addAction(alertAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func generateUserBundleJson() -> NSString {
        var data = [Dictionary<String, String>]()
        for(var i = 0; i < 200; i++) {
            let user = User()
            data.append([
                "name": user.name,
                "email": user.email,
                "phone": user.phone
            ])
        }
        
        var jsonBytes = NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions(0), error: nil)
        var jsonObj = NSString(data: jsonBytes!, encoding: NSASCIIStringEncoding)
        
        return jsonObj!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! BundleViewController
        destination.jsonData = generateUserBundleJson()
    }

}


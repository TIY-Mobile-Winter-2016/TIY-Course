//MARK: - Utility Method

    func showAlert(title: String, message: String) {

        // step 1
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)

        // Step 2 create actions

        let okAction = UIAlertAction(title: "OK", style: .Default) {
            (alertAction) -> Void in
            print("OK Pressed")
        }

        // Step 3 Add the Actions to the Alert Controller

        alertController.addAction(okAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    }

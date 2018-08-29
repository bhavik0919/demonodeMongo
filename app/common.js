var express = require('express');
var router = express.Router();
var SHA256 = require("crypto-js/sha256");

router.ExceptionMsg = "Oops.. Something bad happaned!";
router.noRecordFoundMsg = "No Record Found!";
router.saveSuccessMsg = "Saved Successfully!";
router.deleteSuccessMsg = "Deleted Successfully!";
router.updatedSuccessMsg = "Updated Successfully!";
router.disabledSuccessMsg = "Disabled Successfully!";
router.passwordChangeSuccessMsg = "Password Changed Successfully!";
router.allreadyassignedSuceessMsg="This Sheet AllReady Assigned!";
router.BASE_URL_Angular ='http://localhost:4200/#/';
router.FromEmail="learningcenter.cognisun@gmail.com";

router.getResponseData = function (err, response) {
    var responseData = {};
    if (err) {
        responseData.success = false;
        responseData.data = {};
        responseData.data.errorMessage = response;
    }
    else {
        responseData.success = true;
        if (Array.isArray(response)) responseData.count = response.length;
        responseData.data = response;
    }
    return responseData;
};
router.getActiveStatus = function () {
    return 'Active';
}

router.getDeleteStatus = function () {
    return 'Delete';
} 
router.getInactiveStatus = function () {
    return 'Inactive';
} 
router.getRequestedStatus = function () {
    return 'Requested';
} 

router.getDateFormat = function () {
    return 'MM/DD/YYYY HH:mm:ss';
}

router.encrypt = function (text) {
    var crypted = SHA256(text);
    return crypted.toString();
}

router.decrypt = function (text) {
    //SHA256.decrypt(text,password)
    return text;
}

module.exports = router;
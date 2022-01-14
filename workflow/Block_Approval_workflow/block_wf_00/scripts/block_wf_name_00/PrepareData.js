var ruleServiceId = "a837184c5f7a4b0ea81d6b79ecffe97e";

// -----------------------------------------------------------------------------------------
// no modifications needed below this line

// copy process initiator into context
$.context.startedBy = $.info.startedBy;

// check if this is the first time we come here (process start) or a rework trip
var decision;
if ($.context.History) {
	// handle rework
	decision = {
		"UserId": $.usertasks.usertask2.last.processor,
		"Role": "Requester",
		"Action": "Reworked",
		"Comment": $.context.comment
	};
} else {
 	// initialize context
	$.context.Requester.RequestDate = new Date().toISOString().slice(0, 10);
	$.context.History = [];
	decision = {
		"UserId": $.info.startedBy,
		"Role": "Requester",
		"Action": "Initial Request",
		"Comment": $.context.Requester.Comment
	};
}

$.context.History.push(decision);
$.context.comment = "";
 
var details = {
    "RequestId": $.context.RequestId,
	"businessPartnerId": $.context.BusinessPartnerDetails.businessPartnerId,
	"businessPartnerFirstName": $.context.BusinessPartnerDetails.businessPartnerFirstName,
	"businessPartnerLastName": $.context.BusinessPartnerDetails.businessPartnerLastName,
	"businessPartnerIsBlocked": $.context.BusinessPartnerDetails.businessPartnerIsBlocked,
    "addressId":$.context.BusinessPartnerAddress.addressId,
    "cityName":$.context.BusinessPartnerAddress.cityName,
    "country":$.context.BusinessPartnerAddress.country,
    "houseNumber":$.context.BusinessPartnerAddress.houseNumber,
    "postalCode":$.context.BusinessPartnerAddress.postalCode,
    "streetName":$.context.BusinessPartnerAddress.streetName
};

var rulesPayload = {
	"RuleServiceId": ruleServiceId,
	"RuleServiceRevision": "Trial",
	"Vocabulary": [ { "PartnerDetails": details } ]
};

var internal = {

};
$.context.internal = internal
$.context.rulesPayload = rulesPayload;
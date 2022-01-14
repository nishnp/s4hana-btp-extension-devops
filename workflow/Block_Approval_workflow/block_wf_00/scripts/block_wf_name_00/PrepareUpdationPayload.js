
var oPayload;

var aAddressData = [];

aAddressData.push({
    Country: $.context.BusinessPartnerAddress.country,
    StreetName: $.context.BusinessPartnerAddress.StreetName,
    HouseNumber: $.context.BusinessPartnerAddress.HouseNumber,
    PostalCode: $.context.BusinessPartnerAddress.PostalCode,
    CityName: $.context.BusinessPartnerAddress.CityName,
});





oPayload = {
    
    FirstName: $.context.BusinessPartnerDetails.businessPartnerFirstName,
    LastName: $.context.BusinessPartnerDetails.businessPartnerLastName,    
    BusinessPartnerIsBlocked: $.context.BusinessPartnerDetails.businessPartnerIsBlocked,
   
}

$.context.internal.BPCreationPayload = {d : oPayload};



var oPayload;

// var aAddressData = [];
// aAddressData.push({
//     Country: $.context.BusinessPartnerAddress.country,
//     StreetName: $.context.BusinessPartnerAddress.StreetName,
//     HouseNumber: $.context.BusinessPartnerAddress.HouseNumber,
//     PostalCode: $.context.BusinessPartnerAddress.PostalCode,
//     CityName: $.context.BusinessPartnerAddress.CityName,
// });
oPayload = {
    CityName: $.context.BusinessPartnerAddress.cityName,
    Country: $.context.BusinessPartnerAddress.country,
    HouseNumber: $.context.BusinessPartnerAddress.houseNumber,
    PostalCode: $.context.BusinessPartnerAddress.postalCode,
    StreetName: $.context.BusinessPartnerAddress.streetName
}


$.context.internal.BPAddressCreationPayload = { d: oPayload };


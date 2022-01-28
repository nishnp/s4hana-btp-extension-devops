{
	"contents": {
		"5963b0f3-ca57-45f0-9c2d-dedb5a988dea": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "blockwf.block_wf_name_00",
			"subject": "block_wf_name_00",
			"name": "block_wf_name_00",
			"documentation": "block status Approval Process",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Block Status Start Request"
				},
				"5e7e1f86-47db-493d-960c-f2966cd5d9b2": {
					"name": "End of Block Flow"
				},
				"cc8e4a6a-b3d2-42b1-b01b-eb1e937e5a32": {
					"name": "EndEvent4"
				}
			},
			"activities": {
				"67882ea8-b30b-470c-bc4a-35459c920218": {
					"name": "Prepare Data"
				},
				"25b10fbc-c8c8-4a97-a5fc-147368d71e21": {
					"name": "Get Approval Details"
				},
				"18defad3-f4dc-4741-9dca-bf5b612e35de": {
					"name": "Await Approval"
				},
				"6dddc281-f691-41df-a997-9320e75ee0ba": {
					"name": "Handle Approval (Manager)"
				},
				"8efe2dd8-d527-4188-a9d2-716fa93473a0": {
					"name": "Business Partner Updation"
				},
				"2016ddd0-aa5c-47ec-b2bf-f38707e5cf07": {
					"name": "Prepare Business Partner Updation Payload"
				},
				"92c6982b-2212-4399-ab41-c49ee1b42ea4": {
					"name": "Manager Approved?"
				},
				"cccd2f2d-d373-43fa-a3c5-019442be2e91": {
					"name": "Prepare Business partner Address Payload"
				},
				"7968d478-92ba-4742-81c6-e2d06ec8c9e1": {
					"name": "business Partner Address Updation"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"46265ccc-2c87-4363-af25-aa9a9f91c026": {
					"name": "SequenceFlow6"
				},
				"79e9e1c2-0d3d-4b19-a090-f7453833f140": {
					"name": "SequenceFlow11"
				},
				"b4d5e898-87ee-4b3e-b73f-e309c27ce7fa": {
					"name": "SequenceFlow13"
				},
				"53c88b28-5a95-480b-851d-448d5b32a7d8": {
					"name": "SequenceFlow15"
				},
				"f1433f99-793d-47fa-952f-5595f3982c0e": {
					"name": "SequenceFlow17"
				},
				"e6e0c028-af68-4a22-ac74-82ba33eb7701": {
					"name": "Approve"
				},
				"57d43db9-0d14-47a0-bb70-6eb009df317f": {
					"name": "Reject"
				},
				"3b5a6ecc-c33c-4cc6-8758-a16cfbc744b9": {
					"name": "SequenceFlow36"
				},
				"8670cef9-b212-4705-a516-f68fe913c24c": {
					"name": "SequenceFlow39"
				},
				"ef278c9c-97d6-4beb-8188-e10fc3709113": {
					"name": "SequenceFlow40"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Block Status Start Request",
			"sampleContextRefs": {
				"69bd2f04-15a6-4b82-b7ca-f9154a79221f": {}
			}
		},
		"5e7e1f86-47db-493d-960c-f2966cd5d9b2": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent3",
			"name": "End of Block Flow",
			"eventDefinitions": {
				"f4a649ce-55c0-4fb5-9a86-62c5f849d3e5": {}
			}
		},
		"cc8e4a6a-b3d2-42b1-b01b-eb1e937e5a32": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent4",
			"name": "EndEvent4",
			"eventDefinitions": {
				"329ecb67-e139-4c48-b39f-02bad0d11dbe": {}
			}
		},
		"67882ea8-b30b-470c-bc4a-35459c920218": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/block_wf_name_00/PrepareData.js",
			"id": "scripttask1",
			"name": "Prepare Data"
		},
		"25b10fbc-c8c8-4a97-a5fc-147368d71e21": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/workingset-rule-services ",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayload}",
			"responseVariable": "${context.approvalStepsResult}",
			"id": "servicetask2",
			"name": "Get Approval Details"
		},
		"18defad3-f4dc-4741-9dca-bf5b612e35de": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for Block Status by your Role  Local Manager",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.approvalStepsResult.Result[0].Approvers.lm_userid}",
			"recipientGroups": "",
			"formReference": "/forms/block_wf_name_00/Block_Approval_Form.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "block_approval_form"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask2",
			"name": "Await Approval"
		},
		"6dddc281-f691-41df-a997-9320e75ee0ba": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/block_wf_name_00/HandleApprovalManager.js",
			"id": "scripttask3",
			"name": "Handle Approval (Manager)"
		},
		"8efe2dd8-d527-4188-a9d2-716fa93473a0": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BusinessPartner",
			"path": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner('${context.BusinessPartnerDetails.businessPartnerId}')",
			"httpMethod": "PATCH",
			"xsrfPath": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner('${context.BusinessPartnerDetails.businessPartnerId}')",
			"requestVariable": "${context.internal.BPCreationPayload}",
			"responseVariable": "${context.UpdationResult}",
			"headers": [],
			"id": "servicetask3",
			"name": "Business Partner Updation"
		},
		"2016ddd0-aa5c-47ec-b2bf-f38707e5cf07": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/block_wf_name_00/PrepareUpdationPayload.js",
			"id": "scripttask4",
			"name": "Prepare Business Partner Updation Payload"
		},
		"92c6982b-2212-4399-ab41-c49ee1b42ea4": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway4",
			"name": "Manager Approved?",
			"default": "57d43db9-0d14-47a0-bb70-6eb009df317f"
		},
		"cccd2f2d-d373-43fa-a3c5-019442be2e91": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/block_wf_name_00/PrepareAddressUpdationPayload.js",
			"id": "scripttask7",
			"name": "Prepare Business partner Address Payload"
		},
		"7968d478-92ba-4742-81c6-e2d06ec8c9e1": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BusinessPartner",
			"path": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartnerAddress(BusinessPartner='${context.BusinessPartnerDetails.businessPartnerId}',AddressID='${context.BusinessPartnerAddress.addressId}')",
			"httpMethod": "PATCH",
			"xsrfPath": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartnerAddress(BusinessPartner='${context.BusinessPartnerDetails.businessPartnerId}',AddressID='${context.BusinessPartnerAddress.addressId}')",
			"requestVariable": "${context.internal.BPAddressCreationPayload}",
			"responseVariable": "${context.AddressUpdationResult}",
			"headers": [],
			"id": "servicetask6",
			"name": "business Partner Address Updation"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "67882ea8-b30b-470c-bc4a-35459c920218"
		},
		"46265ccc-2c87-4363-af25-aa9a9f91c026": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "25b10fbc-c8c8-4a97-a5fc-147368d71e21",
			"targetRef": "18defad3-f4dc-4741-9dca-bf5b612e35de"
		},
		"79e9e1c2-0d3d-4b19-a090-f7453833f140": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "18defad3-f4dc-4741-9dca-bf5b612e35de",
			"targetRef": "6dddc281-f691-41df-a997-9320e75ee0ba"
		},
		"b4d5e898-87ee-4b3e-b73f-e309c27ce7fa": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "6dddc281-f691-41df-a997-9320e75ee0ba",
			"targetRef": "92c6982b-2212-4399-ab41-c49ee1b42ea4"
		},
		"53c88b28-5a95-480b-851d-448d5b32a7d8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "67882ea8-b30b-470c-bc4a-35459c920218",
			"targetRef": "25b10fbc-c8c8-4a97-a5fc-147368d71e21"
		},
		"f1433f99-793d-47fa-952f-5595f3982c0e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07",
			"targetRef": "8efe2dd8-d527-4188-a9d2-716fa93473a0"
		},
		"e6e0c028-af68-4a22-ac74-82ba33eb7701": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.decision==\"Approve\"}",
			"id": "sequenceflow20",
			"name": "Approve",
			"sourceRef": "92c6982b-2212-4399-ab41-c49ee1b42ea4",
			"targetRef": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07"
		},
		"57d43db9-0d14-47a0-bb70-6eb009df317f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "Reject",
			"sourceRef": "92c6982b-2212-4399-ab41-c49ee1b42ea4",
			"targetRef": "cc8e4a6a-b3d2-42b1-b01b-eb1e937e5a32"
		},
		"3b5a6ecc-c33c-4cc6-8758-a16cfbc744b9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow36",
			"name": "SequenceFlow36",
			"sourceRef": "8efe2dd8-d527-4188-a9d2-716fa93473a0",
			"targetRef": "cccd2f2d-d373-43fa-a3c5-019442be2e91"
		},
		"8670cef9-b212-4705-a516-f68fe913c24c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow39",
			"name": "SequenceFlow39",
			"sourceRef": "cccd2f2d-d373-43fa-a3c5-019442be2e91",
			"targetRef": "7968d478-92ba-4742-81c6-e2d06ec8c9e1"
		},
		"ef278c9c-97d6-4beb-8188-e10fc3709113": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow40",
			"name": "SequenceFlow40",
			"sourceRef": "7968d478-92ba-4742-81c6-e2d06ec8c9e1",
			"targetRef": "5e7e1f86-47db-493d-960c-f2966cd5d9b2"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"52749b59-0114-48a5-afc5-80ee734d7023": {},
				"030c9e86-e29a-4125-928c-53db1d96957c": {},
				"26381f9d-2eeb-4064-94db-506d87447f99": {},
				"05ed8651-3747-46ac-b777-b1cd0dc3f48b": {},
				"db74fdd6-f1b5-4eea-a0dc-ab69712835fc": {},
				"82208000-1fb5-4650-8b9f-1b1ff5e0ca1a": {},
				"d863279f-2950-4e11-8c80-1f5c300012b9": {},
				"0c0c36e4-07de-49d8-8e99-859c0726a5cd": {},
				"bf9d825f-924d-4ec1-98f4-d3c4bec832e9": {},
				"57e79f26-916f-40e2-8b7a-b4d9e34aa53a": {},
				"6ef52438-4254-48e5-b662-8798c7bba112": {},
				"105c0c27-5eec-4cb7-b848-47b2d0bd9a88": {},
				"3556fa08-f6e4-4088-8684-5a0f5b6c27a6": {},
				"cfb7661a-88b6-4b19-9f62-81b1e3673afd": {},
				"bdf2ad71-47b2-45f2-888a-58ce189ec7d6": {},
				"f6199025-6124-40ff-bdfb-6f3699567cdc": {},
				"02bf842e-9238-4519-9591-7b3193dc6b88": {},
				"706f3154-088e-4a13-bcd2-7735db77398c": {},
				"94cf4062-b1e4-4150-9bb1-9f64f5c5d854": {},
				"e9eafae2-8040-4a2f-bdd9-910e0b42ed34": {},
				"3ac03688-19cd-4dc5-9c6f-5a915cbc3db6": {}
			}
		},
		"69bd2f04-15a6-4b82-b7ca-f9154a79221f": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/block_wf_name_00/BlockStartRequestPayload.json",
			"id": "default-start-context"
		},
		"f4a649ce-55c0-4fb5-9a86-62c5f849d3e5": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition3"
		},
		"329ecb67-e139-4c48-b39f-02bad0d11dbe": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition4"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 59.5,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,75.5 94,75.5",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "52749b59-0114-48a5-afc5-80ee734d7023",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"52749b59-0114-48a5-afc5-80ee734d7023": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "67882ea8-b30b-470c-bc4a-35459c920218"
		},
		"030c9e86-e29a-4125-928c-53db1d96957c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "25b10fbc-c8c8-4a97-a5fc-147368d71e21"
		},
		"26381f9d-2eeb-4064-94db-506d87447f99": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,75.5 394,75.5",
			"sourceSymbol": "030c9e86-e29a-4125-928c-53db1d96957c",
			"targetSymbol": "db74fdd6-f1b5-4eea-a0dc-ab69712835fc",
			"object": "46265ccc-2c87-4363-af25-aa9a9f91c026"
		},
		"05ed8651-3747-46ac-b777-b1cd0dc3f48b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1517.9999976158142,
			"y": 58,
			"width": 35,
			"height": 35,
			"object": "5e7e1f86-47db-493d-960c-f2966cd5d9b2"
		},
		"db74fdd6-f1b5-4eea-a0dc-ab69712835fc": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 394,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "18defad3-f4dc-4741-9dca-bf5b612e35de"
		},
		"82208000-1fb5-4650-8b9f-1b1ff5e0ca1a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "494,75.5 544,75.5",
			"sourceSymbol": "db74fdd6-f1b5-4eea-a0dc-ab69712835fc",
			"targetSymbol": "d863279f-2950-4e11-8c80-1f5c300012b9",
			"object": "79e9e1c2-0d3d-4b19-a090-f7453833f140"
		},
		"d863279f-2950-4e11-8c80-1f5c300012b9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 544,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "6dddc281-f691-41df-a997-9320e75ee0ba"
		},
		"0c0c36e4-07de-49d8-8e99-859c0726a5cd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "644,75.5 694,75.5",
			"sourceSymbol": "d863279f-2950-4e11-8c80-1f5c300012b9",
			"targetSymbol": "3556fa08-f6e4-4088-8684-5a0f5b6c27a6",
			"object": "b4d5e898-87ee-4b3e-b73f-e309c27ce7fa"
		},
		"bf9d825f-924d-4ec1-98f4-d3c4bec832e9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,75.5 244,75.5",
			"sourceSymbol": "52749b59-0114-48a5-afc5-80ee734d7023",
			"targetSymbol": "030c9e86-e29a-4125-928c-53db1d96957c",
			"object": "53c88b28-5a95-480b-851d-448d5b32a7d8"
		},
		"57e79f26-916f-40e2-8b7a-b4d9e34aa53a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1067.9999976158142,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "8efe2dd8-d527-4188-a9d2-716fa93473a0"
		},
		"6ef52438-4254-48e5-b662-8798c7bba112": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 917.9999976158142,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07"
		},
		"105c0c27-5eec-4cb7-b848-47b2d0bd9a88": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1017.9999976158142,75.5 1067.9999976158142,75.5",
			"sourceSymbol": "6ef52438-4254-48e5-b662-8798c7bba112",
			"targetSymbol": "57e79f26-916f-40e2-8b7a-b4d9e34aa53a",
			"object": "f1433f99-793d-47fa-952f-5595f3982c0e"
		},
		"3556fa08-f6e4-4088-8684-5a0f5b6c27a6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 694,
			"y": 54.5,
			"object": "92c6982b-2212-4399-ab41-c49ee1b42ea4"
		},
		"cfb7661a-88b6-4b19-9f62-81b1e3673afd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "715,75.5 967.9999976158142,75.5",
			"sourceSymbol": "3556fa08-f6e4-4088-8684-5a0f5b6c27a6",
			"targetSymbol": "6ef52438-4254-48e5-b662-8798c7bba112",
			"object": "e6e0c028-af68-4a22-ac74-82ba33eb7701"
		},
		"bdf2ad71-47b2-45f2-888a-58ce189ec7d6": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 805.9999988079071,
			"y": 12,
			"width": 35,
			"height": 35,
			"object": "cc8e4a6a-b3d2-42b1-b01b-eb1e937e5a32"
		},
		"f6199025-6124-40ff-bdfb-6f3699567cdc": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "736,75.5 770.9999994039536,75.5 770.9999994039536,29.5 805.9999988079071,29.5",
			"sourceSymbol": "3556fa08-f6e4-4088-8684-5a0f5b6c27a6",
			"targetSymbol": "bdf2ad71-47b2-45f2-888a-58ce189ec7d6",
			"object": "57d43db9-0d14-47a0-bb70-6eb009df317f"
		},
		"02bf842e-9238-4519-9591-7b3193dc6b88": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1217.9999976158142,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "cccd2f2d-d373-43fa-a3c5-019442be2e91"
		},
		"706f3154-088e-4a13-bcd2-7735db77398c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1367.9999976158142,
			"y": 45.5,
			"width": 100,
			"height": 60,
			"object": "7968d478-92ba-4742-81c6-e2d06ec8c9e1"
		},
		"94cf4062-b1e4-4150-9bb1-9f64f5c5d854": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1167.9999976158142,75.5 1217.9999976158142,75.5",
			"sourceSymbol": "57e79f26-916f-40e2-8b7a-b4d9e34aa53a",
			"targetSymbol": "02bf842e-9238-4519-9591-7b3193dc6b88",
			"object": "3b5a6ecc-c33c-4cc6-8758-a16cfbc744b9"
		},
		"e9eafae2-8040-4a2f-bdd9-910e0b42ed34": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1317.9999976158142,75.5 1367.9999976158142,75.5",
			"sourceSymbol": "02bf842e-9238-4519-9591-7b3193dc6b88",
			"targetSymbol": "706f3154-088e-4a13-bcd2-7735db77398c",
			"object": "8670cef9-b212-4705-a516-f68fe913c24c"
		},
		"3ac03688-19cd-4dc5-9c6f-5a915cbc3db6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1467.9999976158142,75.5 1517.9999976158142,75.5",
			"sourceSymbol": "706f3154-088e-4a13-bcd2-7735db77398c",
			"targetSymbol": "05ed8651-3747-46ac-b777-b1cd0dc3f48b",
			"object": "ef278c9c-97d6-4beb-8188-e10fc3709113"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 4,
			"hubapireference": 1,
			"sequenceflow": 40,
			"startevent": 1,
			"endevent": 4,
			"usertask": 2,
			"servicetask": 6,
			"scripttask": 7,
			"exclusivegateway": 4,
			"parallelgateway": 5
		}
	}
}
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
					"name": "Prepare Updation Payload"
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
				"ab1de4bb-9c03-45ab-927b-b343237c6f79": {
					"name": "SequenceFlow16"
				},
				"f1433f99-793d-47fa-952f-5595f3982c0e": {
					"name": "SequenceFlow17"
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
		"67882ea8-b30b-470c-bc4a-35459c920218": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/block_wf_name_00/PrepareData.js",
			"id": "scripttask1",
			"name": "Prepare Data"
		},
		"25b10fbc-c8c8-4a97-a5fc-147368d71e21": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/rule-services",
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
			"recipientUsers": "${context.approvalStepsResult.Result[0].Approvers.lm_userid},${info.startedBy},${context.Requester.Email}",
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
			"name": "Prepare Updation Payload"
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
			"targetRef": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07"
		},
		"53c88b28-5a95-480b-851d-448d5b32a7d8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "67882ea8-b30b-470c-bc4a-35459c920218",
			"targetRef": "25b10fbc-c8c8-4a97-a5fc-147368d71e21"
		},
		"ab1de4bb-9c03-45ab-927b-b343237c6f79": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "8efe2dd8-d527-4188-a9d2-716fa93473a0",
			"targetRef": "5e7e1f86-47db-493d-960c-f2966cd5d9b2"
		},
		"f1433f99-793d-47fa-952f-5595f3982c0e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07",
			"targetRef": "8efe2dd8-d527-4188-a9d2-716fa93473a0"
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
				"a81c6eba-6699-4c8e-a887-f93c4bf79f8a": {},
				"6ef52438-4254-48e5-b662-8798c7bba112": {},
				"105c0c27-5eec-4cb7-b848-47b2d0bd9a88": {}
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
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,42 94,42",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "52749b59-0114-48a5-afc5-80ee734d7023",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"52749b59-0114-48a5-afc5-80ee734d7023": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "67882ea8-b30b-470c-bc4a-35459c920218"
		},
		"030c9e86-e29a-4125-928c-53db1d96957c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "25b10fbc-c8c8-4a97-a5fc-147368d71e21"
		},
		"26381f9d-2eeb-4064-94db-506d87447f99": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,42 394,42",
			"sourceSymbol": "030c9e86-e29a-4125-928c-53db1d96957c",
			"targetSymbol": "db74fdd6-f1b5-4eea-a0dc-ab69712835fc",
			"object": "46265ccc-2c87-4363-af25-aa9a9f91c026"
		},
		"05ed8651-3747-46ac-b777-b1cd0dc3f48b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 994,
			"y": 24.5,
			"width": 35,
			"height": 35,
			"object": "5e7e1f86-47db-493d-960c-f2966cd5d9b2"
		},
		"db74fdd6-f1b5-4eea-a0dc-ab69712835fc": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 394,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "18defad3-f4dc-4741-9dca-bf5b612e35de"
		},
		"82208000-1fb5-4650-8b9f-1b1ff5e0ca1a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "494,42 544,42",
			"sourceSymbol": "db74fdd6-f1b5-4eea-a0dc-ab69712835fc",
			"targetSymbol": "d863279f-2950-4e11-8c80-1f5c300012b9",
			"object": "79e9e1c2-0d3d-4b19-a090-f7453833f140"
		},
		"d863279f-2950-4e11-8c80-1f5c300012b9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 544,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "6dddc281-f691-41df-a997-9320e75ee0ba"
		},
		"0c0c36e4-07de-49d8-8e99-859c0726a5cd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "644,42 694,42",
			"sourceSymbol": "d863279f-2950-4e11-8c80-1f5c300012b9",
			"targetSymbol": "6ef52438-4254-48e5-b662-8798c7bba112",
			"object": "b4d5e898-87ee-4b3e-b73f-e309c27ce7fa"
		},
		"bf9d825f-924d-4ec1-98f4-d3c4bec832e9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,42 244,42",
			"sourceSymbol": "52749b59-0114-48a5-afc5-80ee734d7023",
			"targetSymbol": "030c9e86-e29a-4125-928c-53db1d96957c",
			"object": "53c88b28-5a95-480b-851d-448d5b32a7d8"
		},
		"57e79f26-916f-40e2-8b7a-b4d9e34aa53a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 844,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "8efe2dd8-d527-4188-a9d2-716fa93473a0"
		},
		"a81c6eba-6699-4c8e-a887-f93c4bf79f8a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "944,42 994,42",
			"sourceSymbol": "57e79f26-916f-40e2-8b7a-b4d9e34aa53a",
			"targetSymbol": "05ed8651-3747-46ac-b777-b1cd0dc3f48b",
			"object": "ab1de4bb-9c03-45ab-927b-b343237c6f79"
		},
		"6ef52438-4254-48e5-b662-8798c7bba112": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 694,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "2016ddd0-aa5c-47ec-b2bf-f38707e5cf07"
		},
		"105c0c27-5eec-4cb7-b848-47b2d0bd9a88": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "794,42 844,42",
			"sourceSymbol": "6ef52438-4254-48e5-b662-8798c7bba112",
			"targetSymbol": "57e79f26-916f-40e2-8b7a-b4d9e34aa53a",
			"object": "f1433f99-793d-47fa-952f-5595f3982c0e"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 3,
			"sequenceflow": 19,
			"startevent": 1,
			"endevent": 3,
			"usertask": 2,
			"servicetask": 4,
			"scripttask": 5,
			"exclusivegateway": 3
		}
	}
}
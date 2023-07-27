___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Type Convertor",
  "description": "Convert value or other variable into the desired type.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "type",
    "displayName": "Type",
    "radioItems": [
      {
        "value": "makeInteger",
        "displayValue": "Integer"
      },
      {
        "value": "makeNumber",
        "displayValue": "Number"
      },
      {
        "value": "makeString",
        "displayValue": "String"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "value",
    "displayName": "Value",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');

if (data.type === 'makeInteger') return makeInteger(data.value);
if (data.type === 'makeNumber') return makeNumber(data.value);

return makeString(data.value);


___TESTS___

scenarios:
- name: String
  code: |-
    const mockData = {
      value: 1.1,
      type: 'makeString'
    };

    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('1.1');
- name: Number
  code: |-
    const mockData = {
      value: '1.1',
      type: 'makeNumber'
    };

    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(1.1);
- name: Integer
  code: |-
    const mockData = {
      value: 1.1,
      type: 'makeInteger'
    };

    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(1);


___NOTES___

Created on 27/07/2023, 15:21:05



import boto3
import os
import json
 
DESTINATION_PHONE_NUMBER = os.getenv('DESTINATION_PHONE_NUMBER')
SOURCE_PHONE_NUMBER = os.getenv('SOURCE_PHONE_NUMBER')
INSTANCE_ID = os.getenv('INSTANCE_ID')
CONTACT_FLOW_ID = os.getenv('CONTACT_FLOW_ID')
 
connect = boto3.client('connect')

def lambda_handler(event, context) -> None:
    connect.start_outbound_voice_contact(
        DestinationPhoneNumber=DESTINATION_PHONE_NUMBER,
        ContactFlowId=CONTACT_FLOW_ID,
        InstanceId=INSTANCE_ID,
        SourcePhoneNumber=SOURCE_PHONE_NUMBER,
        Attributes={
            'message': 'これはテストメッセージです。'
        }
    )

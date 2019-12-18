import json


def lambda_handler(event, context) -> None:
    print(json.dumps(event))
    return {
        'statusCode': 200
    }

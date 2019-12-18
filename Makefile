BUCKET_NAME := any-bucket
DESTINATION_PHONE_NUMBER := +819011112222
SOURCE_PHONE_NUMBER := +818099998888
INSTANCE_ID := 2e71038c-7443-401f-9f87-d30a3a2c7330
CONTACT_FLOW_ID := 8626eca3-4290-4eef-8db7-19374e353e93



build:
	sam build

deploy:
	sam package \
		--output-template-file packaged.yaml \
		--s3-bucket $(BUCKET_NAME)

	sam deploy \
		--template-file packaged.yaml \
		--stack-name $$(basename `pwd`)-Stack \
		--capabilities CAPABILITY_NAMED_IAM \
		--no-fail-on-empty-changeset \
		--parameter-overrides \
			DestinationPhoneNumber=$(DESTINATION_PHONE_NUMBER) \
			SourcePhoneNumber=$(SOURCE_PHONE_NUMBER) \
			InstanceId=$(INSTANCE_ID) \
			ContactFlowId=$(CONTACT_FLOW_ID)

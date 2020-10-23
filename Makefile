.PHONY: deploy
deploy:
	read -p "Enter function name: " FUNCTION; \
	read -p "Enter project id   : " PROJECT_ID; \
	read -p "Enter env file     : " ENV_FILE; \
	read -p "Enter cloud region : " REGION; \
	read -p "Enter runtime      : " RUNTIME; \
	read -p "Enter topic name   : " TOPIC; \
	gcloud functions deploy $$FUNCTION --env-vars-file $$ENV_FILE --region $$REGION --runtime $$RUNTIME --trigger-topic $$TOPIC --project $$PROJECT_ID --allow-unauthenticated

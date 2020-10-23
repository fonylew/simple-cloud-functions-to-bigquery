# simple-cloud-functions-to-bigquery
Cloud Functions streaming insert to BigQuery (with Cloud Pub/Sub trigger). In this example, the function will make a REST API call to get a data and insert to BigQuery.

# Steps
1. Create BigQuery table with a proper schema (using Google Cloud Console).
2. Create a Pub/Sub topic. When deploy Cloud Functions via Console (web UI), there is a button to create a topic.
3. Deploy Cloud Function. (alternatively: use `make deploy` as a prompt deploy command)
4. Set Cloud Scheduler.

# Deploy
To use command line `make deploy`, Google Cloud SDK must be installed locally. (https://cloud.google.com/sdk/docs/install)

The command will prompt for these information:
```
Enter function name: # The name of entrypoint function
Enter project id   : # Project id, noted that it can be different from project name
Enter env file     : # A yaml file that contains environment variables (optional)
Enter cloud region : # A zone which the function will be deployed 
Enter runtime      : # Runtime, for python, use `python37` or `python38`
Enter topic name   : # A name of Cloud Pub/Sub topic for deploying pub/sub trigger function
```

# Reference
- Google Cloud Functions example: https://github.com/GoogleCloudPlatform/python-docs-samples/blob/master/functions/helloworld/main.py
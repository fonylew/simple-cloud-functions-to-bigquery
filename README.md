# simple-cloud-functions-to-bigquery
Cloud Functions streaming insert to BigQuery (with Cloud Pub/Sub trigger). In this example, the function will make a REST API call to get a data and insert to BigQuery.

# Steps to run
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

# Workflow
We added GitHub Action workflow to auto-deploy this function when there is a merge to master branch.

Please follow these steps to setup the workflow:
1. In GCP IAM, Create new service account with Cloud Functions Admin permission
2. Generate new key. Download secret key as JSON.
3. In GCP IAM, add @.iam.gserviceaccount.com with role Service Account User as a member on the root service account <Project_name>@appspot.gserviceaccount.com
4. Create new secret GCP_PROJ_NAME with value = project ID e.g. root-sanctuary-01234
5. Create new secret GCP_CREDENTIALS with value = base64-encoded JSON value from the content of the file in 2.
6. Create cloud pubsub topic 
7. Test run this workflow. It should create new Cloud Function in the project.

# Reference
- Google Cloud Functions example: https://github.com/GoogleCloudPlatform/python-docs-samples/blob/master/functions/helloworld/main.py

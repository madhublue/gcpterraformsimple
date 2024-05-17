# Enable cloudbuild.googleapis.com IN GCP

## For building docker
1) docker build -t "yourprojectname" .
2) docker tag "your projectname" "gcppath" (docker tag simpleapi us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/simpleapi:1.0)
3) docker push "gcppath" or use 
or 

1) gcloud builds submit --tag us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/simpleapi:1.0


Service Account name: terraformsimpleapicloudrun

docker tag fastapi us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/fastapi:1.0


// configure docker
gcloud auth configure-docker us-central1-docker.pkg.dev

gcloud builds submit --tag us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo


gcloud builds submit --tag us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/fastapi:1.0

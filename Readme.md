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



// To Deploy

1) gcloud builds submit --tag us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/fastapi:1.0

1) Terraform init 
2) Terraform plan
3) Terraform --auto-approve apply



Cloud Build Editor
Cloud Run Admin
Compute Storage Admin
Service Account User

Cloud Build Service Account (roles/cloudbuild.builds.editor)
Storage Admin (roles/storage.admin)
Cloud Run Admin (roles/run.admin)
Service Account User (roles/iam.serviceAccountUser)


RBAC = Role based access control 

for local in terraform google provider

// use  credentials = file("localkitchen101-08aa9be91899.json")

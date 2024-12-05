# Static Website Hosting on S3 using Terraform
This repository contains the Terraform configuration used to automate the deployment and setup of a static website hosted on Amazon S3. The entire infrastructure is defined and managed with Terraform, ensuring a repeatable and scalable process for provisioning resources. 

## Architectural diagram

<img width="571" alt="Screenshot 2024-12-05 at 11 55 13 AM" src="https://github.com/user-attachments/assets/ec4f13d2-334d-420d-ac24-d0ff6e968cdb">


## The key steps in the process:

**Steps:**
1. Created an S3 Bucket: The first step was to create an Amazon S3 bucket using Terraform, which will serve as the storage for the static website's files. Taken name of the bucket from variables.tf file

2. Changed Ownership of the Bucket: After the bucket was created, ownership was changed to ensure that the appropriate AWS account has full control over the resources.

3. Enabled Public Access: The bucket's permissions were updated to allow public access, which is required for serving static website content to users over the internet.

4. Applied ACL Settings: An Access Control List (ACL) was applied to the bucket to manage read and write permissions effectively, allowing public read access for the files stored in the bucket.

5. Uploaded Website Files: The index.html and error.html files were uploaded to the S3 bucket, serving as the main content and error page for the website.

6. Enabled Static Website Hosting: Finally, the S3 bucket was configured to enable static website hosting, specifying the index.html as the homepage and the error.html as the error page. 

6. URL: Write output.tf file to take the website endpoint so that to access the website

## How to Use
1. Clone this repository and run the provided Terraform configurations to automatically provision an S3 bucket, set permissions, upload files, and enable static website hosting.
2. This setup ensures that the website is hosted securely with public access to the content and can be scaled or modified as needed.
3. This repository is ideal for anyone looking to host a static website on AWS using Terraform for infrastructure automation, ensuring a streamlined and repeatable process for deployment.

## Screen shots 
<img width="1388" alt="Screenshot 2024-12-05 at 10 56 09 AM" src="https://github.com/user-attachments/assets/bd74a351-4f8c-46c5-8112-6d5a89b41754">
<img width="1247" alt="Screenshot 2024-12-05 at 10 56 34 AM" src="https://github.com/user-attachments/assets/309d9875-2062-453d-8bef-92fc85ca5978">



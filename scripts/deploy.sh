cd src

# Package SAM template
sam package --template-file template.yml --s3-bucket icar-deploy --output-template-file packaged.yml

# Deploy packaged SAM template
sam deploy --template-file packaged.yml --stack-name icar-serverless --capabilities CAPABILITY_IAM  
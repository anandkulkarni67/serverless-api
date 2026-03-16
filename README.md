# A Serverless API deployed to AWS API Gateway served from Lambda with CICD implementation using Github actions.

## Change directory to API
```
cd api
```

## download and install dependencies
```
npm install
```

## Compiles the project
```
npm run build
```

## Compiles and minifiesthe project for production deployment
```
npm run build
```

## Run the api locally
```
sam local start-api
```

## AWS Stacks creation
```
Recommended Order:
1. Application
2. Security
```

## GitHub integration
```
1. Go to AWS Console -> AWS CodePipeline -> Settings ( Left Side-panel ) -> Connections
2. Click on the pending connection.
3. Follow the prompts on screen to establish connection between AWS and Github repository/s.
```
